//
//  Transition.swift
//  memento
//
//  Created by Valentin Popkov on 23.11.16.
//  Copyright © 2016 Memento Ly. All rights reserved.
//

import Foundation
import UIKit

protocol ViperModuleTransitionHandler: class {
    
    var moduleInput: ViperModuleInput? { get set }
    
    func openModule(with segueIdentifier: String) -> (ViperOpenModulePromise)
    func closeModule(animated: Bool)
}

protocol ViperModuleOutput { }

protocol ViperModuleInput {
    
    var moduleOutput: ViperModuleOutput? { get set }
}

typealias ViperModuleLinkClosure = (_ moduleInput: ViperModuleInput) -> (ViperModuleOutput?)

fileprivate var moduleInputName: UInt8 = 0
fileprivate var moduleOutputName: UInt8 = 1

// moduleInput as associated object for ViperModuleTransitionHandler protocol.
extension ViperModuleTransitionHandler {
    
    var moduleInput: ViperModuleInput? {
        get {
            return objc_getAssociatedObject(self, &moduleInputName) as? ViperModuleInput
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &moduleInputName,
                    newValue as ViperModuleInput?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}

// moduleOutput as associated object for ViperModuleInput protocol.
extension ViperModuleInput {
    
    var moduleOutput: ViperModuleOutput? {
        get {
            return objc_getAssociatedObject(self, &moduleOutputName) as? ViperModuleOutput
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &moduleOutputName,
                    newValue as ViperModuleOutput?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}

// Promise that performs linkClosure on moduleInput and set moduleOutput to moduleInput when linkClosure and moduleInput will be set.
class ViperOpenModulePromise {
    
    public var moduleInput: ViperModuleInput? {
        didSet {
            moduleInputWasSet = true;
            self.tryPerformLink()
        }
    }

    private var linkClosure: ViperModuleLinkClosure?
    private var linkClosureWasSet: Bool = false
    private var moduleInputWasSet: Bool = false
    
    public func thenChainUsingClosure(_ linkClosure: ViperModuleLinkClosure?) {
        self.linkClosure = linkClosure
        linkClosureWasSet = true
        tryPerformLink()
    }

    private func tryPerformLink() {
        if (linkClosureWasSet && moduleInputWasSet) {
            performLink()
        }
    }
    
    private func performLink() {
        if let linkClosure = linkClosure,
            var moduleInput = moduleInput {
            let moduleOutput = linkClosure(moduleInput)
            moduleInput.moduleOutput = moduleOutput
        }
    }
}

// openModule method realization. Creates promise and performs segue.
extension UIViewController: ViperModuleTransitionHandler {

    func openModule(with segueIdentifier: String) -> (ViperOpenModulePromise) {
        
        let openModulePromise = ViperOpenModulePromise()
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: segueIdentifier, sender: openModulePromise)
        }
        return openModulePromise
    }
    
    func closeModule(animated: Bool) {
        if let navigationController = parent as? UINavigationController {
            if navigationController.childViewControllers.count > 1 {
                navigationController.popViewController(animated: animated)
            } else {
                dismiss(animated: animated, completion: nil)
            }
        } else if presentingViewController != nil {
            dismiss(animated: animated, completion: nil)
        } else if view.superview != nil {
            removeFromParentViewController()
            view.removeFromSuperview()
        }
    }
}

// Swizzle prepare(for segue: UIStoryboardSegue sender: Any?)
fileprivate let swizzling: (UIViewController.Type) -> () = { viewController in
    
    let originalSelector = #selector(viewController.prepare(for:sender:))
    let swizzledSelector = #selector(viewController.mmtios_prepare(for:sender:))
    
    let originalMethod = class_getInstanceMethod(viewController, originalSelector)
    let swizzledMethod = class_getInstanceMethod(viewController, swizzledSelector)
    
    let didAddMethod = class_addMethod(viewController, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    
    if didAddMethod {
        class_replaceMethod(viewController, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}


extension UIViewController {
    
    open override class func initialize() {
        // make sure this isn't a subclass
        guard self === UIViewController.self else { return }
        swizzling(self)
    }
    
    // Swizzled method that checks whether sender is promise and sets segue.destination (or its top-most VC, if UINavigationController) as promise's moduleInput property
    func mmtios_prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.mmtios_prepare(for: segue, sender: sender)
        
        if (sender as? ViperOpenModulePromise) == nil {
            return
        }
        
        var destinationViewController = segue.destination
        
        if let navigationController = segue.destination as? UINavigationController {
            destinationViewController = navigationController.topViewController!
        }
        
        let openModulePromise = sender as! ViperOpenModulePromise
        openModulePromise.moduleInput = destinationViewController.moduleInput
    }
}


