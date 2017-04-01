//
//  CarouselCarouselViewController.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var firstBackgroundImageView: UIImageView!
    @IBOutlet weak var secondBackgroundImageView: UIImageView!
    
    // MARK: - Variables
    var output: CarouselViewOutput!
    
    var cardsViewControllers: [CarouselCardViewController] = []
    var viewModels: [CarouselCardViewModel] = [] {
        didSet {
            createViewControllers()
            carousel.reloadData()
            updateBackgroundColor()
        }
    }
    var itemWidth: CGFloat = 298
    var itemHeight: CGFloat = 420
    
    var radiusIncrease: CGFloat = {
        switch Constants.Screen.actualSize {
        case .iphone5:
            return 80
        case .iphone6:
            return 95
        case .iphone6p:
            return 115
        }
    }()
    
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
    
    // MARK: - Private
    func setupCarousel() {
        carousel.type = .rotary
        carousel.isVertical = false
        carousel.isPagingEnabled = true
        carousel.delegate = self
        carousel.perspective = -0.003
        carousel.dataSource = self
        carousel.bounces = false
    }
    
    func createViewControllers() {
        var viewControllers: [CarouselCardViewController] = [];
        
        for viewModel in viewModels {
            let card = UIStoryboard(name: "Carousel", bundle: nil).instantiateViewController(withIdentifier: "Card") as! CarouselCardViewController
            card.view.frame = CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight);
            card.setup(viewModel: viewModel)
            viewControllers.append(card)
        }
        self.cardsViewControllers = viewControllers;
    }
    
    func updateBackgroundColor() {
        guard viewModels.count > 0 else {
            return
        }
        let higher = carousel.scrollOffset.rounded(.awayFromZero)
        let lower = carousel.scrollOffset.rounded(.down)
        let offset = carousel.scrollOffset - lower
        
        let topImage = viewModels[max(Int(lower), 0)].backgroundImage
        let bottomImage = viewModels[min(Int(higher), viewModels.count - 1)].backgroundImage
        
        if firstBackgroundImageView.image != bottomImage {
            firstBackgroundImageView.image = bottomImage
        }
        if secondBackgroundImageView.image != topImage {
            secondBackgroundImageView.image = topImage
        }
        
        firstBackgroundImageView.alpha = offset
        secondBackgroundImageView.alpha = 1 - offset
    }
}

// MARK: - CarouselViewInput
extension CarouselViewController: CarouselViewInput {
    func setupInitialState() {
        setupCarousel()
    }

    func setupStateForViewWillAppear() {
    }

    func setupStateForViewWillDisappear() {
    }
    
    func show(viewModels: [CarouselCardViewModel]) {
        self.viewModels = viewModels
    }
}

extension CarouselViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return cardsViewControllers.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        return cardsViewControllers[index].view
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        switch option {
        case .wrap:
            return 0;
            
        case .showBackfaces:
            return 0;
            
        case .radius:
            return max(6 * (self.itemWidth + radiusIncrease) / CGFloat(M_PI),
                       12 * self.itemWidth / 2 / CGFloat(M_PI));
            
        case .visibleItems:
            return 3;
            
        case .arc:
            return min(CGFloat(M_PI / 6) * CGFloat(self.cardsViewControllers.count), 2 * CGFloat(M_PI));
            
        default:
            return value;
        }
    }
    
    func carousel(_ carousel: iCarousel, shouldSelectItemAt index: Int) -> Bool {
        return false
    }
    
    func carouselItemWidth(_ carousel: iCarousel) -> CGFloat {
        return itemWidth
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        updateBackgroundColor()
    }
}
