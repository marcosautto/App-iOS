//
//  selectSongScreen.swift
//  App-iOS
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import UIKit
import AudioKit


var songs: [String] = []
var selectedSong: String! = ""


class selectSong: UITableViewController {
    
    override func viewDidLoad() {
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "gradiente"))
        self.tableView.separatorColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Select a song"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
        if let theme = (UserDefaults.standard.object(forKey: "theme") as? String) {
            if theme == "light" {
                self.tableView.backgroundView?.isHidden = false
                self.navigationController?.navigationBar.tintColor = UIColor.white
            } else {
                self.tableView.backgroundView?.isHidden = true
                self.navigationController?.navigationBar.tintColor = UIColor.orange
            }
        }
        
        gettingSongsList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        songs.removeAll()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (songs.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do{
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            //            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            selectedSong = songs[indexPath.row]
        }
        catch{
            print("Error")
        }
    }
    
    
    
    func gettingSongsList()
    {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath
            {
                var mySong = song.absoluteString
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    print(mySong)
                    songs.append(mySong)
                }
            }
        }
        catch
        {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ViewController
        destVC.tapTo.isHidden = true
        destVC.songListening.isHidden = false
        destVC.songName.isHidden = false
        destVC.songName.text = selectedSong
        destVC.playButton.isHidden = false
        destVC.playButton.setImage(UIImage(named: "Pause.png"), for: .normal)
        destVC.songTiming.isHidden = false
        destVC.songLength.isHidden = false
        destVC.box.isHidden = false
    }
    
}
