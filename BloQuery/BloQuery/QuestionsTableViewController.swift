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


class QuestionsTableViewController: PFQueryTableViewController {

    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "Questions")
        query.cachePolicy = .CacheElseNetwork
        query.orderByDescending("createdAt")
        return query
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("questionsCell", forIndexPath: indexPath) as! questionsTableViewCell
        cell.questionLabel.text = object?.objectForKey("question") as? String
        return cell
    }
}

