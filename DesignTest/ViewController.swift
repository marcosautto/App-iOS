//
//  ViewController.swift
//  DesignTest
//
//  Created by Marco Sautto on 19/09/18.
//  Copyright © 2018 Marco Sautto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    
    override func viewDidLoad() {

        self.title = "VibrApp"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = view.backgroundColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let textAttribute = [NSAttributedStringKey.foregroundColor:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttribute
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.red.cgColor, UIColor.purple.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        view.layer.addSublayer(layer)
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    

}

