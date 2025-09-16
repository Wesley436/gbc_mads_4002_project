//
//  FitnessClass.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class FitnessClass: Service {
    var duration: Double // in hours
    var trainerName: String
    
    override func getServiceInfo() -> String {
        return super.getServiceInfo() +
            "\nDuration: \(duration)\n Hour(s)" +
            "Trainer name: \(trainerName)"
    }
    
    init (id: Int, name: String, numberOfSessions: Int, price: Int, duration: Double, trainerName: String) {
        self.duration = duration
        self.trainerName = trainerName
        super.init(id: id, name: name, numberOfSessions: numberOfSessions, price: price)
    }
}
