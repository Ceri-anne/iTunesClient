//
//  AlbumDetailViewModel.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 23/06/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import Foundation

struct AlbumDetailViewModel {
    
    let title: String
    let releaseDate: String
    let genre: String
}

extension AlbumDetailViewModel {
    
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = "MMM dd, yyyy"
        self.releaseDate = formatter.string(from: album.releaseDate)
        
    }
}
