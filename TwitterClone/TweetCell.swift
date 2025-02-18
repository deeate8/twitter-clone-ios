//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Dee Jordan on 18/2/2025.
//

import UIKit

class TweetCell: UITableViewCell {
    @IBOutlet weak var username: UILabel!

    @IBOutlet weak var tweetText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
