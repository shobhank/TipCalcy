//
//  SettingsViewController.swift
//  TipCalcy
//
//  Created by Shobhank Sharma on 3/4/17.
//  Copyright © 2017 Shobhank Sharma. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var lowTipText: UITextField!
    
    @IBOutlet weak var mediumTipText: UITextField!
    
    @IBOutlet weak var highTipText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lowTipText.becomeFirstResponder()
    }
    

    @IBAction func saveSetting(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(lowTipText.text, forKey: "lowTip")
        defaults.set(mediumTipText.text, forKey: "mediumTip")
        defaults.set(highTipText.text, forKey: "highTip")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
