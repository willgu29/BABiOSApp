//
//  EditProfileViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 9/4/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    var originalFiveThings : [String] = [ "" , "" , "" , "" , ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // get the 5 things and other data
        // Display it.
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var second: UITextField!
    @IBOutlet weak var third: UITextField!
    @IBOutlet weak var fourth: UITextField!
    @IBOutlet weak var fifth: UITextField!

    @IBOutlet weak var userNeedsHelp: UITextView!
    @IBOutlet weak var userCanHelp: UITextView!
    
    @IBAction func submitButton(sender: UIButton) {
        //Save everything.
        goBack()
    }
}
