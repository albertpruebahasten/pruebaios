//
//  PlayerSpecs.swift
//  PT Hasten
//
//  Created by Albert on 23/04/2020.
//  Copyright © 2020 Albert. All rights reserved.
//


import Alamofire

// MARK: - Provider specs
enum PlayerSpecs {
    case getPlayers
}

extension PlayerSpecs: NetworkProviderSpecs {
    
    var baseURLString: String {
        return "http://demo8075302.mockable.io"
    }
    
    var path: String {
        switch self {
        case .getPlayers:
            return baseURLString + "/hastensports"
        
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPlayers:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getPlayers:
            return [ "Content-Type": "application/json"]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getPlayers:
            return JSONEncoding.default
        }
    }
    
}
