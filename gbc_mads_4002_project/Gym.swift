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
        Service(id: 1000, name: "Test 1", numberOfSessions: 3, price: 10),
        Service(id: 1001, name: "Test 2", numberOfSessions: 3, price: 10),
        Service(id: 1002, name: "Test 3", numberOfSessions: 3, price: 10)
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
            var input = readLine() ?? ""
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
            print("4: Purchase service")
            print("5: Cancel service")
            print("6: Book service")
            print("7: View booked services")
            print("8: Mark attendence")
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
                        member.purchaseService()
                    case 5:
                        member.cancelService()
                    case 6:
                        member.bookService()
                    case 7:
                        member.viewBookedServices()
                    case 8:
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
    
    class func addService() {
        var service: Service? = nil
        
        var name = ""
        var numberOfSessions = 3
        var price = 1
        
        // TODO prompt user to input and select type of service
        // dummy values
        /* <-- Jared commented this out
        service = FitnessClass(id: id, name: name, numberOfSessions: numberOfSessions, price: price, duration: 1.0, trainerName: "")
        service = PersonalTraining(id: id, name: name, numberOfSessions: numberOfSessions, price: price, sessionTime: 1.0)
        */
        print("type number of sessions. Do not enter 0: ", terminator:"")
        let numberOfSessionsInput = readLine() ?? ""
        numberOfSessions = Int(numberOfSessionsInput) ?? 0
        //if(numberOfSessions == 0) { print("you didnt type in a positive full number. Now we both look foolish") }
        
        print("type in your name: ", terminator:"")
        let nameInput = readLine() ?? ""
        name = nameInput
        
        print("type in 'Fitness' if you want a Fitness Class and type in 'PersonalTraining' if you want a Personal Training class: ", terminator:"")
        let serviceTypeString = readLine() ?? ""
        if(serviceTypeString == "Fitness"){
            // dummy value
            service = FitnessClass(id: nextServiceId, name: name, numberOfSessions: numberOfSessions, price: price, duration: 1.0, trainerName: "")
        } else if(serviceTypeString == "PersonalTraining"){
            // dummy value
            service = PersonalTraining(id: nextServiceId, name: name, numberOfSessions: numberOfSessions, price: price, sessionTime: 1.0)
        } else {
            print("you didnt type in the words correctly. Now we both look foolish")
            //probably need to put all this in a while loop to prevent errors
        }
        // Jared wrote from here till just above line 36
        
        
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
            if (service.name.lowercased().contains(keyword.lowercased())) {
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
