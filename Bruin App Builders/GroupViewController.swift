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
    var arrayOfGroups = ["iOS", "Android", "Nodejs"]
    let pageHeader   = UILabel(frame: CGRectMake(0, 0, 200, 21))
    let searchingPeopleBar : UISearchBar = UISearchBar()
    private let kCellReuse : String = "PackCell"
    private let kCellheaderReuse : String = "PackHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageHeader.frame = CGRectMake(0, 0, self.view.frame.width, 50)
        pageHeader.backgroundColor = UIColor.magentaColor()
        pageHeader.text = "Groups"
        pageHeader.textColor = UIColor.yellowColor()
        pageHeader.font = UIFont(name: "AmericanTypewriter", size: 35)
        pageHeader.textAlignment = NSTextAlignment.Center
        self.view.addSubview(pageHeader)
        
        searchingPeopleBar.frame = CGRectMake(0, 50, self.view.frame.width, 20)
        searchingPeopleBar.placeholder = "Search in Groups"
        searchingPeopleBar.barStyle = UIBarStyle.Black
        self.view.addSubview(searchingPeopleBar)
        
        var collectionView =   UICollectionView(frame: CGRectMake(0, 70, self.view.frame.width , self.view.frame.height -         self.tabBarController!.tabBar.frame.height - 70), collectionViewLayout:UICollectionViewLayout())
        collectionView.delegate      =   self
        collectionView.dataSource    =   self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(collectionView)

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
        textLabel.text = "Cell \(indexPath.row)"
        cell.contentView.addSubview(textLabel)
        cell.backgroundColor = UIColor.redColor()
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1  // Number of section
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: false)
        println("cell \(indexPath)")
    }
    
//
//    // MARK: UICollectionViewDelegateFlowLayout
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: 90, height: 90) // The size of one cell
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSizeMake(self.view.frame.width, 90)  // Header size
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        let frame : CGRect = self.view.frame
//        let margin  = (frame.width - 90 * 3) / 6.0
//        return UIEdgeInsetsMake(10, margin, 10, margin) // margin between cells
//    }
}
