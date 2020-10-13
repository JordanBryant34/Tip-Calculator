//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jordan Bryant on 10/12/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tenPercentButton: CalcButton!
    @IBOutlet weak var fifteenPercentButton: CalcButton!
    @IBOutlet weak var twentyPercentButton: CalcButton!
    @IBOutlet weak var amountTextField: CalcTextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    
    var tipPercent: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tenPercentButton.addTarget(self, action: #selector(tipButtonTapped), for: .touchUpInside)
        fifteenPercentButton.addTarget(self, action: #selector(tipButtonTapped), for: .touchUpInside)
        twentyPercentButton.addTarget(self, action: #selector(tipButtonTapped), for: .touchUpInside)
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .backgroundColor()
        calculateButton.backgroundColor = .primaryBlue()
        calculateButton.setTitleColor(.white, for: .normal)
    }
    
    @objc func tipButtonTapped(sender: CalcButton) {
        let buttons = [tenPercentButton, fifteenPercentButton, twentyPercentButton]
        
        for button in buttons {
            button?.toggleButton(selected: false)
        }
        
        sender.toggleButton(selected: true)
        
        switch sender {
        case tenPercentButton:
            tipPercent = 0.1
        case fifteenPercentButton:
            tipPercent = 0.15
        case twentyPercentButton:
            tipPercent = 0.2
        default:
            tipPercent = 0.0
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let amountString = amountTextField.text, !amountString.isEmpty else { return }
        guard let amount = Double(amountString) else { return }
        
        if tipPercent > 0 {
            let tipAmount = amount * tipPercent
            let total = amount + tipAmount
            
            amountLabel.text = "Tip: \(tipAmount)\n\nTotal: \(total)"
        }
    }
    
}

