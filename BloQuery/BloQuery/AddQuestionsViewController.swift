//
//  AddQuestionsViewController.swift
//  BloQuery
//
//  Created by Eric Chamberlin on 1/3/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Parse


class AddQuestionsViewController: UIViewController {

    @IBOutlet weak var userQuestion: UITextField!
    
    let ericsSpecialNotificationKey = "com.ericchamberlin.letsski"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addQuestion(sender: UIButton) {
    
    let newQuestion = PFObject(className:"Questions")
   //let questionAuthor = PFObject(className: "Questions", dictionary: [String : "userEyeD]?)
    newQuestion["question"] = userQuestion.text
    newQuestion["userEyeD"] = PFUser.currentUser()


    newQuestion.saveInBackgroundWithBlock {
    (success: Bool, error: NSError?) -> Void in
    if (success) {
    // The object has been saved.
        print("Question saved")
        //print("\(userEyeD)")
        //NSNotificationCenter.defaultCenter().postNotificationName(newPostFromUser, object: self)
        NSNotificationCenter.defaultCenter().postNotificationName(self.ericsSpecialNotificationKey, object: self)
        
    } else {
    // There was a problem, check error.description
        print("something went wrong")
    }
    }
        
    
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


