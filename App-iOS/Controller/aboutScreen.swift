//
//  aboutScreen.swift
//  App-iOS
//
//  Created by Marco Sautto on 24/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit

class aboutScreen: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "About"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        super.viewDidLoad()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//
//        if let theme = (UserDefaults.standard.object(forKey: "theme") as? String) {
//            if theme == "light" {
//                self.imgview.isHidden = false
//            } else {                                //Night Mode
//                self.imgview.isHidden = true
//            }
//        }
//
//        self.navigationController?.navigationBar.isHidden = false
//    }
    
    
}
