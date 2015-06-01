//
//  SwipeViewController.swift
//  showup
//
//  Created by Anupam Mediratta on 18/05/15.
//  Copyright (c) 2015 Anupam Mediratta. All rights reserved.
//

import Foundation
import UIKit

class SwipeViewController: UIViewController, SwipeViewDelegate, SwipeViewDataSource {
    
    var jsonIns: JSON = [["image": "waterbom.jpg", "desc_1": "Most people said visit if you want adrenaline rush"], ["image": "mayong.jpg", "desc_1": "Most people said best day in Bali"], ["image": "waterbom.jpg", "desc_1": "Most people said visit if you want adrenaline rush"]]
    @IBOutlet var swipeView: SwipeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.swipeView.alignment = SwipeViewAlignment.Center;
        self.swipeView.pagingEnabled = true;
        self.swipeView.itemsPerPage = 1;
        self.swipeView.truncateFinalPage = true;
        self.swipeView.delegate = self
        self.swipeView.dataSource = self
        self.swipeView.vertical = false
        
        self.view.backgroundColor = UIColor(netHex: 0xe6e6e6)
    }
    
    func numberOfItemsInSwipeView (swipeView: SwipeView) -> NSInteger
    {
    //generate 100 item views
    //normally we'd use a backing array
    //as shown in the basic iOS example
    //but for this example we haven't bothered
        return 100
    }
    
    func swipeView(swipeView: SwipeView, viewForItemAtIndex index: NSInteger, reusingView view: UIView?) -> UIView
    {
        var newView: UIView
        if (view == nil)
        {
            //load new item view instance from nib
            //control events are bound to view controller in nib file
            //note that it is only safe to use the reusingView if we return the same nib for each
            //item view, if different items have different contents, ignore the reusingView value
            
//            newView = NSBundle.mainBundle().loadNibNamed("ItemView", owner: self, options: nil)[0] as! UIView
//            newView.backgroundColor = UIColor(netHex: 0xe6e6e6)
            //view = [[NSBundle mainBundle] loadNibNamed:@"ItemView" owner:self options:nil][0];
            newView = UIView(frame: CGRectMake(0, 0, 250, 250))
            let label = UILabel(frame: CGRectMake(54, 211, 194, 21))
            let ins = self.jsonIns[index]
            print ("desc: " + ins["desc_1"].string!)
            label.text = ins["desc_1"].string!
            newView.addSubview(label)
            //image
            print ("image: " + ins["image"].string!)
            let image = UIImage(named: ins["image"].string!)
            let image2 = UIImageView(frame: CGRectMake(49, 9, 158, 195))
            image2.image = image
            newView.addSubview(image2)
            return newView
        }
        else {
            return view!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
