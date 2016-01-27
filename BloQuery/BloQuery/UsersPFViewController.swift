//
//  UsersPFViewController.swift
//  BloQuery
//
//  Created by Eric Chamberlin on 1/26/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import ParseUI
import Parse
import Bolts



class UsersPFViewController: PFQueryTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func queryForUsers() -> PFQuery {
        let query : PFQuery = PFUser.query()!
        query.includeKey("username")
        query.includeKey("email")
        query.findObjectsInBackground()
        query.cachePolicy = .CacheThenNetwork
        query.orderByDescending("createdAt")
        return query
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("usersCell",
            forIndexPath: indexPath) as! usersTableViewCell
        
        
        cell.userName.text = object?.objectForKey("username") as? String
        cell.userEmail.text = object?.objectForKey("email") as? String
        //cell.userDate.text = object?.objectForKey("createdAt") as? Date
        
        
        return cell
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
