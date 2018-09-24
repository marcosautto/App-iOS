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
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func playPauseButton(_ sender: Any) {
        if (audioPlayer.isPlaying)
        {
            audioPlayer.pause();
            playButton.setImage(UIImage(named: "Play.png"), for: .normal)
        }
        else
        {
            audioPlayer.play();
            playButton.setImage(UIImage(named: "Pause.png"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        
        self.title = "VibrApp"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = view.backgroundColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.view.backgroundColor = UIColor.black
        
        view.addSubview(selectSongButton)
        
        func pulseButton(){
            selectSongButton.pulsate()
        }
        
        pulseButton()
        
        
        super.viewDidLoad()
//        songName.text = selectedSong
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        songName.text = selectedSong
        func pulseButton(){
            selectSongButton.pulsate()
        }
        
        pulseButton()
        
        if let theme = (UserDefaults.standard.object(forKey: "theme") as? String) {
            if theme == "light" {
                self.imgview.isHidden = false
            } else {
                self.imgview.isHidden = true
        }
    }
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue){
        
    }

}

