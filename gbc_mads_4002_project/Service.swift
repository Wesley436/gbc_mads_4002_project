//
//  Service.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class Service {
    var id: Int
    var name: String
    var numberOfSessions: Int //total number of sessions
    var price: Int // fee
    
    

    /**
     toString print
     */
    var description: String {
        return
            getServiceInfo() + 
            "\nPrice: \(price) credit(s)"
    }
    
    
    func getServiceInfo() -> String {
        return
            "Id: \(id)\n" +
            "Name: \(name)\n" +
            "Number of sessions: \(numberOfSessions)"
    }
    
    init(id: Int, name: String, numberOfSessions: Int, price: Int) {
        self.id = id
        self.name = name
        self.numberOfSessions = numberOfSessions
        self.price = price
    }
    
    func printReceipt() {
        
    }
}
