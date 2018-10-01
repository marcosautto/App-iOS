//
//  settingsScreen.swift
//  App-iOS
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit
import AVKit
var TorchVerification : Bool = false


class settingsScreen: UITableViewController {
    
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var flashlightSwitch: UISwitch!
    @IBOutlet weak var flashlightIcon: UIImageView!
    @IBOutlet weak var aboutIcon: UIImageView!
    @IBOutlet weak var nightModeIcon: UIImageView!
    @IBOutlet weak var nightModeSwitch: UISwitch!
    @IBOutlet weak var torchSwitch: UISwitch!

    @IBAction func torchSwitch(_ sender: UISwitch) {
        if sender.isOn {
            TorchVerification = true
        }
        else {
            TorchVerification = false
        }
    }
    
    
    @IBAction func nightModeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.tableView.backgroundView?.isHidden = true
            self.navigationController?.navigationBar.tintColor = UIColor.orange
            UserDefaults.standard.set("dark", forKey: "theme")
            self.flashlightSwitch.onTintColor = UIColor.orange
            self.nightModeSwitch.onTintColor = UIColor.orange
            self.flashlightIcon.image = UIImage(named: "FlashlightNight")
            self.nightModeIcon.image = UIImage(named: "NightModeNight")
            self.aboutIcon.image = UIImage(named: "AboutIconNight")
        } else {
            self.tableView.backgroundView?.isHidden = false
            self.navigationController?.navigationBar.tintColor = UIColor.white
            UserDefaults.standard.set("light", forKey: "theme")
            self.flashlightSwitch.onTintColor = UIColor.cyan
            self.nightModeSwitch.onTintColor = UIColor.cyan
            self.flashlightIcon.image = UIImage(named: "Flashlight")
            self.nightModeIcon.image = UIImage(named: "NightMode")
            self.aboutIcon.image = UIImage(named: "AboutIcon")
        }
    }
    
    
    
    override func viewDidLoad() {
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "gradiente"))
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.tableView.separatorColor = UIColor.clear
        self.tableView.backgroundColor = UIColor.black
        
        //        self.mySwitch.onTintColor = UIColor.orange
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let theme = (UserDefaults.standard.object(forKey: "theme") as? String) {
            if theme == "light" {
                themeSwitch.isOn = false
                nightModeSwitch(themeSwitch)
            } else {
                themeSwitch.isOn = true
                nightModeSwitch(themeSwitch)
            }
        }
    }
}
