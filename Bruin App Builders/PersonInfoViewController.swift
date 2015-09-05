//
//  PersonInfoViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/23/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class PersonInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var fiveThings : [String] = ["a","b","c","d","e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate      =   self
        tableView.dataSource    =   self
        
        //FILL UP THE 5 THINGS ARRAY
        //GET OTHER DATA
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = fiveThings[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableView.frame.height/5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var Offers: UITextView!
    @IBOutlet weak var Wants: UITextView!
    
    @IBAction func messageButtonTapped() {
        
    }
    
}
