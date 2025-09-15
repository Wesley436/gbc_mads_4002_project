//
//  PersonalTraining.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class PersonalTraining: Service {
    var sessionTime: Double // in hours
    
    init (id: Int, name: String, numberOfSessions: Int, price: Int, duration: Double, sessionTime: Double) {
        self.sessionTime = sessionTime
        super.init(id: id, name: name, numberOfSessions: numberOfSessions, price: price)
    }
}
