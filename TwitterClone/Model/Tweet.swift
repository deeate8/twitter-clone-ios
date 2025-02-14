//
//  Tweet.swift
//  TwitterClone
//
//  Created by Dee Jordan on 9/2/2025.
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
