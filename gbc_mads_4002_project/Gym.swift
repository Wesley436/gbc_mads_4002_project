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
        service = FitnessClass(id: id, name: name, numberOfSessions: numberOfSessions, price: price, duration: 1.0, trainerName: "")
        service = PersonalTraining(id: id, name: name, numberOfSessions: numberOfSessions, price: price, sessionTime: 1.0)
        
        self.services.append(service!)
        nextId += 1
    }
    
    class func searchServicesByName(name: String) -> [Service] {
        var matchedServices: [Service] = []
        for service in services {
            if (service.name.lowercased().contains(name.lowercased())) {
                matchedServices.append(service)
            }
        }
        return matchedServices
    }
    
    class func getServiceById(id: Int) -> Service? {
        for service in services {
            if (service.id == id) {
                return service
            }
        }
        return nil
    }
}
