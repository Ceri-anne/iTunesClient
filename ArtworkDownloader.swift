//
//  ArtworkDownloader.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 29/06/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import Foundation
import UIKit

class ArtWorkDownloader: Operation {
    let album: Album
    
    init(album: Album) {
        self.album = album
        super.init()
    }
    
    override func main() {
        
        if self.isCancelled { return }
        
        guard let url = URL(string: album.artworkUrl) else { return }
        
        // TODO : - Handle try/catch properly
        let imageData = try! Data(contentsOf: url)
        
        if self.isCancelled { return }  //check again after getting imageData
        
        if imageData.count > 0 {
            album.artwork = UIImage(data: imageData)
            album.artworkState = .downloaded
        } else {
            album.artworkState = .failed
        }
        
    }
}
