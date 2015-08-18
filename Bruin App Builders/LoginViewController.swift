//
//  LoginViewController.swift
//  Bruin App Builders
//
//  Created by William Gu on 8/7/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    //MARK: IBActions

    
    @IBAction func goToMainViewController(sender: UIButton)
    {
//        if (usernameText.text == "")
//        {
//            if (passwordText.text == "")
//            {
//                errorMessageLabel.text = "Please enter a username and password"
//            }
//            else
//            {
//                errorMessageLabel.text = "Please enter a username"
//            }
//        }
//        else if (passwordText.text == "")
//        {
//            errorMessageLabel.text = "Please enter a password"
//        }
//        else if isUserNameWrong(usernameText.text)
//        {
//            errorMessageLabel.text = "Please enter a valid username"
//        }
//        else if isPasswordWrong(passwordText.text)
//        {
//            errorMessageLabel.text = "Please enter a valid password"
//        }
//        else
//        {
//            //Authentication
//            presentViewController(MainPageViewController(), animated: true, completion: nil)
//        }
        
        
        
        
        presentViewController(createTabBarVC(), animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func signUp(sender: AnyObject) {
        //use igrouply and help the user sign up
    }
    
    
    
    //MARK: Helper Functions
    
    
    
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
        
        mainVC.title = "People";
        groupVC.title = "Groups";
        messageVC.title = "Messages";
        
        
        
        let arrayOfVCs = [mainVC, groupVC, messageVC];
        
        tabVC.viewControllers = arrayOfVCs;
        return tabVC;
    }
}
