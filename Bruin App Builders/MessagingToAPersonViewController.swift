//
//  MessagingToAPersonViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/23/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class MessagingToAPersonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var namely = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.bounces = false
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        nameLabel.text = namely
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
     
        // Do any additional setup after loading the view.
    }

    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                self.SubView.frame.origin.y -= keyboardSize.height
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                self.SubView.frame.origin.y += keyboardSize.height
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        
    }
    
    //to return the keyboard back to its place.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        typingANewMessage.resignFirstResponder()
    }
    
    
    //MARK: send the message, yet to be done
    func send(message: String)
    {
        
    }
    
    @IBAction func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var typingANewMessage: UITextField!

    @IBOutlet var tableView: UITableView!
    
    @IBAction func hitSend(sender: UIButton) {
        var newMessage : String
        if (typingANewMessage.text != nil)
        {
            newMessage = typingANewMessage.text!
            send(newMessage)
        }
        typingANewMessage.text = ""
    }

    @IBOutlet var SubView: UIView!
    @IBOutlet var nameLabel: UILabel!

}
