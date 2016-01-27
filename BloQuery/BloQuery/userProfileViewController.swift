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
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userSince: UILabel!
    
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    let user = PFUser.currentUser
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(user)")
        imagePicker.delegate = self
        userName.text = PFUser.currentUser()!.username

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        /*
        if myImageView.image == nil {
            print("Image not uploaded")
        }else {
            
           //cant use this as it creates new User Class which is mayhem.
            
            let newUserPhoto = PFObject(className: "User")
            newUserPhoto["uploader"] = PFUser.currentUser()
            newUserPhoto.saveInBackgroundWithBlock({
                (success: Bool, error: NSError?) -> Void in
                
                if error == nil {
                
                    let imageData = UIImagePNGRepresentation(self.myImageView.image!)
                    let parseImageFile = PFFile(name: "uploaded_image.png", data: imageData!)
                    newUserPhoto["profilePicture"] = parseImageFile
                    newUserPhoto.saveInBackgroundWithBlock({
                        (success: Bool, error: NSError?) -> Void in
                        
                        if error == nil {
                            print("data uploaded")
                        }else {
                            print(error)
                        }
                    })
                }else {
                    print(error)
                    
                }
                
            })

        }
       */ 
    }

    
    
    @IBAction func userProfileList(sender: AnyObject) {
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


