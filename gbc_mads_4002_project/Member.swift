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
    var purchasedServiceIds: [Int] = []
    var bookedServiceIds: [Int] = []
    var attendedSessions: [Int: Int] = [:]
    
    //constructor
    init (id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func checkCreditBalance() {
        print("You have \(creditBalance) credits left")
    }
    
    func reloadCreditBalance(creditAmount: Int) {
        // TODO prompt user to input amount of credits to reload
        creditBalance += creditAmount
    }
    
    func purchaseService(serviceId: Int) {
        
    }
    
    func bookService(serviceId: Int) {
        if (!bookedServiceIds.contains(serviceId)) {
            bookedServiceIds.append(serviceId)
        }
    }
    
    func viewBookedServices() {
        if (bookedServiceIds.isEmpty) {
            print("You have no services booked.")
            return
        }
        
        print("You currently booked:")
        for serviceId in bookedServiceIds {
            var service = Gym.getServiceById(id: serviceId)
            if (service != nil) {
                print(service!.name)
            }
        }
    }
    
    func cancelService(serviceId: Int) {
        
    }
    
    /*
     Has function markAttendance(id) that increases the number of attended sessions for
     the service represented by id in the parameter
     
     also removes the service id from bookedServiceIds since the current session is completed and need to be booked again
     */
    func markAttendence(serviceId: Int) {
        if(attendedSessions[serviceId] == nil ){
            attendedSessions[serviceId]
        } else {
            attendedSessions[serviceId]! += 1
        }
        
        if let index = bookedServiceIds.firstIndex(of: serviceId) {
            bookedServiceIds.remove(at: index)
        }
        
        // TODO check if attended numberOfSessions for the purchased service, mark as completed if so
    }
}
