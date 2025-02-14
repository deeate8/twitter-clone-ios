//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Dee Jordan on 9/2/2025.
//

import Foundation
import UIKit

// twitter cell class

class TweetCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetText: UILabel!

    
    
    
    func configure(with tweet: Tweet) {
        usernameLabel.text = tweet.username
        handleLabel.text = tweet.userHandle
        tweetText.text = tweet.text 
    }
}
