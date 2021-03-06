//
//  LoginViewController.swift
//  Bruin App Builders
//
//  Created by William Gu on 8/7/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit
import MediaPlayer

class LoginViewController: UIViewController, APIWrapperDelegate, UITextFieldDelegate {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var activityIND: UIActivityIndicatorView!
    let wrapper: APIWrapper = APIWrapper.sharedManager() as! APIWrapper;
    let anim = CAKeyframeAnimation( keyPath:"transform" )
    var checker = Checker()
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wrapper.delegate = self;
        activityIND.hidesWhenStopped = true
        self.usernameText.delegate = self
        self.passwordText.delegate = self
        self.anim.values = [
            NSValue( CATransform3D:CATransform3DMakeTranslation(-5, 0, 0 ) ),
            NSValue( CATransform3D:CATransform3DMakeTranslation( 5, 0, 0 ) )
        ]
        anim.autoreverses = true
        anim.repeatCount = 2
        anim.duration = 7/100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        wrapper.getLoginStatus();
    }
    
    //Used to remove the keyboard when not in use
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func viewDidDisappear(animated: Bool) {
        activityIND.stopAnimating()
        passwordText.text = ""
        usernameText.text = ""
    }
    
    //MARK: APIWrapperDelegate
    
    func loginResponse(status: [NSObject : AnyObject]!) {
        let status: NSDictionary = status as NSDictionary;
        let statusResult: String = status.valueForKey("message") as! String;
        if (statusResult == "/") {
            presentViewController(createTabBarVC(), animated: true, completion: nil)
        } else {
            errorMessageLabel.text = statusResult;
            if statusResult.hasSuffix("email.")
            {
                usernameText.layer.addAnimation( anim, forKey:nil)
            }
            else
            {
                passwordText.layer.addAnimation( anim, forKey:nil)

            }
        }
        activityIND.stopAnimating()
    }
  
    
    //MARK: IBActions

    
    @IBAction func goToMainViewController(sender: UIButton)
    {
        if (usernameText.text == "")
        {
            errorMessageLabel.text = "Please enter a email"
            usernameText.layer.addAnimation( anim, forKey:nil)
        }
        else if (passwordText.text == "")
        {
            errorMessageLabel.text = "Please enter a password"
            passwordText.layer.addAnimation( anim, forKey:nil)

        }
        else if checker.isUserNameWrong(usernameText.text)
        {
            errorMessageLabel.text = "Please enter a valid email"
            usernameText.layer.addAnimation( anim, forKey:nil)
        }
        else
        {
            activityIND.startAnimating()
            wrapper.postLogin(usernameText.text, andPassword: passwordText.text);
        }
    }

    @IBAction func skipButton(sender: UIButton)
    {
        presentViewController(createTabBarVC(), animated: true, completion: nil)
    }
    
    @IBAction func signUp(sender: AnyObject) {
        //use igrouply and help the user sign up
        presentViewController(SignUpViewController(nibName: "SignUpViewController", bundle : nil), animated: true, completion: nil)
    }
    
    //MARK: Helper Functions
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        //textField.resignFirstResponder()
        if usernameText.isFirstResponder()
        {
            passwordText.becomeFirstResponder()
        }
        else
        {
            self.view.endEditing(true)
            goToMainViewController(UIButton())
        }
        return false
    }
    
    func createTabBarVC() -> UITabBarController {
        let tabVC = UITabBarController();
        
        let eventsVC = EventViewController(nibName:"EventViewController", bundle:nil);
        let mainVC = MainPageViewController();
        let groupVC = GroupViewController();
        let messageVC = MessagingViewController(nibName:"MessagingViewController", bundle:nil);
        let settingsVC = SettingsViewController(nibName:"SettingsViewController", bundle:nil);
        
        //mainVC.items = wrapper.getUser(nil)
        
        eventsVC.title = "Events"
        mainVC.title = "People";
        groupVC.title = "Groups";
        messageVC.title = "Messages";
        settingsVC.title = "Setting";
        
        let arrayOfVCs = [mainVC, groupVC, messageVC, eventsVC, settingsVC];
        
        tabVC.viewControllers = arrayOfVCs;
        return tabVC;
    }
   
    func loginStatus(status: [NSObject : AnyObject]!) {
        NSLog("status : %@", status);
    }
    
    
}
