//
//  Tweet.swift
//  TwitterClone
//
//  Created by yamasaki shunta on 2025/02/14.
//

import Foundation
import RealmSwift


class Tweet: Object {
    @Persisted var id: String = UUID().uuidString
    @Persisted var username: String = ""
    @Persisted var createdAt: Date = Date()
    @Persisted var userHandle: String = ""
    @Persisted var text: String = ""
    
    override class func primaryKey() -> String? {
            return "id"
        }
    
//    convenience init(id: String, username: String, createdAt: String, userHandle: String, text: String) {
//        self.init()
//        self.id = UUID().uuidString
//        self.username = username
//        self.createdAt = createdAt
//        self.userHandle = userHandle
//        self.text = text
//    }
}
