//
//  YourWayCell.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

protocol YourWayTableViewCellViewModel {
    var height: CGFloat { get }
    var reuseIdentifier: String { get }
}
protocol YourWayTableViewCellProtocol {
    func setup(with viewModel: YourWayTableViewCellViewModel, indexPath: IndexPath)
}

extension YourWayTableViewCellViewModel {
    var reuseIdentifier: String {
        return String(describing: type(of: self)).replacingOccurrences(of: ".Type", with: "").replacingOccurrences(of: "ViewModel", with: "")
    }
}

public enum YourWayTableViewCellError: Error {
    case invalidViewModelType
}
