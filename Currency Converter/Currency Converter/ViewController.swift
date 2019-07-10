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
    
    let CADDiff: Double = 1.31
    let pesoDiff: Double = 19.17
    let currencyUpdate = "$0.00"
    
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
        guard let userEntry = USCurrencyTextField.text else { return }
        CADPesoTextField.text = String(currencyConversion(userInput: userEntry))
    }
    
    @IBAction func CADPesoSCValueChange(_ sender: Any) {
        if CADPesoSegmentedControl.selectedSegmentIndex == 0 {
            CADPesoLabel.text = "Currency (CAD)"
            guard let userEntry = USCurrencyTextField.text else { return }
            CADPesoTextField.text = String(currencyConversion(userInput: userEntry))
        }else {
            CADPesoLabel.text = "Currency (MXN)"
            guard let userEntry = USCurrencyTextField.text else { return }
            CADPesoTextField.text = String(currencyConversion(userInput: userEntry))
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
    
    
}

