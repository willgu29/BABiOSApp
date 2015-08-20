//
//  LoginViewController.swift
//  Bruin App Builders
//
//  Created by William Gu on 8/7/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, APIWrapperDelegate, UITextFieldDelegate {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var activityIND: UIActivityIndicatorView!
    let wrapper = APIWrapper();
    
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wrapper.delegate = self;
        activityIND.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Used to remove the keyboard when not in use
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
    //MARK: NOT SURE, TO STOP ANIMATING
//    override func willMoveToParentViewController(parent: UIViewController?) {
//        activityIND.hidden = true
//        activityIND.stopAnimating()
//    }
    
    //MARK: APIWrapperDelegate
    
    func loginResponse(status: [NSObject : AnyObject]!) {
        let status: NSDictionary = status as NSDictionary;
        let statusResult: String = status.valueForKey("info") as! String;
        if (statusResult == "/") {
            presentViewController(createTabBarVC(), animated: true, completion: nil)
        } else {
            errorMessageLabel.text = statusResult;
        }
    }
  
    
    //MARK: IBActions

    
    @IBAction func goToMainViewController(sender: UIButton)
    {
        if (usernameText.text == "")
        {
            errorMessageLabel.text = "Please enter a email"
        }
        else if (passwordText.text == "")
        {
            errorMessageLabel.text = "Please enter a password"
        }
        else if isUserNameWrong(usernameText.text)
        {
            errorMessageLabel.text = "Please enter a valid email"
        }
        else
        {
            //Authentication
            activityIND.hidden = false
            activityIND.startAnimating()
            //stop animating the activity ind once the new page is open
           // wrapper.postLogin(usernameText.text, andPassword: passwordText.text);
            
        }
        
        
        
        
    }
    
    @IBAction func skipButton(sender: UIButton)
    {
        presentViewController(createTabBarVC(), animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func signUp(sender: AnyObject) {
        //use igrouply and help the user sign up
    }
    
    
    
    //MARK: Helper Functions
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func isUserNameWrong(un : String) -> Bool
    {
        var twoParts = split(un) {$0 == "@"}
        if (twoParts.count != 2)
        {
            return true
        }
        var dotChecker = split(twoParts[1]) {$0 == "."}
        if dotChecker.count <= 1
        {
            return true
        }
        return false
    }
    
    func isPasswordWrong(pw : String) -> Bool
    {
        if (count(pw) < 6)
        {
            return true
        }
        return false
    }
    
    
    func createTabBarVC() -> UITabBarController {
        let tabVC = UITabBarController();
        
        let mainVC = MainPageViewController();
        let groupVC = GroupViewController(nibName:"GroupViewController", bundle:nil);
        let messageVC = MessagingViewController(nibName:"MessagingViewController", bundle:nil);
        let settingsVC = SettingsViewController(nibName:"SettingsViewController", bundle:nil);
        
        mainVC.title = "People";
        groupVC.title = "Groups";
        messageVC.title = "Messages";
        settingsVC.title = "Setting";
        
        
        let arrayOfVCs = [mainVC, groupVC, messageVC, settingsVC];
        
        tabVC.viewControllers = arrayOfVCs;
        return tabVC;
    }
}
