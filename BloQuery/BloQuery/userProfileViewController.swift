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


class userProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    let user = PFUser.currentUser
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.userName.text =
        print("\(user)")
        imagePicker.delegate = self
        
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

    
   
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImageView.contentMode = .ScaleAspectFit
            myImageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveProfile(sender: AnyObject) {
        var image = myImageView.image
        let imageData = UIImagePNGRepresentation(image!)
        let imageFile = PFFile(name:"image.png", data:imageData!)
        
        var userPhoto = PFObject(className:"profilePicture")
        userPhoto.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            
            if (success) {
                // The object has been saved.
                print("Photo saved")
                NSNotificationCenter.defaultCenter().postNotificationName(newPostFromUser, object: self)
                
            } else {
                // There was a problem, check error.description
                print("something went wrong")
            }

    }
    }
    
    
    /*
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      
    
    let nav = segue.destinationViewController as! UINavigationController
    let controller = nav.topViewController as! HomeViewController
    
    if segue.identifier == "updateProfile" {
    
    let newPhoto   = myImageView.image
    //let row = Int(indexPath.row)
    controller.profilePhoto = myImageView.image as? UIImageView
    }
    //let questionAsked = [indexPath?.row] as! String
    //controller.question = questionAsked
    //let placeLat = places[indexPath!.row].latitude
    //controller.placeSelected = placeSelected
}
*/


}


