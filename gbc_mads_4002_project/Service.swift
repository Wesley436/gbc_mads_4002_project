//
//  Service.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class Service: IsPurchasable {
    var id: Int
    var name: String
    var numberOfSessions: Int
    var price: Int
    
    var description: String {
        return ""
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
