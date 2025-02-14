import UIKit
import RealmSwift


class HomeViewController: UIViewController, ComposeTweetDelegate {
   
    @IBOutlet weak var hometableView: UITableView!
    
    
    func didPostTweet() {
        loadTweets()
    }
    
    private var tweets: [Tweet] = []
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ホーム"
        hometableView.register(UINib(nibName:"TweetCell" , bundle: nil), forCellReuseIdentifier: "tweetcell")
        hometableView.delegate = self
        hometableView.dataSource = self
    
        loadTweets()
    }
    
    // fetch tweets
    private func loadTweets() {
        let tweet = Tweet()
        tweet.text = "テストテストテストテスト"
        tweet.username = "User.Taro"
        tweets = [tweet]
        hometableView.reloadData()
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
        return tweets.count
    }
    
    
    // return # of rows needed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetcell", for: indexPath) as! TweetCell
        
       // if let tweet = tweets[indexPath.row] {
            cell.configure(with: tweets[indexPath.row])
       // }
        return cell
    }
}

// For hamdling updates
//extension HomeViewController: ComposeTweetDelegate {
//    func didPostTweet() {
//        loadTweets()  // Reload tweets to show new one
//    }
//}
