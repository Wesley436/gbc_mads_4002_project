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
    var creditBalance: Int = 100//Each account starts with 100 credit points, which can be reloaded at any time.
    var bookedServiceIds: [Int] = []
    var attendedSessions: [Int: Int] = [:]// the key is the service's id, the value is the number of sessions attended
    
    //constructor
    init (id: Int, name: String, password: String) {
        self.id = id
        self.name = name
        self.password = password
    }
    
    /**
     displays self.creditBalance value to the user
     */
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
        
        checkCreditBalance()//show user their current balence
    }
    
    /**
     booking a service and adding it to bookedServiceIds if it doesnt already exsist
     */
    func bookService() {
        var serviceId = -1
        
        print("Type in the input id. Do not enter -1: ", terminator: "")
        let input = readLine() ?? ""
        serviceId = Int(input) ?? -1
        
        while(serviceId == -1){//insuring we get a valid answer
            print("You entered an invalid value try again. And do not enter -1: ", terminator: "")
            let input = readLine() ?? ""
            serviceId = Int(input) ?? -1
        }
        
            if (Gym.getServiceById(id: serviceId) == nil) {//service is nil and doesnt exsist
                print("service is not real its nil")
                
            } else if (!bookedServiceIds.contains(serviceId)) { //exsits and does not exsist in list already.
            
            let service = Gym.getServiceById(id: serviceId)
            
            if(service!.price <= creditBalance){
                //perfect. requirments met. book
                bookedServiceIds.append(serviceId)
                creditBalance -= service!.price
                service!.printReceipt(member: self, creditAmount: -(service?.price ?? 0))
                
            } else {
                //too expensive
                print("insufficient funds. \nYou have: \(creditBalance) required: \(service!.price) ")
                
            }
            
        } else {//exsits in list already
            print("You have booked this service already.")
        }
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
            print("You have not booked a service with ID \(serviceId).")
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
