//
//  SwipeViewController.swift
//  showup
//
//  Created by Anupam Mediratta on 18/05/15.
//  Copyright (c) 2015 Anupam Mediratta. All rights reserved.
//

import Foundation

class SwipeVerticalViewController: UIViewController, SwipeViewDelegate, SwipeViewDataSource {
    
    @IBOutlet var swipeView: SwipeView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.swipeView.alignment = SwipeViewAlignment.Center;
        self.swipeView.pagingEnabled = true;
        self.swipeView.itemsPerPage = 1;
        self.swipeView.truncateFinalPage = true;
        self.swipeView.delegate = self
        self.swipeView.dataSource = self
        self.swipeView.vertical = true
        
        // add title, custom back, search icon.
        let rightButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        rightButton.image = UIImage(named: "search_btn.png")
        navBar.rightBarButtonItem = rightButton
        
        let leftButton = UIBarButtonItem(title: "Ubud", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        navBar.leftBarButtonItems?.append((UIImage(named: "back_btn.png"))!)
        navBar.leftBarButtonItems?.append(leftButton)
        
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
            newView = NSBundle.mainBundle().loadNibNamed("hotel", owner: self, options: nil)[0] as! UIView
            //view = [[NSBundle mainBundle] loadNibNamed:@"ItemView" owner:self options:nil][0];
            // add action to the button.
            
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
