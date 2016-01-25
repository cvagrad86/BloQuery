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
    @IBOutlet weak var votesButton: UIButton!
    
    var votes = PFObject(className: "Answer")
    var voteAdded = 0
    var parseObject : PFObject?
    var currentAnswer : PFObject?
    
    
    override func awakeFromNib() {
        if let object = currentAnswer {
            answersLabel.text = (object["Answer"] as! String)
            // donesnt work - answersLabel.text = object.objectForKey("answer") as? String
        }
    }
        
    @IBAction func upvoteButton(sender: AnyObject) {
        voteAdded++
        print("vote added")
        votesLabel.text = "\(voteAdded) votes"
        
        votesButton = sender as! UIButton
        
        UIView.animateWithDuration(1.0, animations:{
            self.votesButton.frame = CGRectMake(self.votesButton.frame.origin.x + 0, self.votesButton.frame.origin.y + 100, self.votesButton.frame.size.width, self.votesButton.frame.size.height)
        
        })
        let newVote = PFObject(className:"Answer")
        newVote["vote"] = votesLabel.text
        
        votesButton.alpha = 0.0
        
        
            votes.incrementKey("vote", byAmount: 1)
            votes.saveInBackground()
            
        }
        
        
    }
    

