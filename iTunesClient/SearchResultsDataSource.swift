//
//  SearchResultsDataSource.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 21/05/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject {
    
    public var data = [Artist]()
    
    override init(){
        super.init()
    }
    
    func update(with artists: [Artist]){
        data = artists
    }
    
}


extension SearchResultsDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        
        let artist = data[indexPath.row]
        
        cell.textLabel?.text = artist.name
        
        return cell
    }
    
    // MARK: - Helper
    
    func artist(at indexPath: IndexPath) -> Artist {
        return data[indexPath.row]
    }
}
