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

@IBOutlet weak var currentQuestionLabel: UILabel!
    
    var currentObject : PFObject?
    var votes = 0
    
        override func viewDidLoad() {
            super.viewDidLoad()
            if let object = currentObject {
                currentQuestionLabel.text = (object["question"] as! String)
                print("\(currentObject)")
            }
    }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
    
    func queryForUsers() -> PFQuery {
        let query = PFQuery(className:"Question")
        query.cachePolicy = .CacheThenNetwork
        query.orderByDescending("createdAt")
        return query
        
    }
    
    func queryForAnswers() -> PFQuery {
        let query = PFQuery(className:"Answer")
        query.cachePolicy = .CacheThenNetwork
        query.orderByDescending("createdAt")
        return query
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("answersCell", forIndexPath: indexPath) as! answersTableViewCell
        //cell.currentQuestionLabel.text = object?.objectForKey("question") as? String
        cell.answersLabel.text = object?.objectForKey("answer") as? String
        //cell.votesLabel.setValue(votes, forKey: String) = votes.count
        return cell
    }
        /*
        @IBAction func addNotes(sender: UIButton) {
            
            var inputTextField: UITextField?
            
            let alertController = UIAlertController(title: "Answer Please", message: "Be Smart, Clear and Concise", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "Post", style: .Default, handler: { (action) -> Void in
                // Do whatever you want with inputTextField?.text
                print("\(inputTextField?.text)")
                //self.placeNotes.text = inputTextField?.text
                
                let newAnswer:PFObject = PFObject();
                
                //newAnswer.answers = inputTextField?.text
                
                newAnswer.saveInBackground()
                
            })
            let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in }
            
            alertController.addAction(ok)
            alertController.addAction(cancel)
            
            alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
                inputTextField = textField
            }
            
            presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        */
    
    
    @IBAction func upvoteButton(sender: AnyObject) {
        
        votes++
        sender.setTitle(String(votes), forState: UIControlState.Normal)
        print("\(votes)")
        
    }
        
        
    
        
    @IBAction func answerButton(sender: AnyObject) {
        
        var inputTextField: UITextField?
        
        let alertController = UIAlertController(title: "Add an answer", message: "Make it a good one!", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
           
            print("\(inputTextField?.text)")
            let newAnswer = PFObject(className:"Answer")
            //let questionAuthor = PFObject(className: "Questions", dictionary: [String : "userEyeD]?)
            newAnswer["answer"] = inputTextField?.text
            newAnswer["userID"] = PFUser.currentUser()
            //newAnswer["questionID"] = PFObject.setObject("Question")
            //newAnswer["question"] = PFObject.setObject("Question")
            
            newAnswer.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // The object has been saved.
                    print("Question saved")
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
        

