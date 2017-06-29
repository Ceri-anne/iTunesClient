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
    
    init(albums: [Album]) {
        self.albums = albums
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
        
        return albumCell
    }
    
    // MARK: - Helper
    
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
    
    func update(with albums: [Album]) {
        self.albums = albums    
    }
}
