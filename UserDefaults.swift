//
//  UserDefaults.swift
//  XocDia
//
//  Created by Mr.Robo on 12/4/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import Foundation
extension UserDefaults {
    func contains(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
