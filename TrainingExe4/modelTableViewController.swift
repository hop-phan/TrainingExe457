//
//  modelTableViewController.swift
//  TrainingExe4
//
//  Created by HopPD on 8/26/16.
//  Copyright © 2016 HopPD. All rights reserved.
//

import UIKit

class modelTableViewController: UITableViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var editbtn: UIBarButtonItem!
    @IBOutlet weak var movebtn: UIBarButtonItem!
    
    var moveClick : Bool = false
    var editClick : Bool = false
    
    let dateFormatter = NSDateFormatter()
    var models = [model]()
    let date = NSDate()
    var avValue : String!
    var loviValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleModels()        
    }
   
    
    
    @IBAction func move(sender: AnyObject) {
        moveClick = !moveClick
        if (tableView.editing == true){
            tableView.setEditing(false, animated: true)
        } else {
            tableView.setEditing(true, animated: true)
        }
        
        if (!moveClick){
            self.navigationItem.leftBarButtonItem!.enabled = true
        }
        else {
            self.navigationItem.leftBarButtonItem!.enabled = false
        }
        
    }
    
    @IBAction func showAddVC(sender: AnyObject) {
        self.performSegueWithIdentifier("showAddSegue", sender: self)
    }
   
    
    @IBAction func editAction(sender: AnyObject) {
        editClick = !editClick
        
        if (!editClick){
            movebtn.enabled = true
            tableView.setEditing(false, animated: true)
            
        }
        else {
            movebtn.enabled = false
            tableView.setEditing(true, animated: true)
        }
        
    }
    func loadSampleModels(){
        let photo1 = UIImage(named: "a1")!
        let model1 = model(captureDate: date, avValue: 4.5, loviValue: 4, photo: photo1)!
        
        let photo2 = UIImage(named: "a2")!
        let model2 = model(captureDate: date, avValue: 5.5, loviValue: 5, photo: photo2)!
        
        let photo3 = UIImage(named: "a3")!
        let model3 = model(captureDate: date, avValue: 6.5, loviValue: 6, photo: photo3)!
        models += [model1, model2, model3]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return models.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CustomCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! customCellTableViewCell        
        let model = models[indexPath.row]
        cell.captureDate.text = String(model.captureDate)
        cell.av.text = String(model.avValue)
        cell.lovi.text = String(model.loviValue)
        cell.photo.image = model.photo
        // Configure the cell...
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            models.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if (moveClick){
            return UITableViewCellEditingStyle.None
        }
        
        if (editClick){
            return UITableViewCellEditingStyle.Delete
        }
        return UITableViewCellEditingStyle.Delete
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the  item to be re-orderable.
        return true
    }
    
    @IBAction func unWindToModelList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? AddViewController, model1 = sourceViewController.model1{
            //Add a new model
            let newIndexPath = NSIndexPath(forRow: models.count, inSection: 0)
            models.append(model1)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showInfoSegue"){
            let infoVC  = segue.destinationViewController as? InfoViewController
            if let selectedModelCell = sender as? customCellTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedModelCell)!
                let selectedModel = models[indexPath.row]
                infoVC!.modelInfo = selectedModel
            }
        }
        
    }
}
