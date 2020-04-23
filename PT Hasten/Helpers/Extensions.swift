//
//  Extensions.swift
//  PT Hasten
//
//  Created by Albert on 23/04/2020.
//  Copyright © 2020 Albert. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}
