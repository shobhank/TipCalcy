//
//  ViewController.swift
//  TipCalcy
//
//  Created by Shobhank Sharma on 3/4/17.
//  Copyright © 2017 Shobhank Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    var tipPercent = [0.18,0.2,0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let lowTip = defaults.double(forKey: "lowTip")

        let mediumTip = defaults.double(forKey: "mediumTip")

        let highTip = defaults.double(forKey: "highTip")
        
        tipPercentControl.setTitle(("\(Int(lowTip))%") as String?, forSegmentAt: 0)
        tipPercentControl.setTitle(("\(Int(mediumTip))%") as String?, forSegmentAt: 1)
        tipPercentControl.setTitle(("\(Int(highTip))%") as String?, forSegmentAt: 2)
        
        tipPercent = [lowTip/100.0, mediumTip/100.0, highTip/100.0]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }


    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billTextField.text!) ?? 0; // default is 0 if text is null
        let tip = bill * tipPercent[tipPercentControl.selectedSegmentIndex];
        let total = tip + bill;
        tipLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "$%.2f", total);
    }

}

