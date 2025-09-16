//
//  Gym.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class Gym {
    static var nextServiceId = 1
    static var nextMemberId = 1
    static var services: [Service] = [
        Service(id: 1000, serviceName: "Test 1", numberOfSessions: 3, price: 10),
        Service(id: 1001, serviceName: "Test 2", numberOfSessions: 3, price: 10),
        Service(id: 1002, serviceName: "Test 3", numberOfSessions: 3, price: 10)
    ]
    static var members: [Member] = []
    
    class func gymOwnerMenu() {
        var exitMenu = false
        while !exitMenu {
            print("Gym Owner Menu")
            print("1: Add service")
            print("2: Search service")
            print("3: List all services")
            print("Type '0' to exit")
            
            let input = readLine() ?? ""
            
            if let option = Int(input) {
                switch option {
                    case 1:
                        addService()
                    case 2:
                        searchServicesByName()
                    case 3:
                        listAllServices()
                    case 0:
                        exitMenu = true
                    default:
                        break
                }
            }
        }
    }

    class func memberSignInMenu() {
        var exitMenu = false
        while !exitMenu {
            print("Sign in Menu")
            print("1: Sign in")
            print("2: Create account")
            print("Type '0' to exit")
            
            let input = readLine() ?? ""
            
            if let option = Int(input) {
                switch option {
                    case 1:
                        memberSignIn()
                    case 2:
                        addMember()
                    case 0:
                        exitMenu = true
                    default:
                        break
                }
            }
        }
    }

    class func addMember() {
        var name = ""
        var password = ""
        
        while name.isEmpty {
            print("Enter your name: ", terminator: "")
            name = readLine() ?? ""
        }
        
        while password.isEmpty {
            print("Enter your password: ", terminator: "")
            password = readLine() ?? ""
        }
        
        let member = Member(id: nextMemberId, name: name, password: password)
        self.members.append(member)
        nextMemberId += 1
        
        print("Your member Id is: \(member.id)")
        memberSignedInMenu(member: member)
    }
    
    class func memberSignIn() {
        var id = -1
        var password = ""
        
        while id <= 0 {
            print("Enter your member Id: ", terminator: "")
            let input = readLine() ?? ""
            if let intpuId = Int(input) {
                id = intpuId
            }
        }
        
        while password.isEmpty {
            print("Enter your password: ", terminator: "")
            password = readLine() ?? ""
        }
        
        for member in members {
            if (member.id == id && member.password == password) {
                memberSignedInMenu(member: member)
                return
            }
        }
        
        print("Incorrect member id or password.")
    }
    
    class func memberSignedInMenu(member: Member) {
        var exitMenu = false
        while !exitMenu {
            print("Member Menu")
            print("1: Reload credits")
            print("2: Check credit balance")
            print("3: Search service")
            print("4: Book service")
            print("5: Cancel service")
            print("6: View booked services")
            print("7: Mark attendence")
            print("Type '0' to logout")
            
            let input = readLine() ?? ""
            
            if let option = Int(input) {
                switch option {
                    case 1:
                        member.reloadCreditBalance()
                    case 2:
                        member.checkCreditBalance()
                    case 3:
                        searchServicesByName()
                    case 4:
                        member.bookService()
                    case 5:
                        member.cancelService()
                    case 6:
                        member.viewBookedServices()
                    case 7:
                        member.markAttendence()
                    case 0:
                        exitMenu = true
                    default:
                        break
                }
            }
        }
    }
    
    // prints all services in the inputted list
    class func listServices(services: [Service]) {
        for service in services {
            print("----------")
            print(service.description)
        }
        print()
    }
    
    // prints all stored services
    class func listAllServices() {
        listServices(services: self.services)
    }
    
    // process for adding a new service
    class func addService() {
        var service: Service? = nil
        
        var serviceName = ""
        var numberOfSessions = -1
        var price = -1
        
        while serviceName.isEmpty {
            print("Type in the name of the service: ", terminator: "")
            serviceName = readLine() ?? ""
        }
        
        while numberOfSessions <= 0 {
            print("Type number of sessions. Do not enter 0: ", terminator: "")
            let input = readLine() ?? ""
            numberOfSessions = Int(input) ?? 0
        }
        
        while price <= 0 {
            print("Type the price of the service in credits. Do not enter 0: ", terminator: "")
            let input = readLine() ?? ""
            price = Int(input) ?? 0
        }
        
        var selectedServiceType = false
        
        while !selectedServiceType {
            print("Type in '1' if you want a Fitness Class and type in '2' if you want a Personal Training class: ", terminator: "")
            
            let input = readLine() ?? ""
            
            if let option = Int(input) {
                switch option {
                    case 1:
                        var duration = -1
                        while duration <= 0 {
                            print("Type the duration of a class in hours. Do not enter 0: ", terminator: "")
                            let input = readLine() ?? ""
                            duration = Int(input) ?? 0
                        }
                    
                        var trainerName = ""
                        while trainerName.isEmpty {
                            print("Type in the name of the trainer: ", terminator: "")
                            trainerName = readLine() ?? ""
                        }
                    
                        service = FitnessClass(id: nextServiceId, serviceName: serviceName, numberOfSessions: numberOfSessions, price: price, duration: duration, trainerName: trainerName)
                        selectedServiceType = true
                    case 2:
                        var sessionTime = -1
                        while sessionTime <= 0 {
                            print("Type the length of a session in hours. Do not enter 0: ", terminator: "")
                            let input = readLine() ?? ""
                            sessionTime = Int(input) ?? 0
                        }

                        service = PersonalTraining(id: nextServiceId, serviceName: serviceName, numberOfSessions: numberOfSessions, price: price, sessionTime: sessionTime)
                        selectedServiceType = true
                    default:
                        break
                }
            }
            
            if (!selectedServiceType) {
                print("You didnt type in the words correctly. Now we both look foolish")
            }
        }
        
        self.services.append(service!)
        nextServiceId += 1
    }
    
    /**
     A method to search for services by keyword.
     */
    class func searchServicesByName() {
        print("Type in a keyword to search: ", terminator: "")
        let keyword = readLine() ?? ""
        
        var matchedServices: [Service] = []
        for service in services {
            if (service.serviceName.lowercased().contains(keyword.lowercased())) {
                matchedServices.append(service)
            }
        }
        
        if (matchedServices.isEmpty) {
            print("No services are found.")
        } else {
            listServices(services: matchedServices)
        }
    }
    
    /**
     A method to search for services by id.
      will return the service object if found. Else will return null
     */
    class func getServiceById(id: Int) -> Service? {
        for service in services {
            if (service.id == id) {
                return service
            }
        }
        return nil
    }
}
