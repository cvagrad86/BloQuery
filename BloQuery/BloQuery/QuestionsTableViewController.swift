//
//  QuestionsTableViewController.swift
//  BloQuery
//
//  Created by Eric Chamberlin on 1/5/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import ParseUI
import Parse
import Bolts

let newPostFromUser = "NewPostAdded"

class QuestionsTableViewController: PFQueryTableViewController {

    //NSNotification - to change the data
    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "Questions")
        query.includeKey("userEyeD")
        query.cachePolicy = .CacheThenNetwork
        query.orderByAscending("createdAt")
        return query
        
    }
    
    func queryForUsers() -> PFQuery {
        let query : PFQuery = PFUser.query()!
        query.includeKey("username")
        query.includeKey("email")
        query.cachePolicy = .CacheThenNetwork
        query.orderByDescending("createdAt")
        return query
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("questionsCell",
            forIndexPath: indexPath) as! questionsTableViewCell
        
        
        cell.questionLabel.text = object?.objectForKey("question") as? String
        cell.userdetailsLabel.text = object?.objectForKey("username") as? String
            //PFUser.currentUser()!.username
        //cell.dateAdded.text = object?.objectForKey("createdAt") as? String
        
        return cell
    }
    
    func reloadTable() {
        print("success")
    }
    
   
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let objectToDelete = (objects?[indexPath.row])! as PFObject
            objectToDelete.deleteInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    
                    self.loadObjects()
                } else {
                    
                }
            }
        } else if editingStyle == .Insert {
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let nav = segue.destinationViewController as! UINavigationController
        let controller = nav.topViewController as! QuestionsandAnswerPFViewController
        
        if segue.identifier == "showQuestion" {
            
            let indexPath = tableView.indexPathForSelectedRow
            
                controller.currentObject = self.objects![indexPath!.row]
                //resulted in carsh = nil value
            //controller.connectedAnswers = self.objects![indexPath!.row]
        }
        
        }
    


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showQuestion", sender: self)
        
        }

    }


