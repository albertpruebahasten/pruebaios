//
//  Player+Network.swift
//  PT Hasten
//
//  Created by Albert on 23/04/2020.
//  Copyright © 2020 Albert. All rights reserved.
//


import Alamofire
import RealmSwift
import SwiftyJSON

private let GenericError = NSError(domain: "error.generic", code: 9000, userInfo: nil)

extension Player {
    
    public static func getPlayers(_ completion: @escaping(_ success: Bool, _ error: Error?) -> ()) -> DataRequest {
        
        return NetworkProvider<PlayerSpecs>.requestJSON(.getPlayers, { (response, specs) in

            switch response.result {
            case .success(_):
                
                do {
                    guard let data = response.data else {
                        completion(false, response.error)
                        return
                    }
                    
                    let sportsArray = try JSON(data: data).arrayValue
                    
                    var players: [Player] = []
                                   
                    for sport in sportsArray {
                        let sportTitle = sport["title"].stringValue
                        let playersArray = sport["players"].arrayValue
                        
                        for player in playersArray {
                            players.append(Player(player, sport: sportTitle))
                        }
                    }
                    
                    let realm = try Realm()
                    try realm.write {
                        realm.add(players, update: .all)
                    }

                    completion(true, nil)
                } catch {
                    completion(false, error)
                }
                
            case .failure(let error):
                completion(false, error)
            }
            
        })
        
    }
}

