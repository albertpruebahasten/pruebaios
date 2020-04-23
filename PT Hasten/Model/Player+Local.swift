//
//  Player+Local.swift
//  PT Hasten
//
//  Created by Albert on 23/04/2020.
//  Copyright © 2020 Albert. All rights reserved.
//

import RealmSwift

extension Player {
    static var all: Results<Player> {
        return try! Realm().objects(self).sorted(byKeyPath: "surname", ascending: true)
    }
}



