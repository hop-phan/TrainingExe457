//
//  InfoViewController.swift
//  TrainingExe4
//
//  Created by HopPD on 8/30/16.
//  Copyright © 2016 HopPD. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    //MARK:Properties
    var string1 : String?
    var string2 : String?
    
    var isPresent : Bool = false
    var isClickBack: Bool = false
    @IBOutlet weak var avValue: UILabel!
    @IBOutlet weak var loviValue: UILabel!
    
    var modelInfo : model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = modelInfo {
            avValue.text = String(modelInfo!.avValue)
            loviValue.text = String(modelInfo!.loviValue)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

extension UIViewController {
    func isPresenting() -> Bool {
        if self.presentationController != nil {
            return true
        } else if self.presentingViewController?.presentedViewController == self {
            return true
        } else if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController {
            return true
        } else if self.tabBarController?.presentingViewController != nil {
            guard let vc =  self.tabBarController?.presentingViewController else { return false }
            if vc.isKindOfClass(UITabBarController.self) {
                return true
            }
        }
        return false
    }
}
