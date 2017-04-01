//
//  WayStepTableViewCell.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

class WayStepTableViewCell: UITableViewCell, YourWayTableViewCellProtocol {
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clear
    }

    func setup(with viewModel: YourWayTableViewCellViewModel, indexPath: IndexPath) {
        print("setup")
    }

}
