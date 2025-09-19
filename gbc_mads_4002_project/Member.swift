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
    var attendedSessions: [Int: Int] = [:]// the key is the service's id, the value is the number of sessions attended
    var totalSessions: Int = 0
    
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
        var creditsToAdd = -1
        
        while creditsToAdd <= 0 {
            print("Type in the credits to reload. Do not enter 0: ", terminator: "")
            let input = readLine() ?? ""
            creditsToAdd = Int(input) ?? 0
        }
        
        creditBalance += creditsToAdd
    }
    
    /**
     booking a service and adding it to bookedServiceIds if it doesnt already exsist
     */
    func bookService() {
        // TODO prompt user to input service id <--Jared has finished this one! what do you think guys?
        var serviceId = -1
        
        print("Type in the input id. Do not enter -1: ", terminator: "")
        let input = readLine() ?? ""
        serviceId = Int(input) ?? -1
        
        while(serviceId == -1){//insuring we get a valid answer
            print("You entered an invalid value try again. And do not enter -1: ", terminator: "")
            let input = readLine() ?? ""
            serviceId = Int(input) ?? -1
        }
        
        if (!bookedServiceIds.contains(serviceId)) { //does not exsist in list already.
            bookedServiceIds.append(serviceId)
        }
        
        let service = Gym.getServiceById(id: serviceId)
        service!.printReceipt(member: self, creditAmount: -(service?.price ?? 0))
    }
    
    func viewBookedServices() {
        if (bookedServiceIds.isEmpty) {
            print("You have no services booked.")
            return
        }
        
        print("You currently booked: ")
        for serviceId in bookedServiceIds {
            let service = Gym.getServiceById(id: serviceId)
            if (service != nil) {
                print(service!.serviceName)
            }
        }
    }
    
    /**
     Cancellations are permitted if the member has not attended more than 1 session of a class or has not started their personal training session. Otherwise, cancellations are not allowed. If a cancellation is accepted, the original cost of the service is refunded to the member's credit balance, and the service is removed from their list of booked services.
     print Recpit will always run when cancel Service is sucessfully called
     */
    func cancelService() {
        print("Type in the service id to be cancelled: ", terminator: "")
        let input = readLine() ?? ""
        let serviceId = Int(input) ?? 0 // ?? 0 prevents the answer from being a String
        
        for i in 0..<bookedServiceIds.count {
            if(bookedServiceIds[i] == serviceId){ // the service serviceId exsists
                if((attendedSessions[serviceId] ?? -1) <= 1){ // member has attended more than 1 sessions of the service then no canceling
                    // canceling step if all requirments are met. removing from array of bookedServiceIds
                    bookedServiceIds.remove(at: i)
                    attendedSessions.removeValue(forKey: serviceId)
                    let service = Gym.getServiceById(id: serviceId)
                    creditBalance += service?.price ?? 0  // getting credit refund
                    
                    service!.printReceipt(member: self, creditAmount: service?.price ?? 0)
                    return
                } else {
                    print("Cannot cancel services with more than 1 sessions attended")
                    return
                }
            }
        }
        
        print("Cannot find service")
    }
    
    
    /**
     Has function markAttendance(id) that increases the number of attended sessions for
     the service represented by id in the parameter
     
     also removes the service id from bookedServiceIds since the current session is completed and need to be booked again
     */
    func markAttendence() {
        print("Enter the service ID you want to mark attendance for: ", terminator: "")
        let input = readLine() ?? ""
        let serviceId = Int(input) ?? 0
        
        if !bookedServiceIds.contains(serviceId) {
            print(" You have not booked a service with ID \(serviceId).")
            return
        }
        
        if attendedSessions[serviceId] == nil {
            attendedSessions[serviceId] = 1
        } else {
            attendedSessions[serviceId]! += 1
        }
        
        let currentSession = attendedSessions[serviceId]!
        
        if let service = Gym.getServiceById(id: serviceId) {
            let totalSessions = service.numberOfSessions
            print(" Attended session \(currentSession) of \(totalSessions) for \(service.serviceName)")
            
            // If all sessions completed
            if currentSession >= totalSessions {
                print("Congrulation on finishing all your sessions")
                if let index = bookedServiceIds.firstIndex(of: serviceId) {
                    bookedServiceIds.remove(at: index)
                }
                attendedSessions.removeValue(forKey: serviceId)
            }
        }
    }
}
