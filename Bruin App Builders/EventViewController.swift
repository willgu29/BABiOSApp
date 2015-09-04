//
//  EventViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 9/4/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var tableData: [String] = ["Ferrari", "BMW", "Mitsubishi", "Lambo","Ferrari", "BMW", "Mitsubishi", "Lambo","Ferrari", "BMW", "Mitsubishi", "Lambo","Ferrari", "BMW", "Mitsubishi", "Lambo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: "EventsTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
        
        var cell : EventsTableCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! EventsTableCell
        
        cell.cellLabel.text = tableData[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Row \(indexPath.row) selected")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

}

