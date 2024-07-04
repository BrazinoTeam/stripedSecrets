//
//  UserDef.swift

import Foundation
class UserDef {
    
    static let shared = UserDef()
    
    private let defaults = UserDefaults.standard
    
    var userName: String? {
        get {
            return defaults.string(forKey: "userName")
        }
        set {
            defaults.set(newValue, forKey: "userName")
        }
    }
    
    var userID: Int {
        get {
            return defaults.integer(forKey: "userID", defaultValue: 1)
        }
        set {
            defaults.set(newValue, forKey: "userID")
        }
    }
    
    
}

extension UserDefaults {
    func integer(forKey key: String, defaultValue: Int) -> Int {
        return self.object(forKey: key) as? Int ?? defaultValue
    }
}
