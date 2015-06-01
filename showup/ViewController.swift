//
//  ViewController.swift
//  showup
//
//  Created by Anupam Mediratta on 13/05/15.
//  Copyright (c) 2015 Anupam Mediratta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var dateLabelTo: UILabel!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var doneButton: UIButton!
    enum whichDate {
        case from
        case to
    }
    
    var which: whichDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // layout changes
       navBar.title = "Traveling Details"
        let leftButton = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        //let rightButton = UIBarButtonItem(title: "Right", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        // Create two buttons for the navigation item
        navBar.leftBarButtonItem = leftButton
//        navBar.rightBarButtonItem = rightButton

        
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        var fromTap = UITapGestureRecognizer(target: self, action: Selector("labelFromTapped:"))
        fromTap.numberOfTapsRequired = 1
        self.dateLabel.addGestureRecognizer(fromTap)
        self.dateLabel.userInteractionEnabled = true
        
        var toTap = UITapGestureRecognizer(target: self, action: Selector("labelToTapped:"))
        toTap.numberOfTapsRequired = 1
        self.dateLabelTo.addGestureRecognizer(toTap)
        self.dateLabelTo.userInteractionEnabled = true
        
//        self.datePicker.set("Done", forState: UIControlState.Normal)
//        doneButton.setTitle("Done", forState: UIControlState.Highlighted)
//        doneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        doneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        self.datePicker.hidden = true
        self.doneButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func labelFromTapped(dateLabel: UILabel){
        self.which = whichDate.from
        self.datePicker.hidden = false
        self.doneButton.hidden = false
    }
    
    func labelToTapped(dateLabelTo: UILabel){
        self.which = whichDate.to
        self.datePicker.hidden = false
        self.doneButton.hidden = false
    }
    
    func datePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
//        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var strDate = dateFormatter.stringFromDate(datePicker.date)

        if self.which == whichDate.to {
            dateLabelTo.text = strDate
        }
        else{
            dateLabel.text = strDate
        }
        self.datePicker.hidden = true
        self.doneButton.hidden = true
    }
}

