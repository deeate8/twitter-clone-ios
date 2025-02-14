//
//  Tweet.swift
//  TwitterClone
//
//  Created by yamasaki shunta on 2025/02/14.
//

import Foundation
import RealmSwift

// variables

class Tweet: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var text: String = ""
    @Persisted var username: String = ""
    @Persisted var userHandle: String = ""
    @Persisted var createdAt: Date = Date()
}
