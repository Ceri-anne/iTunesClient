//
//  SongCell.swift
//  iTunesClient
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 23/06/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    static let reuseIdentifier = "SongCell"
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songRunTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: SongViewModel) {
        self.songTitleLabel.text = viewModel.title
        self.songRunTimeLabel.text = viewModel.runtime
    }

}
