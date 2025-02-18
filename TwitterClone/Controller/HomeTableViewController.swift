import UIKit
import RealmSwift


class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var hometableView: UITableView!
    
    private var tweets: [Tweet] = []
//    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hometableView.register(UINib(nibName:"TweetCell" , bundle: nil), forCellReuseIdentifier: "tweetcell")
        hometableView.delegate = self
        hometableView.dataSource = self
//        self.setTweets()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      }
    
//    func setTweets() {
//        tweets = [Tweet(username: "User.Taro", createdAt: "today", userHandle: "@123", text: "テストテストテストテスト")]
//    }
    
    
    
    // fetch tweets
//    private func loadTweets() {
//        let tweet = Tweet()
//        tweet.text = "テストテストテストテスト"
//        tweet.username = "User.Taro"
//        tweets = [tweet]
//        hometableView.reloadData()
//    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
      }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetcell", for: indexPath) as! TweetCell
        
//        cell.setCell(tweet: tweets[indexPath.row])
        return cell
    }
}
//(with: tweets[indexPath.row])
