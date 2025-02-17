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
    @IBOutlet weak var userHandle: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(tweet: Tweet) {
        self.username.text = tweet.username as String
        self.tweet.text = tweet.text as String
        self.userHandle.text = "@" + (tweet.userHandle as String)
        self.createdAt.text = tweet.createdAt as String
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    func configure(with tweet: Tweet) {
//        username.text = tweet.username
//        tweet.text = tweet.text
//        userHandle.text = "@" + tweet.username
//    }
}
