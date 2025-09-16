//
//  PersonalTraining.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class PersonalTraining: Service {
    var sessionTime: Double // in hours
    
    override func getServiceInfo() -> String {
        return super.getServiceInfo() +
            "\nSession time: \(sessionTime)\n Hour(s)"
    }
    
    //constructor 
    init (id: Int, name: String, numberOfSessions: Int, price: Int, sessionTime: Double) {
        self.sessionTime = sessionTime
        super.init(id: id, name: name, numberOfSessions: numberOfSessions, price: price)
    }
}
