import UIKit
import RealmSwift


class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var hometableView: UITableView!
    
    var tweets: Results<Tweet>?
    let realm = try! Realm()
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            hometableView.delegate = self
            hometableView.dataSource = self
            hometableView.register(UITableViewCell.self, forCellReuseIdentifier: "TweetCell")
            loadTweets()
        }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           hometableView.reloadData()
       }
    
    
    func loadTweets() {
            let realm = try! Realm()
            tweets = realm.objects(Tweet.self).sorted(byKeyPath: "createdAt", ascending: false)
    
        notificationToken = tweets?.observe { [weak self] (changes) in
            guard let tableView = self?.hometableView else { return }
                    
                switch changes {
                case .initial:
                        tableView.reloadData()
                case .update(_, let deletions, let insertions, let modifications):
                    tableView.performBatchUpdates({
                    tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                        })
                    case .error(let error):
                        print("Error: \(error)")
                    }
                }
            }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tweets?.count ?? 0
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = hometableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath)
            if let tweet = tweets?[indexPath.row] {
                cell.textLabel?.text = tweet.text
                cell.detailTextLabel?.text = "\(tweet.createdAt)"
            }
            return cell
        }
}
