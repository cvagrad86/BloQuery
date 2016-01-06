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
    /*
    @IBAction func takePhotos(sender: UIButton) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            let picker = UIImagePickerController()
            //picker.delegate =
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            picker.modalPresentationStyle = .FullScreen
            presentViewController(picker,
                animated: true,
                completion: nil)
        } else {
            noCamera()
        }
        
    }
*/
    
   
    /*
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImageView.contentMode = .ScaleAspectFit
            myImageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .Alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.Default,
            handler: nil)
        alertVC.addAction(okAction)
        presentViewController(
            alertVC,
            animated: true,
            completion: nil)
    }
    */
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
