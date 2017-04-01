//
//  WayViewManager.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

class WayViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    
    var viewModels: [WayStepViewModel] = []
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wayStepCell") as! YourWayTableViewCellProtocol
        let viewModel = viewModels[indexPath.row]
        cell.setup(with: viewModel, indexPath: indexPath)
        return cell as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModel = viewModels[indexPath.row]
        return viewModel.height
    }
    
}
