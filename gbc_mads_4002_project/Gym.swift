//
//  Gym.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-15.
//

import Foundation

class Gym {
    static var nextId = 1
    static var services: [Service] = []
    static var members: [Member] = []
    
    class func listAllServices() {
        for service in services {
            print("----------")
            print(service.description)
        }
    }
    
    class func addService() {
        var service: Service? = nil
        
        var id = nextId
        var name = ""
        var numberOfSessions = 3
        var price = 1
        
        // TODO prompt user to input and select type of service
        // dummy values
        /* <-- Jared commented this out
        service = FitnessClass(id: id, name: name, numberOfSessions: numberOfSessions, price: price, duration: 1.0, trainerName: "")
        service = PersonalTraining(id: id, name: name, numberOfSessions: numberOfSessions, price: price, sessionTime: 1.0)
        */
        print("type number of sessions. Do not enter 0:", terminator:"")
        let numberOfSessionsInput = readLine() ?? ""
        numberOfSessions = Int(numberOfSessionsInput) ?? 0
        //if(numberOfSessions == 0) { print("you didnt type in a positive full number. Now we both look foolish") }
        
        print("type in your name:", terminator:"")
        let nameInput = readLine() ?? ""
        name = nameInput
        
        print("type in 'Fitness' if you want a Fitness Class and type in 'PersonalTraining' if you want a Personal Training class: ", terminator:"")
        let serviceTypeString = readLine() ?? ""
        if(serviceTypeString == "Fitness"){
            // dummy value
            service = FitnessClass(id: id, name: name, numberOfSessions: numberOfSessions, price: price, duration: 1.0, trainerName: "")
        } else if(serviceTypeString == "PersonalTraining"){
            // dummy value
            service = PersonalTraining(id: id, name: name, numberOfSessions: numberOfSessions, price: price, sessionTime: 1.0)
        } else {
            print("you didnt type in the words correctly. Now we both look foolish")
            //probably need to put all this in a while loop to prevent errors
        }
        // Jared wrote from here till just above line 36
        
        
        self.services.append(service!)
        nextId += 1
    }
    
    /**
     A method to search for services by keyword.
     */
    class func searchServicesByName(name: String) -> [Service] {
        var matchedServices: [Service] = []
        for service in services {
            if (service.name.lowercased().contains(name.lowercased())) {
                matchedServices.append(service)
            }
        }
        return matchedServices
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
