//
//  Tweet.swift
//  TwitterClone
//
//  Created by yamasaki shunta on 2025/02/14.
//

import Foundation
import RealmSwift


class Tweet: Object {
    @Persisted var username: String = ""
    @Persisted var createdAt: String = ""
    @Persisted var userHandle: String = ""
    @Persisted var text: String = ""
    
    init(username: String, createdAt: String, userHandle: String, text: String) {
        self.username = username as String
        self.createdAt = createdAt as String
        self.userHandle = userHandle as String
        self.text = text as String
    }
}
