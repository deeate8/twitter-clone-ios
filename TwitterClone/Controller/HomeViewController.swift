//
//  ViewController.swift
//  TwitterClone
//
//  Created by Dee Jordan on 10/2/2025.
//

import UIKit
import RealmSwift


class HomeViewController: UIViewController, ComposeTweetDelegate {
    func didPostTweet() {
        loadTweets()
    }
    
        
        @IBOutlet weak var TableView: UITableView!
        
        private var tweets: Results<Tweet>?
        private let realm = try! Realm()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "ホーム"
            loadTweets()
        }
        
        // fetch tweets
        private func loadTweets() {
            tweets = realm.objects(Tweet.self).sorted(byKeyPath: "createdAt", ascending: false)
            TableView.reloadData()
        }
        
        // compose button tapped
        
        @IBAction func composeTweetTapped(_ sender: Any) {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            // compose tweet screen
            if let composeTweetVC = storyboard.instantiateViewController(withIdentifier: "ComposeTweetViewController") as? ComposeTweetViewController {
                
                // delegation
                composeTweetVC.delegate = self
                
                // Wrap up in nav cont for nav bar
                let nav = UINavigationController(rootViewController: composeTweetVC)
                present(nav, animated: true)
            }
        }
    }
    // Handdle table view data
    
    extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tweets?.count ?? 0
        }
        
        
        // return # of rows needed
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
            
            if let tweet = tweets?[indexPath.row] {
                cell.configure(with: tweet)
            }
            return cell
        }
    }
    
    // For hamdling updates
//extension HomeViewController: ComposeTweetDelegate {
//    func didPostTweet() {
//        loadTweets()  // Reload tweets to show new one
//    }
//}
