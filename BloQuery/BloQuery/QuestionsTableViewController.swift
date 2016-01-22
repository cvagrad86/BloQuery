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
        query.orderByDescending("createdAt")
        //print("\(ObjectIdentifier)().self")
        return query
        
    }
    
    func queryForUsers() -> PFQuery {
        let query = PFQuery(className: "Users")
        query.cachePolicy = .CacheThenNetwork
        query.orderByDescending("createdAt")
        return query
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("questionsCell", forIndexPath: indexPath) as! questionsTableViewCell
        cell.questionLabel.text = object?.objectForKey("question") as? String
        cell.userdetailsLabel.text = object?.objectForKey("username") as? String
        
        return cell
    }
    
    func reloadTable() {
        print("success")
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let objectToDelete = (objects?[indexPath.row])! as PFObject
            objectToDelete.deleteInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // Force a reload of the table - fetching fresh data from Parse platform
                    self.loadObjects()
                } else {
                    // There was a problem, check error.description
                }
            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let nav = segue.destinationViewController as! UINavigationController
        let controller = nav.topViewController as! QuestionsandAnswerPFViewController
        
        if segue.identifier == "showQuestion" {
            
            let indexPath = tableView.indexPathForSelectedRow
                //let row = Int(indexPath.row)
                controller.currentObject = self.objects![indexPath!.row]
        }
            //let questionAsked = [indexPath?.row] as! String
            //controller.question = questionAsked
            //let placeLat = places[indexPath!.row].latitude
            //controller.placeSelected = placeSelected
        }
    


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showQuestion", sender: self)
        
        }

    }


