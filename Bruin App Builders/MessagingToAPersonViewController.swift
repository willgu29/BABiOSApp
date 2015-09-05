//
//  MessagingToAPersonViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/23/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class MessagingToAPersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Stuff to get the keyboard up
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:" , name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    //to return the keyboard back to its place.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        // 1
        var userInfo = notification.userInfo!
        // 2
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        // 3
        var animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        // 4
        var changeInHeight = (CGRectGetHeight(keyboardFrame) + 0) * (show ? 1 : -1)
        //5
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.bottomConstraint.constant += changeInHeight
            self.bottomConstraint2.constant += changeInHeight
        })
        
    }
    
    
    //MARK: send the message, yet to be done
    func send(message: String)
    {
        
    }
    
    @IBAction func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var typingANewMessage: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint2: NSLayoutConstraint!

    @IBAction func hitSend(sender: UIButton) {
        var newMessage : String
        if (typingANewMessage.text != nil)
        {
            newMessage = typingANewMessage.text!
            send(newMessage)
        }
        typingANewMessage.text = ""
    }


}
