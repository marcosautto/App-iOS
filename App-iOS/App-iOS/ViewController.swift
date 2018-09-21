//
//  ViewController.swift
//  App-iOS
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//
//DA ELIMINARE
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        
        self.title = "VibrApp"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = view.backgroundColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
//        let layer = CAGradientLayer()
//        layer.frame = view.bounds
//        layer.colors = [UIColor.red.cgColor, UIColor.purple.cgColor]
//        layer.startPoint = CGPoint(x: 0, y: 0)
//        view.layer.addSublayer(layer)
        
        
        
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

