//
//  Member.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class Member {
    var id: Int
    var password: String
    var name: String
    var creditBalance: Int = 0
    var bookedServiceIds: [Int] = []
    var attendedSessions: [Int: Int] = [:]
    
    //constructor
    init (id: Int, name: String, password: String) {
        self.id = id
        self.name = name
        self.password = password
    }
    
    func checkCreditBalance() {
        print("You have \(creditBalance) credits left")
    }
    
    func reloadCreditBalance() {
        // TODO prompt user to input amount of credits to reload
        creditBalance += 10
    }
    
    /**
            booking a service and adding it to bookedServiceIds if it doesnt already exsist
     */
    func bookService() {
        // TODO prompt user to input service id
        var serviceId = -1
        
        if (!bookedServiceIds.contains(serviceId)) { //does not exsist in list already.
            bookedServiceIds.append(serviceId)
        }
    }
    
    func viewBookedServices() {
        if (bookedServiceIds.isEmpty) {
            print("You have no services booked.")
            return
        }
        
        print("You currently booked: ")
        for serviceId in bookedServiceIds {
            var service = Gym.getServiceById(id: serviceId)
            if (service != nil) {
                print(service!.name)
            }
        }
    }
    
    func cancelService() {
        // TODO prompt user to input service id
    }
    
    
    /**
     Has function markAttendance(id) that increases the number of attended sessions for
     the service represented by id in the parameter
     
     also removes the service id from bookedServiceIds since the current session is completed and need to be booked again
     */
    func markAttendence() {
        // TODO prompt user to input service id
        var serviceId = -1
        
        if(attendedSessions[serviceId] == nil ){
            attendedSessions[serviceId]
        } else {
            attendedSessions[serviceId]! += 1
        }
        
        if let index = bookedServiceIds.firstIndex(of: serviceId) {
            bookedServiceIds.remove(at: index)
        }
        
        // TODO check if attended numberOfSessions for the booked service, mark as completed if so
    }
}
