//
//  settingsScreen.swift
//  App-iOS
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit

class settingsScreen: UITableViewController {

    @IBAction func nightModeSwitch(_ sender: Any) {
        //LUIGI CONTROLLA QUA
        self.tableView.backgroundView.clear
    }
    
    override func viewDidLoad() {
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "gradiente"))
        
        self.tableView.separatorColor = UIColor.clear
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
