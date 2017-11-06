//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var songsTableView: UITableView!
    @IBOutlet weak var songSearchBar: UISearchBar!
    
    var allLoveSongs = [Song]()
    
    var searchTerm: String? {
        didSet {
            self.songsTableView.reloadData()
        }
    }
    
    var filteredSongArr: [Song] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return allLoveSongs
        }
        guard let scopeTitles = self.songSearchBar.scopeButtonTitles else {
            return allLoveSongs
        }
        let selectedIndex = self.songSearchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        switch filteringCriteria {
        case "Title":
            return allLoveSongs.filter{(song) in
                song.name.lowercased().contains(searchTerm.lowercased())
            }
        case "Artist":
            return allLoveSongs.filter{(song) in
                song.artist.lowercased().contains(searchTerm.lowercased())
            }
        default:
            return allLoveSongs
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songsTableView.delegate = self
        self.songsTableView.dataSource = self
        self.songSearchBar.delegate = self
        allLoveSongs = Song.loveSongs
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSongArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songCell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        songCell.textLabel?.text = filteredSongArr[indexPath.row].name
        songCell.detailTextLabel?.text = filteredSongArr[indexPath.row].artist
        return songCell
    }
    
    
     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LoveSongDetailedViewController {
            let selectedRow = songsTableView.indexPathForSelectedRow!.row
            let selectedSong = self.filteredSongArr[selectedRow]
            destination.loveSong = selectedSong
        }
     }
    
    // MARK: - Search Bar Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        songsTableView.reloadData()
    }

}

