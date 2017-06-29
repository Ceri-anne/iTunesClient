//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 27/06/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
