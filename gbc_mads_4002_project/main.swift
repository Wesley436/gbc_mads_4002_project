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
                Gym.gymOwnerMenu()
            case 2:
                Gym.memberSignInMenu()
            case 0:
                exitMenu = true
            default:
                break
        }
    }
}
