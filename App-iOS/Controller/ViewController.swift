//
//  ViewController.swift
//  App-iOS
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var selectSongButton: UIButton!
    @IBOutlet weak var tapTo: UILabel!
    @IBOutlet weak var songListening: UILabel!
    @IBOutlet weak var songName: UILabel!
    
    override func viewDidLoad() {
        
        self.title = "VibrApp"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = view.backgroundColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        view.addSubview(selectSongButton)
        
        
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue){
        
    }

}

