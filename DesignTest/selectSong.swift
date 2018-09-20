//
//  selectSong.swift
//  DesignTest
//
//  Created by Marco Sautto on 20/09/18.
//  Copyright © 2018 Marco Sautto. All rights reserved.
//

import UIKit

class selectSong: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gettingSongsList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    func gettingSongsList()
    {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath{
                let mySong = song.absoluteString
                if mySong.contains(".mp3"){
                    print(mySong)
                }
            }
        }
        catch
        {
    
        }
    
    
}
}
