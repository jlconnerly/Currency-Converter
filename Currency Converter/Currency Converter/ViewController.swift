//
//  ViewController.swift
//  Currency Converter
//
//  Created by Jake Connerly on 7/10/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //
    // MARK: - IBOutlets and Properties
    //

    @IBOutlet weak var USCurrencyTextField: UITextField!
    @IBOutlet weak var CADPesoTextField: UITextField!
    @IBOutlet weak var CADPesoLabel: UILabel!
    @IBOutlet weak var CADPesoSegmentedControl: UISegmentedControl!
    @IBOutlet weak var CovertButton: CustomButton!
    
    let CADDiff: Double = 1.31
    let pesoDiff: Double = 19.17
    
    
    //
    // MARK View LifeCycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //
    // IBActions and Functions
    //
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        updateViews()
    }
    
    @IBAction func CADPesoSCValueChange(_ sender: Any) {
        if CADPesoSegmentedControl.selectedSegmentIndex == 0 {
            CADPesoLabel.text = "Currency (CAD)"
            updateViews()
        }else {
            CADPesoLabel.text = "Currency (MXN)"
            updateViews()
        }
    }
    
    func currencyConversion(userInput: String) -> String {
        let currencyConversion: NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        guard let userInputDouble = Double(userInput),
            userInputDouble > 0  else {
                print("Invalid Entry: \(userInput)")
                return "Invalid Entry"
                
        }
        if CADPesoSegmentedControl.selectedSegmentIndex == 0 {
            currencyConversion = CADDiff * userInputDouble as NSNumber
            CADPesoLabel.text = "Currency (CAD)"
        }else {
            currencyConversion = pesoDiff * userInputDouble as NSNumber
            CADPesoLabel.text = "Currency (MXN)"
        }
        return formatter.string(from: currencyConversion) ?? "$0.00"
    }
    
    func updateViews() {
        guard let userEntry   = USCurrencyTextField.text else { return }
        let cleanUserEntry    = userEntry.replacingOccurrences(of: "$", with: "")
        CADPesoTextField.text = String(currencyConversion(userInput: cleanUserEntry))
    }
    
}

