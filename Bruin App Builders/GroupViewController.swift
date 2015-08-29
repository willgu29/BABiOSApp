//
//  GroupViewController.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 8/14/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var searchActive : Bool = false
    var filtered:[String] = []
    var arrayOfGroups = ["iOS", "Android", "Nodejs", "Swift", "Obj-C", "MongoDB", "Web"]
    let pageHeader   = UILabel(frame: CGRectMake(0, 0, 200, 21))
    let searchBar : UISearchBar = UISearchBar()
    var collectionView: UICollectionView!
    var button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRectMake(self.view.frame.width - 50, 0, 50, 50)
        button.backgroundColor = UIColor.magentaColor()
        button.setTitle("➕", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.insertSubview(self.button, aboveSubview: self.pageHeader)

        pageHeader.frame = CGRectMake(0, 0, self.view.frame.width, 50)
        pageHeader.backgroundColor = UIColor.magentaColor()
        pageHeader.text = "Groups"
        pageHeader.textColor = UIColor.yellowColor()
        pageHeader.font = UIFont(name: "AmericanTypewriter", size: 35)
        pageHeader.textAlignment = NSTextAlignment.Center
        self.view.insertSubview(pageHeader, belowSubview: button)
        self.view.sendSubviewToBack(self.pageHeader)
        
        searchBar.frame = CGRectMake(0, 50, self.view.frame.width, 20)
        searchBar.placeholder = "Search in Groups"
        searchBar.barStyle = UIBarStyle.Black
        self.view.addSubview(searchBar)
        
     
        let height: CGFloat = self.view.frame.height-self.tabBarController!.tabBar.frame.height-70;
        var frame: CGRect = CGRectMake(0, 70, self.view.frame.width, height);
        self.collectionView = UICollectionView(frame:frame, collectionViewLayout: UICollectionViewFlowLayout());

        self.collectionView.delegate      =   self
        self.collectionView.dataSource    =   self
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView.contentSize = CGSizeMake(100, 100);

        self.collectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.collectionView)

    }

    override func viewWillAppear(animated: Bool) {
        self.collectionView.reloadData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //maybe
        //super.prepareForSegue()
        
        //this was all me.
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        var textLabel = UILabel(frame: CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height))
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.textColor = UIColor.whiteColor()
        textLabel.text = arrayOfGroups[indexPath.row]
        textLabel.sizeToFit();
        cell.contentView.addSubview(textLabel)
        cell.backgroundColor = UIColor.blackColor()
        cell.sizeToFit();
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1  // Number of section
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfGroups.count
    }
   
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        //println("cell \(indexPath)")
    }
    

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 90, height: 90) // The size of one cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(self.view.frame.width, 10)  // Header size
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let frame : CGRect = self.view.frame
        let margin  = (frame.width - 90 * 3) / 6.0
        return UIEdgeInsetsMake(10, margin, 10, margin) // margin between cells
    }
    
    // MARK: buttonAction
    func buttonAction(sender:UIButton!)
    {
        //println("Button tapped")
        presentViewController(AddAGroupRequestViewController(nibName:"AddAGroupRequestViewController", bundle:nil), animated: true, completion: nil)
    }
    
    //MARK: Search Bar functions
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = arrayOfGroups.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(searchBar.text == ""){
            searchActive = false
        } else {
            searchActive = true
        }
        self.collectionView.reloadData()
    }

    
}
