//
//  main.swift
//  gbc_mads_4002_project
//
//  Created by user on 2025-09-13.
//

import Foundation

var exitMenu = false
while !exitMenu {
    print("Select user")
    print("1: Gym Owner")
    print("2: Member")
    print("Type '0' to exit")
    
    let input = readLine() ?? ""
    
    if let option = Int(input) {
        switch option {
            case 1:
                gymOwnerMenu()
            case 2:
                memberMenu()
            case 0:
                exitMenu = true
            default:
                break
        }
    }
}

func gymOwnerMenu() {
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
                    Gym.addService()
                case 2:
                    Gym.searchServicesByName()
                case 3:
                    Gym.listAllServices()
                case 0:
                    exitMenu = true
                default:
                    break
            }
        }
    }
}

func memberMenu() {
    
}
