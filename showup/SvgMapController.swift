//
//  SvgMapController.swift
//  showup
//
//  Created by Anupam Mediratta on 16/05/15.
//  Copyright (c) 2015 Anupam Mediratta. All rights reserved.
//

import Foundation
import UIKit

class SvgMapController: UIViewController {

    let areaMap: JSON = ["AT-1": "This area is North-West Bali. It is famous for Isolated Beaches.",
        "AT-2": "This area is South Bali. It has most popular beaches.",
        "AT-3": "This area is Ubud. It is known for green fields.",
        "AT-4": "This area is North-West Bali. It is famous for Isolated Beaches.",
        "AT-5": "This area is South Bali. It has most popular beaches.",
        "AT-6": "This area is Ubud. It is known for green fields.",
        "AT-7": "This area is North-West Bali. It is famous for Isolated Beaches.",
        "AT-8": "This area is South Bali. It has most popular beaches.",
        "AT-9": "This area is Ubud. It is known for green fields."]
    
    var oldClickedLayer: CAShapeLayer!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var showUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create two buttons for the navigation item
        navBar.leftBarButtonItem?.image = UIImage(named: "backto_btn.png")
        navBar.leftBarButtonItem?.title = ""
        
        self.view.backgroundColor = UIColor(netHex: 0xe6e6e6)
//        self.initExample3()
    }
    
    func leftBackPressed(barButtonItem: UIBarButtonItem){
        print ("left is tapped!")
        
    }
    
    func RightForwardPressed(barButtonItem: UIBarButtonItem){
        print ("right is tapped!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initExample3()
    {
        var map = FSInteractiveMapView(frame: CGRectMake(16, 96, self.view.frame.size.width - 32, 200))
        map.loadMap("austria-low", withColors: nil)
        map.clickHandler = {(identifier: String!, layer: CAShapeLayer!) -> Void in
            if (self.oldClickedLayer != nil){
                self.oldClickedLayer.zPosition = 0
                self.oldClickedLayer.shadowOpacity = 0
                self.oldClickedLayer.fillColor = UIColor(netHex: 0xe6e6e6).CGColor
            }
//            print("name: " + layer.name!)
            layer.zPosition = 10
            layer.shadowRadius = 5
            layer.shadowOffset = CGSizeMake(0,0)
            layer.fillColor = UIColor.yellowColor().CGColor
//            layer.hidden = true
            self.oldClickedLayer = layer
            
            let text = self.areaMap[identifier].string!
            self.descriptionLabel.font = UIFont(name: "Helvetica", size: 9.0)
            self.descriptionLabel.text = text

            
        }
        self.view.addSubview(map)
        
    }
    
    func nextPressed(button: UIButton){
        var contrl = SwipeViewController()
        self.presentViewController(contrl, animated: true, completion: nil)
    }
}