//
//  Player.swift
//  PT Hasten
//
//  Created by Albert on 23/04/2020.
//  Copyright © 2020 Albert. All rights reserved.
//

import RealmSwift
import SwiftyJSON

final class Player: Object {
    
    @objc dynamic var id = -1
    @objc dynamic var name = ""
    @objc dynamic var surname = ""
    @objc dynamic var sport = ""
    @objc dynamic var imageUrl = ""
        
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience required init(_ jsonObject: JSON, sport: String) {
        self.init()
        
        self.id = jsonObject["id"].int ?? -1
        self.name = jsonObject["name"].string ?? ""
        self.surname = jsonObject["surname"].string ?? ""
        self.imageUrl = jsonObject["image"].string ?? ""
        self.sport = sport
    }
    
}

