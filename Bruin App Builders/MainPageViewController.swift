//
//  MainPageViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/7/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    var searchActive : Bool = false
    var filtered:[String] = []
    var tableView: UITableView  =   UITableView()
    var items: [String] = ["Viper", "X", "Games","Viper", "X", "Games","Viper", "X", "Games","Viper", "X", "can be seen","Cant be seen", "X", "Games","Viper", "X", "Games"]
    let pageHeader   = UILabel(frame: CGRectMake(0, 0, 200, 21))
    let searchBar : UISearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //Doesnt work
        
        var destinationVC : PersonInfoViewController = segue.destinationViewController as! PersonInfoViewController
        let cell = tableView.cellForRowAtIndexPath(tableView.indexPathForSelectedRow()!)
        var namely : String = ((cell!.textLabel)?.text)!
        println(namely)
        destinationVC.nameLabel.text = "nxcmdx"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
            cell.textLabel?.text = items[indexPath.row]
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        searchBar.resignFirstResponder()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var vc = PersonInfoViewController(nibName: "PersonInfoViewController", bundle: nil)
        //println("You selected cell #\(indexPath.row)! whose value is \(items[indexPath.row])")
        if searchBar.text == nil || searchBar.text == ""
        {
            //use items
            vc.namely = items[indexPath.row]
        }
        else
        {
            //use filtered
            vc.namely = filtered[indexPath.row]
        }
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: Search Bar functions
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) { searchActive = true }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        //searchBar.resignFirstResponder()
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchActive = false
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = items.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(searchBar.text == ""){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
    
    //Used to remove the keyboard when not in use
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func initialize()
    {
        pageHeader.frame = CGRectMake(0, 8, self.view.frame.width, 50)
        pageHeader.backgroundColor = UIColor.clearColor()
        pageHeader.text = "People"
        pageHeader.textColor = UIColor.blackColor()
        pageHeader.textAlignment = NSTextAlignment.Center
        self.view.addSubview(pageHeader)
        
        searchBar.frame = CGRectMake(0, 50, self.view.frame.width, 20)
        searchBar.delegate = self
        searchBar.placeholder = "Search in People"
        searchBar.barStyle = UIBarStyle.Default
        searchBar.showsCancelButton = true
        self.view.addSubview(searchBar)
        
        tableView.frame         =   CGRectMake(0, 70, self.view.frame.width , self.view.frame.height -         self.tabBarController!.tabBar.frame.height - 70);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.bounces = false
        self.view.addSubview(tableView)
    }

}