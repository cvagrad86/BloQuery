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

    let ericsSpecialNotificationKey = "com.ericchamberlin.letsski"

    var parseObject : PFObject?
    var currentObject : PFObject?
    var votes = 0
    //var voteButton = UIButton!.self
    
        override func viewDidLoad() {
            super.viewDidLoad()
            if let object = currentObject {
                currentQuestionLabel.text = (object["question"] as! String)
            }
          NSNotificationCenter.defaultCenter().addObserver(self, selector: "newVoteForAnswer", name: ericsSpecialNotificationKey, object: nil)
            
            print("\(currentObject)")
            
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.parseClassName = "Answer"
        self.textKey = "answer"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
   
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
    
    
    /*
    func queryForUsers() -> PFQuery {
        let query = PFQuery(className:"Question")
        query.whereKey("question", equalTo: currentObject!)
        query.cachePolicy = .CacheThenNetwork
        query.orderByDescending("createdAt")
        return query
        
    }
*/

    
    func queryForAnswers() -> PFQuery {
        let query = PFQuery(className:"Answer")
        //query.whereKey("questionID", equalTo: currentObject!)
        //query.includeKey("answer")
        query.whereKey("questionID", equalTo: "K9oj7B386B")
        //query.selectKeys("answer") as! String
        query.cachePolicy = .CacheThenNetwork
        //query.orderByDescending("createdAt")
        return query

    }
    
   
    
    /*
    func queryForAnswers() -> PFQuery {
    let query = PFQuery(className: "Comment")
    query.whereKey("post", equalTo: myPost)
    query.findObjectsInBackgroundWithBlock {
    (comments: [PFObject]?, error: NSError?) -> Void in
    // comments now contains the comments for myPost
    }
    
    // Using NSPredicate
    let predicate = NSPredicate(format: "post = %@", myPost)
    let query = PFQuery(className: "Comment", predicate: predicate)
    
    query.findObjectsInBackgroundWithBlock {
    (comments: [PFObject]?, error: NSError?) -> Void in
    // comments now contains the comments for myPost
    }
    
    */
    
    //func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
      //
    //}

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("answersCell", forIndexPath: indexPath) as! answersTableViewCell
        
        cell.answersLabel.text = object?.objectForKey("answer") as? String
      
        return cell
    }
    
    

    @IBAction func sortAnswers(sender: UISegmentedControl) {
        
        if controller.selectedSegmentIndex == 0 {
            print("Date Added")
        }
        
        if controller.selectedSegmentIndex == 1 {
            print("votes")
        }
    }
    
    
    @IBAction func answerButton(sender: AnyObject) {
        
        var inputTextField: UITextField?
        
        let alertController = UIAlertController(title: "Add an answer", message: "Make it a good one!", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
           
            print("\(inputTextField?.text)")
            
            let newAnswer = PFObject(className:"Answer")
            
            newAnswer["answer"] = inputTextField?.text
            newAnswer["userID"] = PFUser.currentUser()
            newAnswer["questionID"] = self.currentObject
            
            newAnswer.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // The object has been saved.
                    print("Question saved")
                    //self.tableView.reloadData()
                    NSNotificationCenter.defaultCenter().postNotificationName(newPostFromUser, object: self)
                    
                } else {
                    // There was a problem, check error.description
                    print("something went wrong")
                }
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






        /*
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        }
        */
        

