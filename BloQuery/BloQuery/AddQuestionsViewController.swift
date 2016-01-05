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
   
    newQuestion["question"] = userQuestion.text
    
    newQuestion.saveInBackgroundWithBlock {
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


