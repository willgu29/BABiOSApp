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
    var arrayOfGroups = ["iOS", "Android", "Nodejs", "Swift", "Obj-C", "MongoDB", "Web","Hardware"]
    var joined = ["xc","cds"]
    let pageHeader = UILabel()
    var collectionView: UICollectionView!
    var button: UIButton = UIButton()
    struct Object {
        var name : String
        var members : [String]
    }
    var ArrayOfObjects = [Object]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButton()
        initPageHeader()
        initCollectionView()
        var ObjectOne = Object(name: "Joined Groups", members: joined)
        var ObjectTwo = Object(name: "Other Groups", members: arrayOfGroups)
        ArrayOfObjects = [ObjectOne, ObjectTwo]
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.collectionView.reloadData();
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
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell : GroupCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! GroupCollectionViewCell
        cell.nameOfGroup.text = ArrayOfObjects[indexPath.section].members[indexPath.row]
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2  // Number of section
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayOfObjects[section].members.count;
    }

    
    //MARK: for headers
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//       
//    }
    
   
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        var SGVC = SpecificGroupViewController(nibName: "SpecificGroupViewController", bundle: nil)
        SGVC.namely = arrayOfGroups[indexPath.row]
        presentViewController(SGVC, animated: true, completion: nil)
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
    
    // MARK: "+" button tapped
    func buttonAction(sender:UIButton!)
    {
        var GVC = AddAGroupRequestViewController(nibName:"AddAGroupRequestViewController", bundle:nil)
        presentViewController(GVC, animated: true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    //Mark: Helperfunctions
    func initButton()
    {
        button.frame = CGRectMake(self.view.frame.width - 50, 0, 50, 50)
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("➕", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.insertSubview(self.button, aboveSubview: self.pageHeader)
    }
    func initPageHeader()
    {
        pageHeader.frame = CGRectMake(0, 0, self.view.frame.width, 50)
        pageHeader.backgroundColor = UIColor.clearColor()
        pageHeader.text = "Groups"
        pageHeader.textColor = UIColor.blackColor()
        pageHeader.textAlignment = NSTextAlignment.Center
        self.view.insertSubview(pageHeader, belowSubview: button)
        self.view.sendSubviewToBack(self.pageHeader)
    }
    func initCollectionView()
    {
        var nib = UINib(nibName: "GroupCollectionViewCell", bundle: nil)
        let height: CGFloat = self.view.frame.height - self.tabBarController!.tabBar.frame.height - 50
        var frame: CGRect = CGRectMake(0, 50, self.view.frame.width, height);
        self.collectionView = UICollectionView(frame:frame, collectionViewLayout: UICollectionViewFlowLayout());
        self.collectionView.delegate      =   self
        self.collectionView.dataSource    =   self
       //self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: "Cell")
        self.collectionView.contentSize = CGSizeMake(100, 100);
        self.collectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.collectionView)
//        var nib = UINib(nibName: "EventsTableCell", bundle: nil)
//        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }
}


