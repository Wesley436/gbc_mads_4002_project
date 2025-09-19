//
//  PersonalTraining.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class PersonalTraining: Service {
    var sessionTime: Int // in hours
    
    override func getServiceInfo() -> String {
        return "Personal Training " + super.getServiceInfo() +
            "\nSession time: \(sessionTime) Hour(s)"
    }
    
    //constructor 
    init (id: Int, serviceName: String, numberOfSessions: Int, price: Int, sessionTime: Int) {
        self.sessionTime = sessionTime
        super.init(id: id, serviceName: serviceName, numberOfSessions: numberOfSessions, price: price)
    }
}
