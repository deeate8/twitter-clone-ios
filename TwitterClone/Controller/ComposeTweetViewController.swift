//
//  ComposeTweetViewController.swift
//  TwitterClone
//
//  Created by Dee Jordan on 9/2/2025.
//

import Foundation
import UIKit
import RealmSwift

// communicating back to home screen
protocol ComposeTweetDelegate: AnyObject {
    func didPostTweet()
}

class ComposeTweetViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    
    // delegate to communicate back to screen
    weak var delegate: ComposeTweetDelegate?
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "新しいツイート"
        textView.becomeFirstResponder()
    }
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func tweetTapped(_ sender: Any) {
        guard let tweetText = textView.text, !tweetText.isEmpty else { return }
        
        let tweet = Tweet()
        tweet.text = tweetText
        tweet.username = "User.Taro"
        tweet.userHandle = "@UserTaro1234"
        tweet.createdAt = Date()
        
        try? realm.write {
            realm.add(tweet)
        }
        delegate?.didPostTweet()
        
        dismiss(animated: true)
    }
}
