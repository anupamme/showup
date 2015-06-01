//
//  LayoutController.swift
//  PinterestLayout
//
//  Created by Shrikar Archak on 12/21/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit

let reuseIdentifierExplore = "collCellExplore"

class ExploreAreaLayoutController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let sectionInsets = UIEdgeInsets(top: 200.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    @IBOutlet var collView: UICollectionView!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    var jsonExplore: JSON = [["image": "pin1.jpg",
        "heading": "Water Park",
        "desc_1": "Most people said visit if you want adrenaline rush",
        "desc_2": "Some people said go if you have entire day to spend",
        "desc_3": "Some said it serves expensive Drinks"
        ],
        ["image": "pin2.jpg",
            "heading": "Hiking/Trekking",
            "desc_1": "Most people said best day in Bali",
            "desc_2": "Some people said great way to get an insight into real Bali life",
            "desc_3": "Very few people found it irresponsible and unreliable"
    ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.rightBarButtonItem = UIBarButtonItem(title: "Select", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("NextIsTapped:"))
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(netHex: 0x79B951)
        
    }
    
    func NextIsTapped(nextButton: UIBarButtonItem){
        print ("next is tapped.")
        let new = UICollectionViewLayout()
        
        let abc = LayoutController(collectionViewLayout: new)
        self.navigationController?.pushViewController(abc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 50
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierExplore, forIndexPath: indexPath) as! ExploreCollectionViewCell
        let jsonIns = self.jsonExplore[indexPath.row % 2]
        cell.title.text = jsonIns["desc_1"].string!
        cell.somePeople.text = jsonIns["desc_2"].string!
        cell.heading.text = jsonIns["heading"].string!
        cell.fewPeople.text = jsonIns["desc_3"].string!
        cell.pinImage.image = UIImage(named: jsonIns["image"].string!)
        return cell
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: 210, height: 600)
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        println(segue.identifier)
//        println(sender)
//        if(segue.identifier == "detail"){
//            let cell = sender as! CollectionViewCell
//            let indexPath = collectionView?.indexPathForCell(cell)
//            let vc = segue.destinationViewController as! DetailViewController
//            
//            let jsonIns = self.jsonExplore[indexPath!.row % 3]
//            let imgName = jsonIns["main_image"].string!
//            
//            println(vc)
//            vc.currImage = UIImage(named: imgName)
//            vc.textHeading = jsonIns["title"].string!
//        }
//    }
    
    
    
}
