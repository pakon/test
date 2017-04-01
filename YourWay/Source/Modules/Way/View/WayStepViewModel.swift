
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
}
