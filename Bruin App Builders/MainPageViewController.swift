//
//  MainPageViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/7/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRectMake(100, 100, 100, 50)
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Test Button", forState: UIControlState.Normal)
        button.addTarget(self, action: "butto:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func butto(sender:UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
