//
//  UserDef.swift

import Foundation
class UserDef {
    
    static let shared = UserDef()
    
    private let defaults = UserDefaults.standard
    
    var scorePoints: Int {
        get {
            return defaults.integer(forKey: "scorePoints", defaultValue: 1500)
        }
        set {
            defaults.set(newValue, forKey: "scorePoints")
        }
    }
    
    var answerQuestions: Int {
        get {
            return defaults.integer(forKey: "answerQuestions", defaultValue: 0)
        }
        set {
            defaults.set(newValue, forKey: "answerQuestions")
        }
    }
    
    var lastBonusDate: Date? {
        get {
            return defaults.object(forKey: "lastBonusDate") as? Date
        }
        set {
            defaults.set(newValue, forKey: "lastBonusDate")
        }
    }
    
    var firstLaunchDate: Date? {
        get {
            return defaults.object(forKey: "firstLaunchDate") as? Date
        }
        set {
            defaults.set(newValue, forKey: "firstLaunchDate")
        }
    }
    
    var userName: String? {
        get {
            return defaults.string(forKey: "userName")
        }
        set {
            defaults.set(newValue, forKey: "userName")
        }
    }
    
    var userID: Int? {
        get {
            return defaults.object(forKey: "userID") as? Int
        }
        set {
            defaults.set(newValue, forKey: "userID")
        }
    }
    
    var tigerEnthusiast: Bool {
        get {
            return defaults.bool(forKey: "tigerEnthusiast")
        }
        set {
            defaults.set(newValue, forKey: "tigerEnthusiast")
            updateTigerGuardian()
        }
    }
    
    var tigerExpert: Bool {
        get {
            return defaults.bool(forKey: "tigerExpert")
        }
        set {
            defaults.set(newValue, forKey: "tigerExpert")
            updateTigerGuardian()
        }
    }
    
    var tigerMaster: Bool {
        get {
            return defaults.bool(forKey: "tigerMaster")
        }
        set {
            defaults.set(newValue, forKey: "tigerMaster")
            updateTigerGuardian()
        }
    }
    
    var stealthyHunter: Bool {
        get {
            return defaults.bool(forKey: "stealthyHunter")
        }
        set {
            defaults.set(newValue, forKey: "stealthyHunter")
            updateTigerGuardian()
        }
    }
    
    var tigerTracker: Bool {
        get {
            return defaults.bool(forKey: "tigerTracker")
        }
        set {
            defaults.set(newValue, forKey: "tigerTracker")
            updateTigerGuardian()
        }
    }
    
    var knowledgeHoarder: Bool {
        get {
            return defaults.bool(forKey: "knowledgeHoarder")
        }
        set {
            defaults.set(newValue, forKey: "knowledgeHoarder")
            updateTigerGuardian()
        }
    }
    
    var tigerGuardian: Bool {
        get {
            return defaults.bool(forKey: "tigerGuardian")
        }
        set {
            defaults.set(newValue, forKey: "tigerGuardian")
        }
    }
    
    var uniqueValues: Set<Int> {
           get {
               return defaults.object(forKey: "uniqueValues") as? Set<Int> ?? []
           }
           set {
               defaults.set(Array(newValue), forKey: "uniqueValues")
               updateTigerTracker()
           }
       }
       
       private func updateTigerGuardian() {
           let guardian = tigerEnthusiast && tigerExpert && tigerMaster && stealthyHunter && tigerTracker && knowledgeHoarder
           tigerGuardian = guardian
       }
       
       private func updateTigerTracker() {
           let requiredValues: Set<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
           tigerTracker = requiredValues.isSubset(of: uniqueValues)
       }
       
       func addUniqueValue(_ value: Int) {
           var values = uniqueValues
           values.insert(value)
           uniqueValues = values
       }
}

extension UserDefaults {
    func integer(forKey key: String, defaultValue: Int) -> Int {
        return self.object(forKey: key) as? Int ?? defaultValue
    }
}
