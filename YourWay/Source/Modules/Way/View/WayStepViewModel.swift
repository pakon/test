
//
//  WayStepViewModel
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit

class WayStepViewModel: NSObject, YourWayTableViewCellViewModel {
    var height: CGFloat {
        return 140
    }
    var reuseIdentifier: String {
        return "wayStepCell"
    }
    
    var title: String = ""
    var leftIcon: UIImage? = nil
    var openButtonShowed: Bool = false
    var stateIcon: UIImage? = nil
    
    init(entity: Step) {
        self.title = entity.todayTitle
        self.openButtonShowed = false
        self.leftIcon = UIImage(named: entity.opportunities.first!.category!.iconAssetName)!
        self.stateIcon = entity.state.icon
    }
    
    init(currentStep: Step) {
        self.title = currentStep.todayTitle
        self.openButtonShowed = true
        self.leftIcon = #imageLiteral(resourceName: "icon_lock_open")
        self.stateIcon = nil
    }
    
    override init() {
        super.init()
    }
}
