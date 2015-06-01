//
//  DetailViewController.swift
//  PinterestLayout
//
//  Created by Shrikar Archak on 1/13/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit

let reuseIdentifierDetail = "collCellDetail"

class DetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    let json: JSON = [["display_name": "Pool", "image": "infinity-pool.jpg", "most": "Most people said pool was not to be missed.", "some": "some people said that pool was crowded", "few": "few people said drinks were expensive."], ["display_name": "Food / Restaurant", "image": "food-sushi.jpg", "most": "Most people said their japanese cuisine was a treat.", "some": "Some people said that their was delay in their service", "few": "Few people did not like the preparation"], ["display_name": "Bar/ Lounge", "image": "bar.jpg", "most": "Most people said the bar was open till morning and they were impressed by bar tenders.", "some": "Some people complained that there was not much variety in drinks", "few": "Few people said that bar was usually over crowded."]]
    
    var currImage: UIImage?
    var textHeading: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Detail view controller")
//        myLabel.text = textHeading
//        myImageView.image = currImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 50
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierDetail, forIndexPath: indexPath) as! DetailViewCollectionCell
        let jsonIns = self.json[indexPath.row % 3]
        cell.pinImage.image = UIImage(named: jsonIns["image"].string!)
        cell.desc_most.text = jsonIns["display_name"].string!
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: 170, height: 300)
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
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
