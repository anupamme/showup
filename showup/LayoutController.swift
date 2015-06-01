//
//  LayoutController.swift
//  PinterestLayout
//
//  Created by Shrikar Archak on 12/21/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit

let reuseIdentifier = "collCell"

class LayoutController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var json: JSON = [["main_image": "legion.jpg",
        "title": "The Legion Bali",
        "address": "Ubud, Bali",
        "avg_nightly_price": "15,000",
        "awesome": ["service", "food", "cleanliness"],
        "good": ["location", "room quality"],
        "bad": ["kids friendly"]
        ],
        ["main_image": "luna.jpg",
            "title": "Luna2 Studiotel",
            "address": "Ubud, Bali",
            "avg_nightly_price": "14,000",
            "awesome": ["location", "beach", "service", "decor", "villa"],
            "good": [],
            "bad": []
        ],
        ["main_image": "mulia.jpg",
            "title": "Mulia Villas",
            "address": "Ubud, Bali",
            "avg_nightly_price": "14,000",
            "awesome": ["service", "pool", "food"],
            "good": ["internet"],
            "bad": ["ambience", "view"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let abc = UIButton(frame: CGRectMake(300, 100, 50, 20))
        abc.setTitle("my button", forState: UIControlState.Normal)
        self.view.addSubview(abc)
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        let jsonIns = self.json[indexPath.row % 3]
        cell.title.text = jsonIns["title"].string!
        cell.address.text = jsonIns["address"].string!
        cell.avgPrice.text = jsonIns["avg_nightly_price"].string!
        cell.pinImage.image = UIImage(named: jsonIns["main_image"].string!)
        cell.awesomeTags.text = ",".join((jsonIns["awesome"].array! as Array).map {$0.description} )
        cell.goodTags.text = ",".join((jsonIns["good"].array! as Array).map {$0.description} )
        cell.poorTags.text = ",".join((jsonIns["bad"].array! as Array).map {$0.description} )
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.identifier)
        println(sender)
        if(segue.identifier == "detail"){
            let cell = sender as! CollectionViewCell
            let indexPath = collectionView?.indexPathForCell(cell)
            let vc = segue.destinationViewController as! DetailViewController
            
            let jsonIns = self.json[indexPath!.row % 3]
            let imgName = jsonIns["main_image"].string!
            
            println(vc)
            vc.currImage = UIImage(named: imgName)
            vc.textHeading = jsonIns["title"].string!
        }
    }
    
    
    
}
