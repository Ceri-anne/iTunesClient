//
//  AlbumDetailDataSource.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 23/06/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
    private var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.reuseIdentifier, for: indexPath) as! SongCell
            
            let song = songs[indexPath.row]
            let viewModel = SongViewModel(song: song)
            
            cell.configure(with: viewModel)
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Tracks" : nil
    }

    func update(with songs: [Song]) {
        self.songs = songs
    }
}
