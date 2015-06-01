//
//  RootViewController.swift
//  showup
//
//  Created by Anupam Mediratta on 14/05/15.
//  Copyright (c) 2015 Anupam Mediratta. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

class CustomDropDownController: UIViewController {
    
    @IBOutlet weak var placeDropDown: UILabel!
    
    @IBOutlet weak var fromDateDropDown: UILabel!
    @IBOutlet weak var toDateDropDown: UILabel!
    
    
    @IBOutlet weak var showUpButton: UIButton!
    @IBOutlet weak var purposeDropDown: UILabel!
    @IBOutlet weak var foodDropDown: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // attach the event to each tap.
        // place label.
        var fromTap = UITapGestureRecognizer(target: self, action: Selector("placeTapped:"))
        fromTap.numberOfTapsRequired = 1
        self.placeDropDown.addGestureRecognizer(fromTap)
        self.placeDropDown.userInteractionEnabled = true
        
        var fromDateTap = UITapGestureRecognizer(target: self, action: Selector("fromTapped:"))
        fromDateTap.numberOfTapsRequired = 1
        self.fromDateDropDown.addGestureRecognizer(fromDateTap)
        self.fromDateDropDown.userInteractionEnabled = true
        
        var toDateTap = UITapGestureRecognizer(target: self, action: Selector("toTapped:"))
        toDateTap.numberOfTapsRequired = 1
        self.toDateDropDown.addGestureRecognizer(toDateTap)
        self.toDateDropDown.userInteractionEnabled = true
        
        var purposeTap = UITapGestureRecognizer(target: self, action: Selector("purposeTapped:"))
        purposeTap.numberOfTapsRequired = 1
        self.purposeDropDown.addGestureRecognizer(purposeTap)
        self.purposeDropDown.userInteractionEnabled = true
        
        var foodTap = UITapGestureRecognizer(target: self, action: Selector("foodTapped:"))
        foodTap.numberOfTapsRequired = 1
        self.foodDropDown.addGestureRecognizer(foodTap)
        self.foodDropDown.userInteractionEnabled = true
        
        self.navigationController?.navigationBar.barTintColor = UIColor(netHex:0x79b951)
        self.view.backgroundColor = UIColor(netHex: 0xe6e6e6)
        
        self.showUpButton.backgroundColor = UIColor(netHex:0x79b951)
        
    }
    
    func placeTapped(placeDropDown: UILabel!){
        let colors: [String] = ["Bali", "Mauritius", "Combodia"]
        
        ActionSheetStringPicker.showPickerWithTitle(
            "Select a place",
            rows: colors,
            initialSelection: 0,
            target: self,
            successAction: Selector("onPlaceDone:"),
            cancelAction: Selector("onPlaceCancel:"),
            origin: self.view)
    }
    
    func purposeTapped(placeDropDown: UILabel!){
        let colors: [String] = ["Leisure", "Business", "Backpacking"]
        
        ActionSheetStringPicker.showPickerWithTitle(
            "Select your purpose",
            rows: colors,
            initialSelection: 0,
            target: self,
            successAction: Selector("onPurposeDone:"),
            cancelAction: Selector("onPurposeCancel:"),
            origin: self.view)
    }
    
    func foodTapped(placeDropDown: UILabel!){
        let colors: [String] = ["French", "Japanese", "Italian"]
        
        ActionSheetStringPicker.showPickerWithTitle(
            "Select your food",
            rows: colors,
            initialSelection: 0,
            target: self,
            successAction: Selector("onFoodDone:"),
            cancelAction: Selector("onFoodCancel:"),
            origin: self.view)
    }
   
    func fromTapped(fromDateDropDown: UILabel!){
        ActionSheetDatePicker.showPickerWithTitle("Departure Date", datePickerMode: UIDatePickerMode.Date, selectedDate: NSDate(), target: self, action: Selector("onFromDateDone:"), origin: self.view)
    }
    
    func onFromDateDone(picker: ActionSheetDatePicker){
        print("From Date is done")
    }
    
    func toTapped(toDateDropDown: UILabel!){
        ActionSheetDatePicker.showPickerWithTitle("Returning Date", datePickerMode: UIDatePickerMode.Date, selectedDate: NSDate(), target: self, action: Selector("onToDateDone:"), origin: self.view)
    }
    
    func onToDateDone(picker: ActionSheetDatePicker){
        print("To Date is done")
    }
    
    func onPlaceDone(picker: ActionSheetStringPicker){
        print("Place am done")
    }
    
    func onPlaceCancel(picker: ActionSheetStringPicker){
        print("Place am cancel")
    }
    
    func onPurposeDone(picker: ActionSheetStringPicker){
        print("Purpose am done")
    }
    
    func onPurposeCancel(picker: ActionSheetStringPicker){
        print("Place am cancel")
    }
    
    func onFoodDone(picker: ActionSheetStringPicker){
        print("Food am done")
    }
    
    func onFoodCancel(picker: ActionSheetStringPicker){
        print("Food am cancel")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
