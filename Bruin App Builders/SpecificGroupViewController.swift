//
//  SpecificGroupViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 9/5/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class SpecificGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var groupID: String = ""
    var membersNames = ["a","a","a","a","a"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        //Get the groupID and its members.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func joinTapped() {
        
    }
    @IBAction func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //dismissViewControllerAnimated(true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = membersNames[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.membersNames.count
    }
    
    
}
