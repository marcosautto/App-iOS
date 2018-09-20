//
//  SettingsViewController.swift
//  DesignTest
//
//  Created by Marco Sautto on 19/09/18.
//  Copyright © 2018 Marco Sautto. All rights reserved.
//

import UIKit


class SettingsViewController: UITableViewController, UINavigationControllerDelegate {
    
    
    
//    @IBAction func nightModeSwitch(_ sender: UISwitch) {
//        if sender.isOn{
//
//
//        }
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

}
