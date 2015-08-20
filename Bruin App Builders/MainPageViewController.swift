//
//  MainPageViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/7/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    var tableView: UITableView  =   UITableView()
    var items: [String] = ["Viper", "X", "Games","Viper", "X", "Games","Viper", "X", "Games","Viper", "X", "can be seen","Cant be seen", "X", "Games","Viper", "X", "Games"]
    let pageHeader   = UILabel(frame: CGRectMake(0, 0, 200, 21))
    let searchingPeopleBar : UISearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageHeader.frame = CGRectMake(0, 0, self.view.frame.width, 50)
        pageHeader.backgroundColor = UIColor.magentaColor()
        pageHeader.text = "People"
        pageHeader.textColor = UIColor.yellowColor()
        pageHeader.font = UIFont(name: "AmericanTypewriter", size: 35)
        pageHeader.textAlignment = NSTextAlignment.Center
        self.view.addSubview(pageHeader)
        
        searchingPeopleBar.frame = CGRectMake(0, 50, self.view.frame.width, 20)
        searchingPeopleBar.placeholder = "Search in People"
        searchingPeopleBar.barStyle = UIBarStyle.Black
        
        self.view.addSubview(searchingPeopleBar)
        
        tableView.frame         =   CGRectMake(0, 70, self.view.frame.width , self.view.frame.height -         self.tabBarController!.tabBar.frame.height - 70);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = "•" + " " + self.items[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //println("You selected cell #\(indexPath.row)!")
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
