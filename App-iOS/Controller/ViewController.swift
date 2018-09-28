//
//  ViewController.swift
//  App-iOS
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit
import AudioKit
var player = AKPlayer(audioFile: file)
var file = try! AKAudioFile(readFileName: selectedSong+".mp3")
var tracker = AKFrequencyTracker(player)
var frequency = 0.0
var amplitude = 0.0

class ViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var selectSongButton: UIButton!
    @IBOutlet weak var tapTo: UILabel!
    @IBOutlet weak var songListening: UILabel!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var freq: UILabel!
    @IBOutlet weak var amp: UILabel!
    @IBOutlet weak var songTiming: UILabel!
    @IBOutlet weak var songLenght: UILabel!
    
    @IBAction func playPauseButton(_ sender: Any) {
        
        func pulse(){
            selectSongButton.pulsate()
        }
        
        func pulseStop(){
            selectSongButton.pulsateStop()
        }
        
        if player.isPlaying
        {
            player.pause()
            playButton.setImage(UIImage(named: "Play.png"), for: .normal)
            pulseStop()
            
        }
        else
        {
            player.resume();
            playButton.setImage(UIImage(named: "Pause.png"), for: .normal)
            pulse()
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
        
        //Animazione tapTo
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.tapTo.center = CGPoint(x: 250, y:40 - 500)
        }, completion: nil)
        
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func akplay(){
        
        AKSettings.playbackWhileMuted = true //BACKGROUND MODE CODE
        
        file = try! AKAudioFile(readFileName: selectedSong+".mp3")
        player.detach()
        player = AKPlayer(audioFile: file)
        
        player.isLooping = true
        player.buffering = .always
        tracker = AKFrequencyTracker(player)
        
        AudioKit.output = tracker
        try! AudioKit.start()
        player.play()
        selectedSong = ""
        AKPlaygroundLoop(every: 0.01){
            
            frequency = tracker.frequency
            amplitude = tracker.amplitude
            
            self.songTiming.text = secondsToHoursMinutesSeconds(inputSeconds: Int(player.currentTime))
            
            
            //            String(format: "%.2f", frequency)
            self.freq.text = "\(String(format: "%.3f", frequency))"
            self.amp.text = "\(String(format: "%.3f", amplitude))"
            
            if player.isPlaying{
                switch(Int(tracker.frequency)){
                case 30...90:
                    Vibration.selection.vibrate()
                case 91...140:
                    Vibration.light.vibrate()
                case 141...190:
                    Vibration.warning.vibrate()
                case 191...210:
                    Vibration.heavy.vibrate()
                case 211...260:
                    Vibration.medium.vibrate()
                case 261...300:
                    Vibration.error.vibrate()
                case 301...340:
                    Vibration.success.vibrate()
                case 341...100000:
                    Vibration.medium.vibrate()
                    
                default:
                    break
                }
            }
        }
    }
    
    enum Vibration {
        case error
        case success
        case warning
        case light
        case medium
        case heavy
        case selection
        case oldSchool
        
        func vibrate() {
            
            switch self {
            case .error:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
                
            case .success:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                
            case .warning:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.warning)
                
            case .light:
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                
            case .medium:
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
            case .heavy:
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
                
            case .selection:
                let generator = UISelectionFeedbackGenerator()
                generator.selectionChanged()
                
            case .oldSchool:
                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
            
        }
        
        
    }//END ENUM
    
    override func viewWillAppear(_ animated: Bool) {
        
        if selectedSong != ""{
            akplay()
            songName.text = selectedSongLabel;
        }
        
        if let theme = (UserDefaults.standard.object(forKey: "theme") as? String) {
            if theme == "light" {
                self.imgview.isHidden = false
                songListening.textColor = UIColor.white
                tapTo.textColor = UIColor.white
            } else {                                //Night Mode
                self.imgview.isHidden = true
                songListening.textColor = UIColor.orange
                tapTo.textColor = UIColor.orange
            }
            
            
        }
        
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue){
        func pulse(){
            selectSongButton.pulsate()
        }
        pulse()
    }
    
}

