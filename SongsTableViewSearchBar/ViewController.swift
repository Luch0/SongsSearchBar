//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var songsTableView: UITableView!
    
    var allLoveSongs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songsTableView.delegate = self
        self.songsTableView.dataSource = self
        allLoveSongs = Song.loveSongs
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLoveSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songCell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        songCell.textLabel?.text = allLoveSongs[indexPath.row].name
        songCell.detailTextLabel?.text = allLoveSongs[indexPath.row].artist
        return songCell
    }
    
    
     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LoveSongDetailedViewController {
            let selectedRow = songsTableView.indexPathForSelectedRow!.row
            let selectedSong = self.allLoveSongs[selectedRow]
            destination.loveSong = selectedSong
        }
     }
 

}

