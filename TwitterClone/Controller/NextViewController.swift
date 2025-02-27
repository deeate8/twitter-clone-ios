//
//  NextViewController.swift
//  TwitterClone
//
//  Created by Dee Jordan on 19/2/2025.
//

import UIKit
import RealmSwift

class NextViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var NextTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextTableView.register(UINib(nibName:"ComposeTweetController" , bundle: nil), forCellReuseIdentifier: "ComposeTweetController")
        NextTableView.delegate = self
        NextTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
      }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComposeTweetController", for: indexPath) as! ComposeTweetController
        return cell
    }
}
