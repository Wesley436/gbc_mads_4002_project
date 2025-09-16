//
//  Service.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class Service: IsPurchasable {
    var id: Int
    var serviceName: String
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
            "Service name: \(serviceName)\n" +
            "Number of sessions: \(numberOfSessions)"
    }
    
    init(id: Int, serviceName: String, numberOfSessions: Int, price: Int) {
        self.id = id
        self.serviceName = serviceName
        self.numberOfSessions = numberOfSessions
        self.price = price
    }
    
    func printReceipt(member: Member) {
        
    }
}
