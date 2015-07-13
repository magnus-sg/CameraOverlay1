//
//  ViewController.swift
//  CameraOverlay1
//
//  Created by WESIANG on 12/7/15.
//  Copyright (c) 2015 Magnus International. All rights reserved.
//

import UIKit
import MobileCoreServices



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var imageView = UIImageView()

    @IBOutlet weak var ImageViewContainer: UIView!{
        didSet {
            
            ImageViewContainer.addSubview(imageView)
        }
    }
    
    @IBAction func takePhoto(sender: AnyObject  ) {
    
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            let picker = UIImagePickerController()
        
            picker.sourceType = .Camera
            picker.mediaTypes = [kUTTypeImage]
            picker.delegate = self
            picker.allowsEditing = true
            presentViewController(picker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        var image = info[UIImagePickerControllerEditedImage] as? UIImage
        if image == nil {
            image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        imageView.image = image
//        makeRoomForImage()
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

