//
//  TweetPostViewController.swift
//  TwitterClone
//
//  Created by Dee Jordan on 19/2/2025.
//

import UIKit
import RealmSwift

class TweetPostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var PostButton: UIButton!
    @IBOutlet weak var CancelButton: UIButton!
    @IBOutlet weak var TweetTextField: UITextView!
    
    private let username = "@Taro123"
    let realm = try! Realm()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TweetTextField.becomeFirstResponder()
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            
            TweetTextField.text = username + " "
            
            let position = TweetTextField.position(from: TweetTextField.beginningOfDocument, offset: username.count + 1)
            if let position = position {
                TweetTextField.selectedTextRange = TweetTextField.textRange(from: position, to: position)
            }
            
            TweetTextField.delegate = self
        }
    
    private func getTweetContent() -> String {
            guard let text = TweetTextField.text else { return "" }
            if text.hasPrefix(username + " ") {
                return String(text.dropFirst(username.count + 1))
            }
            return text
        }
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postTapped(_ sender: Any) {
//        guard let tweetText = TweetTextField.text, !tweetText.isEmpty else {
//                    return
//                }
        let content = getTweetContent()
        if content.isEmpty {
            let alert = UIAlertController(title: "エラー", message: "ツイート内容を入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        let tweet = Tweet()
        tweet.text = content

                try! realm.write {
                    realm.add(tweet)
                }
        
        let successAlert = UIAlertController(title: "成功", message: "ツイートを投稿しました", preferredStyle: .alert)
                            successAlert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                                self.dismiss(animated: true)
                            })
                            self.present(successAlert, animated: true)
        
        }
    }
