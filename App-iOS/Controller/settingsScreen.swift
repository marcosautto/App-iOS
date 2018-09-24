//
//  settingsScreen.swift
//  App-iOS
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit

class settingsScreen: UITableViewController {

    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBAction func nightModeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.tableView.backgroundView?.isHidden = true
            UserDefaults.standard.set("dark", forKey: "theme")
        } else {
            self.tableView.backgroundView?.isHidden = false
            UserDefaults.standard.set("light", forKey: "theme")
        }
    }
    
    override func viewDidLoad() {
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "gradiente"))
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.tableView.separatorColor = UIColor.clear
        self.tableView.backgroundColor = UIColor.black
        
        self.mySwitch.onTintColor = UIColor.orange
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
