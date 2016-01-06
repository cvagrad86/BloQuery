//
//  QuestionAndAnswersViewController.swift
//  BloQuery
//
//  Created by Eric Chamberlin on 1/5/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import ParseUI
import Parse
import Bolts

class QuestionAndAnswersViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFQuery(className: "Questions")
        
        //self.question.text = query
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNotes(sender: UIButton) {
        
        var inputTextField: UITextField?
        
        let alertController = UIAlertController(title: "Answer Please", message: "Be Smart, Clear and Concise", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Post", style: .Default, handler: { (action) -> Void in
            // Do whatever you want with inputTextField?.text
            print("\(inputTextField?.text)")
            //self.placeNotes.text = inputTextField?.text
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in }
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            inputTextField = textField
        }
        
        presentViewController(alertController, animated: true, completion: nil)
        
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
