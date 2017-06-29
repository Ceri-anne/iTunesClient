//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 29/06/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}
