//
//  AddAGroupRequestViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/29/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class AddAGroupRequestViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       // self.view.endEditing(true)
        textField.resignFirstResponder()
       details.becomeFirstResponder()
        return false
    }
    
    @IBOutlet var details: UITextView!
    @IBOutlet weak var nameOfTheGroup: UITextField!

    @IBAction func submitButton(sender: UIButton) {
        if (nameOfTheGroup.text == nil || nameOfTheGroup.text == "")
        {
            errorMessageLabel.text = "Please enter a name"
        }
        else
        {
            //send it to will for him to check.
            //send him a report saying that the new group info has been sent to will
            //go back to groups page
            errorMessageLabel.text = ""
            goBack()
        }
    }
    
    @IBAction func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    //Have a way to limit the number of requests a person can make.
}
