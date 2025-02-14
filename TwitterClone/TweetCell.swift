//
//  TweetCell.swift
//  TwitterClone
//
//  Created by yamasaki shunta on 2025/02/14.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var tweet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with tweet: Tweet) {
        username.text = tweet.username
        tweet.text = tweet.text
    }
}
