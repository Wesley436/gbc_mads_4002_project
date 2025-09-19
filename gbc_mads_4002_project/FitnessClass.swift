//
//  FitnessClass.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class FitnessClass: Service {
    var duration: Int // in hours
    var trainerName: String
    
    override func getServiceInfo() -> String {
        return "Fitness Class " + super.getServiceInfo() +
            "\nDuration: \(duration) Hour(s)\n" +
            "Trainer name: \(trainerName)"
    }
    
    //constructor 
    init (id: Int, serviceName: String, numberOfSessions: Int, price: Int, duration: Int, trainerName: String) {
        self.duration = duration
        self.trainerName = trainerName
        super.init(id: id, serviceName: serviceName, numberOfSessions: numberOfSessions, price: price)
    }
}
