//
//  Member.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class Member {
    var id: Int
    var name: String
    var creditBalance: Int = 0
    var purchasedServices: [Service] = []
    var bookedServices: [Service] = []
    var attendedSessions: [Int: Int] = [:]
    
    //constructor
    init (id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func checkCreditBalance() -> Int {
        return self.creditBalance
    }
    
    func reloadCreditBalance(creditAmount: Int) {
        self.creditBalance += creditAmount
    }
    
    func purchaseService(serviceId: Int) {
        
    }
    
    func bookService(serviceId: Int) {
        
    }
    
    func viewBookedServices() {
        
    }
    
    func cancelService(serviceId: Int) {
        
    }
    
    /*
     Has function markAttendance(id) that increases the number of attended sessions for
     the service represented by id in the parameter
     */
    func markAttendence(serviceId: Int) {
        if(attendedSessions[serviceId] == nil ){
            attendedSessions[serviceId]
        } else {
            attendedSessions[serviceId]! += 1
        }
        
    }
}
