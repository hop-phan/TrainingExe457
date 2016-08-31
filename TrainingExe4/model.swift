//
//  model.swift
//  TrainingExe4
//
//  Created by HopPD on 8/26/16.
//  Copyright © 2016 HopPD. All rights reserved.
//

import Foundation
import UIKit

class model {
    
    // MARK: Properties
    var captureDate : NSDate
    var avValue :Float
    var loviValue:Int
    var photo: UIImage?
    
    // MARK: Initialization
    init? ( captureDate : NSDate, avValue :Float ,loviValue:Int ,photo: UIImage? ){
        self.captureDate = captureDate
        self.avValue = avValue
        self.loviValue = loviValue
        self.photo = photo
    }
    
}

