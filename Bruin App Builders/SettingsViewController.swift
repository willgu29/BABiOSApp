//
//  SettingsViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/19/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tappedEditProfile() {
        presentViewController(EditProfileViewController(nibName:"EditProfileViewController", bundle:nil), animated: true, completion: nil)
    }
    @IBAction func tappedLogOut() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
