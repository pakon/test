//
//  WayStepTableViewCell.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

class WayStepTableViewCell: UITableViewCell, YourWayTableViewCellProtocol {
    
    
    @IBOutlet weak var leftIconImageView: UIImageView!
    
    @IBOutlet weak var stepDescriptionLabel: UILabel!
    
    @IBOutlet weak var openButton: UIButton!
    
    @IBOutlet weak var stepStateImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clear
        openButton.layer.cornerRadius = 10
    }

    func setup(with viewModel: YourWayTableViewCellViewModel, indexPath: IndexPath) {
        let model = viewModel as! WayStepViewModel
        leftIconImageView.image = model.leftIcon
        openButton.isHidden = !model.openButtonShowed
        stepDescriptionLabel.text = model.title
        stepStateImageView.image = model.stateIcon
    }

}
