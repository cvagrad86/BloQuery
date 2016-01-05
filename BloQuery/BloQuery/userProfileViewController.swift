//
//  userProfileViewController.swift
//  BloQuery
//
//  Created by Eric Chamberlin on 1/5/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class userProfileViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    
    let user = PFUser.currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.userName.text =
        print("\(user)")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func queryForTable(object: PFObject?) -> PFQuery {
        let query = PFQuery(className: "User")
        query.cachePolicy = .CacheElseNetwork
        userName.text = object?.objectForKey("username") as? String
        print("/(username)")
        return query

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
