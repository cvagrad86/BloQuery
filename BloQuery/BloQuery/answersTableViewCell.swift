//
//  answersTableViewCell.swift
//  BloQuery
//
//  Created by Eric Chamberlin on 1/7/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class answersTableViewCell: PFTableViewCell {
    
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var upVotesButton: UIButton!
    @IBOutlet weak var downVotesButton: UIButton!

    
    
    var voteAdded = 0
    var parseObject : PFObject?
    var currentAnswer : PFObject?
    var objectID: String!
    
    
    override func awakeFromNib() {
        //if let object = currentAnswer {
            //answersLabel.text = (object["Answer"] as! String)
            // donesnt work - answersLabel.text = object.objectForKey("answer") as? String
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.blackColor().CGColor
    }
    
  
    @IBAction func downBoteButton(sender: AnyObject) {
        voteAdded--
        print("vote retracted")
        
        downVotesButton = sender as! UIButton
        
        if(parseObject != nil) {
            if var votes:Int? = parseObject!.objectForKey("vote") as? Int {
                votes!--
                
                parseObject!.setObject(votes!, forKey: "vote");
                parseObject!.saveInBackground();
                
                votesLabel?.text = "\(votes!) vote";
            } else {
                
            }
        }
        
        downVotesButton.alpha = 0.0
        
    }
    @IBAction func upvoteButton(sender: AnyObject) {
        voteAdded++
        print("vote added")
        
        upVotesButton = sender as! UIButton
        
        UIView.animateWithDuration(1.0, animations:{
            self.upVotesButton.frame = CGRectMake(self.upVotesButton.frame.origin.x + 0, self.upVotesButton.frame.origin.y + 100, self.upVotesButton.frame.size.width, self.upVotesButton.frame.size.height)
        
        })
        if(parseObject != nil) {
            if var votes:Int? = parseObject!.objectForKey("vote") as? Int {
                votes!++
                
                parseObject!.setObject(votes!, forKey: "vote");
                parseObject!.saveInBackground();
                
                votesLabel?.text = "\(votes!) vote";
            } else {
                
            }
        }

        upVotesButton.alpha = 0.0
        
        }
        
        
    }
    

