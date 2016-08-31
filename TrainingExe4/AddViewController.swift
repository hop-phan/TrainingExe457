//
//  AddiewController.swift
//  TrainingExe4
//
//  Created by HopPD on 8/27/16.
//  Copyright © 2016 HopPD. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    let date = NSDate()
    
    //MARK:Properties
    
    @IBOutlet weak var avValue: UITextField!
    
    @IBOutlet weak var loviValue: UITextField!
    
    @IBOutlet weak var btnsave: UIButton!
    
    var model1:model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAdd(sender: AnyObject) {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("AVResult", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue(Float(avValue.text!), forKey: "avValue")
        newUser.setValue(Int(loviValue.text!), forKey: "loviValue")
        do {
            try context.save()
        } catch is ErrorType {
            print("Invalid Selection.")
        }
    }
    
    
    @IBAction func check(sender: AnyObject) {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "AVResult")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.executeFetchRequest(request)
            for result :AnyObject in results{
                print (result.valueForKey("avValue"))
            }
        } catch is ErrorType {
            print("Invalid Selection.")
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if  btnsave === sender {
            let AvValue = Float(avValue.text!)
            let LoviValue = Int(loviValue.text!)
            let photo1 = UIImage(named: "a2")!
            model1 = model(captureDate: date, avValue: AvValue!, loviValue: LoviValue!, photo:photo1)! }
    }
    
}
