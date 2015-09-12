//
//  SettingsViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/19/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var txt: UITextView!

    @IBAction func tappedEditProfile() {
        presentViewController(EditProfileViewController(nibName:"EditProfileViewController", bundle:nil), animated: true, completion: nil)
    }
    
    @IBAction func tappedLogOut() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func submitTapped() {
        if txt.text == nil || txt.text == ""
        {
            var Alert : UIAlertView = UIAlertView(title: "Are you trying to troll us?", message: "Please Enter something before sending it to us. Thanks", delegate: self, cancelButtonTitle: "Ok")
            Alert.show()
        }
        else
        {
            //sendToWill(txt.text)
            txt.resignFirstResponder()
            txt.text = ""
            var Alert : UIAlertView = UIAlertView(title: "Thank you", message: "Your report/suggestion has been recieved by us.\nWe will get to it as soon as possible.", delegate: self, cancelButtonTitle: "Ok")
            Alert.show()
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}
