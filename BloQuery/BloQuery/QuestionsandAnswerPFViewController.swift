//
//  QuestionsandAnswerPFViewController.swift
//  BloQuery
//
//  Created by Eric Chamberlin on 1/7/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import ParseUI
import Parse
import Bolts

class QuestionsandAnswerPFViewController: PFQueryTableViewController {

    @IBOutlet weak var controller: UISegmentedControl!
    @IBOutlet weak var currentQuestionLabel: UILabel!

    //let ericsSpecialNotificationKey = "com.ericchamberlin.letsski"

    var connectedAnswers : PFObject?
    var currentObject : PFObject?
    var votes = 0
    
    override func viewDidLoad() {
            super.viewDidLoad()
            if let object = currentObject {
                currentQuestionLabel.text = (object["question"] as! String)
            }
            
          //NSNotificationCenter.defaultCenter().addObserver(self, selector: "newVoteForAnswer", name: ericsSpecialNotificationKey, object: nil)
            
            print("\(currentObject)")
            
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
   
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }

    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "Answer")
        query.includeKey("questionID")
        query.cachePolicy = .CacheThenNetwork
        query.orderByDescending("vote")
        return query
        
    }
   
        
        
        //attempts
        //query.orderByDescending("createdAt")
        //query.whereKey("questionID", equalTo: currentObject!)
        //query.includeKey("answer")
        //query.includeKey("questionID")
        //query.selectKeys("answer") as! String
    

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("answersCell", forIndexPath: indexPath) as! answersTableViewCell
        
        if let pfObject = object {
            //cell.votesLabel?.text = pfObject["vote"] as? String
            
            var votes:Int? = pfObject["vote"] as? Int
            if votes == nil {
                votes = 0
            }
            cell.votesLabel?.text = "\(votes!) votes"
        
        
        // this results in displaying the current question ID
            //cell.answersLabel.text = currentObject?.objectId
            
            //this results in all answers
            
            if ((currentObject?.objectForKey("answer")) != nil) {
                cell.answersLabel.text = object?.objectForKey("answer") as? String
            } else {
                cell.answersLabel.text = "No answers yet"
            }
        
        
        cell.objectID = object?.objectId

      
        // this return nil/crash if let object = connectedAnswers {
           // cell.answersLabel.text = (object["answer"] as! String)
        //}
        cell.parseObject = object
        
        
    }
       return cell 
    }
    
    
/*
    this was attempt to use segmented controller to sort table view

    @IBAction func sortAnswers(sender: UISegmentedControl) {
        if controller.selectedSegmentIndex == 0 {
            print("Date Added")
        }
        if controller.selectedSegmentIndex == 1 {
            print("votes")
        }
    }
*/
    
    @IBAction func answerButton(sender: AnyObject) {
        
        var inputTextField: UITextField?
        
        let alertController = UIAlertController(title: "Add an answer", message: "Make it a good one!", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
           
            print("\(inputTextField?.text)")
            
            let newAnswer = PFObject(className:"Answer")
            newAnswer["answer"] = inputTextField?.text
            newAnswer["userID"] = PFUser.currentUser()
            newAnswer["questionID"] = self.currentObject
            newAnswer["vote"] = 1 
            newAnswer.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    
                    print("Question saved")
                    //self.tableView.reloadData()
                    NSNotificationCenter.defaultCenter().postNotificationName(newPostFromUser, object: self)
                    
                } else {
                    print("something went wrong")
                }
                self.tableView.reloadData()
                
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in }
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            inputTextField = textField
        }
        
        presentViewController(alertController, animated: true, completion: nil)
        
        
        
    }

    }







        

