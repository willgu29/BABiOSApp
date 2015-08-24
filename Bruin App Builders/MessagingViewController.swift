//
//  MessagingViewController.swift
//  Bruin App Builders
//
//  Created by William Gu on 8/18/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func goToAMessagingController(sender: UIButton) {
        presentViewController(MessagingToAPersonViewController(nibName:"MessagingToAPersonViewController", bundle:nil), animated: true, completion: nil)
    }

}
