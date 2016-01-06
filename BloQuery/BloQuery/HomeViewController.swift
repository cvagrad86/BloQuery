//
//  HomeViewController.swift
//  BloQuery
//
//  Created by Eric Chamberlin on 1/3/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Parse


class HomeViewController: UIViewController {
    
    @IBOutlet weak var profilePhoto: UIImageView!

        var user = PFUser.currentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.profilePhoto.layer.cornerRadius = self.profilePhoto.frame.size.width / 2;
        self.profilePhoto.layer.cornerRadius = 10.0
        self.profilePhoto.clipsToBounds = true
        self.profilePhoto.layer.borderWidth = 3.0
        //self.profilePhoto.layer.borderColor = [UIColor whiteColor].CGColor;

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if (PFUser.currentUser() == nil) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login") as! UIViewController
                self.presentViewController(viewController, animated: true, completion: nil)
                
                print("\(self.user)")
            })
        }
    }
    

   
    }


