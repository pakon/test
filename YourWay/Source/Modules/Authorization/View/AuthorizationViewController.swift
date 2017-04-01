//
//  AuthorizationViewController.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loginConatiner: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordConatiner: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var inputForm: UIView!
    @IBOutlet weak var bottomSpacing: UIView!
    
    @IBOutlet weak var inputFormBottomConstraint: NSLayoutConstraint!

    // MARK: - Variables
    var output: AuthorizationViewOutput!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }

    // MARK: - Actions
    
    @IBAction func logInButtonDidTap() {
        output.logInButtonDidTap()
    }
    
    @IBAction func loginTextFieldEditingChanged(_ textField: UITextField) {
        output.loginEntered(textField.text ?? "")
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ textField: UITextField) {
        output.passwordEntered(textField.text ?? "")
    }
    
    @IBAction func loginTextFieldEditingDidBegin(_ textField: UITextField) {
        highlightContainerSubviews(loginConatiner, withColor: .white)
    }
    
    @IBAction func passwordTextFieldEditingDidBegin(_ textField: UITextField) {
        highlightContainerSubviews(passwordConatiner, withColor: .white)
    }
    
    // MARK: - Private
    
    fileprivate func highlightContainerSubviews(_ container: UIView, withColor color: UIColor) {
        for view in container.subviews {
            if let imageView = view as? UIImageView {
                imageView.backgroundColor = color
                continue
            }
            
            if let label = view as? UILabel {
                label.textColor = color
                continue
            }
            
            if let textField = view as? UITextField {
                textField.textColor = color
                continue
            }
        }
    }
}

// MARK: - AuthorizationViewInput

extension AuthorizationViewController: AuthorizationViewInput {
    func setupInitialState() {
        let loginTap = UITapGestureRecognizer(target: loginTextField, action: #selector(becomeFirstResponder))
        loginConatiner.addGestureRecognizer(loginTap)
        
        let passwordTap = UITapGestureRecognizer(target: passwordTextField, action: #selector(becomeFirstResponder))
        passwordConatiner.addGestureRecognizer(passwordTap)
        
        let backgroundTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(backgroundTap)
        
        logInButton.setBackgroundImage(UIImage.imageFromColor(.yourWayYellow), for: .normal)
        
        errorLabel.textColor = .yourWayYellow
    }

    func setupStateForViewWillAppear() {
        subscribeForKeyboardNotifications()
    }

    func setupStateForViewWillDisappear() {
        unsubscribeFromKeyboardNotifications()
    }
    
    func showLogInButton() {
        logInButton.isHidden = false
    }
    
    func hideLogInButton() {
        logInButton.isHidden = true
    }
    
    func showError(_ error: String, forLogin: Bool, forPassword: Bool) {
        self.errorLabel.text = error
        if forLogin {
            highlightContainerSubviews(loginConatiner, withColor: .yourWayYellow)
        }
        if forPassword {
            highlightContainerSubviews(passwordConatiner, withColor: .yourWayYellow)
        }
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20, 20, -20, 20, -10, 10, -5, 5, 0]
        logInButton.layer.add(animation, forKey:"shake")
    }
    
    func clearError() {
        self.errorLabel.text = ""
        highlightContainerSubviews(loginConatiner, withColor: .white)
        highlightContainerSubviews(passwordConatiner, withColor: .white)
    }
    
    func adjustViewForKeyboardHeight(_ height: Double, withAnimationDuration animationDuration: Double, animationCurve: UInt) {
        adjustViewForKeyboardHeight(CGFloat(height), withAnimationDuration: animationDuration, animationCurve: animationCurve)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Keyboard

extension AuthorizationViewController {
    fileprivate func subscribeForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    fileprivate func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(output, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
            let keyboardHeight = (view.window?.frame.height)! - keyboardFrame.origin.y

            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! UInt
            
            output.keyboardHeightChanged(Double(keyboardHeight), withAnimationDuration: duration, animationCurve: curve)
        }
    }
    
    fileprivate func adjustViewForKeyboardHeight(_ height: CGFloat, withAnimationDuration duration: TimeInterval, animationCurve: UInt) {
        let newOffset = max(0, (height - bottomSpacing.frame.height))
        if newOffset == inputFormBottomConstraint.constant {
            return
        }
        
        inputFormBottomConstraint.constant = newOffset
        UIView.transition(with: view, duration: duration, options: [UIViewAnimationOptions(rawValue: animationCurve), .beginFromCurrentState], animations: { 
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
