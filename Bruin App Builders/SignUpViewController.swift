//
//  SignUpViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 9/5/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var checker = Checker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        image.image = UIImage(named: "welcome-stagma-world1")
        imageTwo.image = UIImage(named: ("blank"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func submitTapped() {
        var ifitsempty = [ true, true,true,true,true]
        if firstName.text != ""
        {
            ifitsempty[0] = false
        }
        if lastName.text != ""
        {
            ifitsempty[1] = false
        }
        if email.text != ""
        {
            ifitsempty[2] = false
        }
        if phoneNumber.text != ""
        {
            ifitsempty[3] = false
        }
        if password.text != ""
        {
            ifitsempty[4] = false
        }
        for b in ifitsempty
        {
            if b == true
            {
                // animate b
            }
        }
        for b in ifitsempty
        {
            if b == true
            {
                return
            }
        }
        if checker.isUserNameWrong(email.text)
        {
            //animate email
            return
        }
        if checker.isPhoneNumberWrong(phoneNumber.text)
        {
            //animate phone
            return
        }
        
        // SUBMIT
        
        goBack()
    }
    
    @IBAction func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var imageTwo: UIImageView!

    
}
