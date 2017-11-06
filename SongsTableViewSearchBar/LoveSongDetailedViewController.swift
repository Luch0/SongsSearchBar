//
//  LoveSongDetailedViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Luis Calle on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class LoveSongDetailedViewController: UIViewController {

    @IBOutlet weak var loveSongImage: UIImageView!
    @IBOutlet weak var loveSongTitleArtist: UILabel!
    @IBOutlet weak var loveSongTitleLabel: UILabel!
    
    var loveSong: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let loveSong = loveSong else {
            return
        }
        self.loveSongImage.image = UIImage(named: "loveSongs")
        self.loveSongTitleLabel.text = loveSong.name
        self.loveSongTitleArtist.text = loveSong.artist
    }

}
