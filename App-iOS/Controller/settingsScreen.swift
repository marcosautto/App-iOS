//
//  settingsScreen.swift
//  App-iOS
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit

class settingsScreen: UITableViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func nightModeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.tableView.backgroundView?.isHidden = true
           self.navigationController?.navigationBar.tintColor = UIColor.orange
        } else {
            self.tableView.backgroundView?.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
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
    


}
