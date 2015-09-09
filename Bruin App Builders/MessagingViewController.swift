//
//  MessagingViewController.swift
//  Bruin App Builders
//
//  Created by William Gu on 8/18/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController, APIWrapperDelegate {
    
    let wrapper: APIWrapper = APIWrapper.sharedManager() as! APIWrapper;

    @IBAction func goToAMessagingController(sender: UIButton) {
        
    }
    
    @IBOutlet var tableView: UITableView!
    
    var tableData: [String] = ["Ferrari", "BMW", "Mitsubishi", "Lambo","Ferrari", "BMW", "Mitsubishi", "Lambo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: "MessagesTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        //tableView.registerClass(EventsTableCell.self, forCellReuseIdentifier: "cell")
        // tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.bounces = false
        
        self.getMessages();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : MessagesTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! MessagesTableViewCell;
        cell.cellLabel.text = tableData[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //println("Row \(indexPath.row) selected")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var vc = MessagingToAPersonViewController(nibName:"MessagingToAPersonViewController", bundle:nil)
        vc.namely = tableData[indexPath.row]
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func getMessages() {
        wrapper.delegate = self;
        wrapper.getMessages(nil);
    }
    
    func messageArrayResponse(messageArray: [AnyObject]!) {
        NSLog("message threads: %@", messageArray);
    }
}
