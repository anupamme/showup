//
//  RootViewController.swift
//  showup
//
//  Created by Anupam Mediratta on 14/05/15.
//  Copyright (c) 2015 Anupam Mediratta. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        nextButton.addTarget(self, action: Selector("exploreClicked:"), forControlEvents: UIControlEvents.TouchDown)

    }
    @IBOutlet weak var exploreButton: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
//    func exploreClicked(nextButton: UIButton){
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
