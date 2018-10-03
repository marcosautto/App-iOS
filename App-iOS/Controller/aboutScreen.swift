//
//  aboutScreen.swift
//  App-iOS
//
//  Created by Marco Sautto on 24/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit

class aboutScreen: UITableViewController {
    //OUTLET IMG
    @IBOutlet weak var lb: UIImageView!
    @IBOutlet weak var mc: UIImageView!
    @IBOutlet weak var mdl: UIImageView!
    @IBOutlet weak var le: UIImageView!
    @IBOutlet weak var al: UIImageView!
    @IBOutlet weak var fp: UIImageView!
    @IBOutlet weak var ms: UIImageView!
    @IBOutlet weak var vs: UIImageView!
    
    //OUTLET LABEL
    @IBOutlet weak var lbLab: UILabel!
    @IBOutlet weak var mcLab: UILabel!
    @IBOutlet weak var mdlLab: UILabel!
    @IBOutlet weak var leLab: UILabel!
    @IBOutlet weak var alLab: UILabel!
    @IBOutlet weak var fpLab: UILabel!
    @IBOutlet weak var msLab: UILabel!
    @IBOutlet weak var vsLab: UILabel!
    
    
    
    override func viewDidLoad() {
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "gradiente"))
        self.tableView.separatorColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Team about"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.lb.layer.cornerRadius = self.lb.frame.size.width / 2
        self.mc.layer.cornerRadius = self.mc.frame.size.width / 2
        self.mdl.layer.cornerRadius = self.mdl.frame.size.width / 2
        self.le.layer.cornerRadius = self.le.frame.size.width / 2
        self.al.layer.cornerRadius = self.al.frame.size.width / 2
        self.fp.layer.cornerRadius = self.fp.frame.size.width / 2
        self.ms.layer.cornerRadius = self.ms.frame.size.width / 2
        self.vs.layer.cornerRadius = self.vs.frame.size.width / 2
        
        if let theme = (UserDefaults.standard.object(forKey: "theme") as? String) {
            if theme == "light" {
                self.tableView.backgroundView?.isHidden = false
                self.navigationController?.navigationBar.tintColor = UIColor.white
                self.lbLab.textColor = UIColor.white
                self.mcLab.textColor = UIColor.white
                self.mdlLab.textColor = UIColor.white
                self.leLab.textColor = UIColor.white
                self.alLab.textColor = UIColor.white
                self.fpLab.textColor = UIColor.white
                self.msLab.textColor = UIColor.white
                self.vsLab.textColor = UIColor.white
            } else {
                self.tableView.backgroundView?.isHidden = true
                self.navigationController?.navigationBar.tintColor = UIColor.orange
                self.lbLab.textColor = UIColor.orange
                self.mcLab.textColor = UIColor.orange
                self.mdlLab.textColor = UIColor.orange
                self.leLab.textColor = UIColor.orange
                self.alLab.textColor = UIColor.orange
                self.fpLab.textColor = UIColor.orange
                self.msLab.textColor = UIColor.orange
                self.vsLab.textColor = UIColor.orange
            }
        }
        
        super.viewDidLoad()
    }
    
    
}
