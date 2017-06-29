//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 21/05/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject {

    var albums: [Album]
    
    let pendingOperations = PendingOperations()
    let tableView: UITableView
    
    init(albums: [Album], tableView: UITableView) {
        self.albums = albums
        self.tableView = tableView
        super.init()
    }
}

extension AlbumListDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell
        
        let album = albums[indexPath.row]
        let viewModel = AlbumCellViewModel(album: album)
        
        albumCell.configure(with: viewModel)
        albumCell.accessoryType = .disclosureIndicator
        
        if album.artworkState == .placeholder {
            downloadArtworkForAlbum(album, at: indexPath)
        }
        
        
        return albumCell
    }
    
    // MARK: - Helper
    
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
    
    func update(with albums: [Album]) {
        self.albums = albums    
    }
    
    func downloadArtworkForAlbum(_ album: Album, at indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = ArtWorkDownloader(album: album)
        
        downloader.completionBlock = {
            if downloader.isCancelled { return }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
}
