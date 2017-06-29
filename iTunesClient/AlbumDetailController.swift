//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 23/06/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    var album: Album? {
        didSet {
            if let album = album {
                configure(with: album)
                dataSource.update(with: album.songs)
                tableView.reloadData()
            }
        }
    }
    
    var dataSource = AlbumDetailDataSource(songs: [])
        
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let album = album {
            configure(with: album)
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

  
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        
        // Add implementation for artwork view
        albumTitleLabel.text = viewModel.title
        albumGenreLabel.text = viewModel.genre
        albumReleaseDateLabel.text = viewModel.releaseDate
    }
   
}
