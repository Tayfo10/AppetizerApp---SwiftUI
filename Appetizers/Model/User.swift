//
//  User.swift
//  Appetizers
//
//  Created by Tayfun Sener on 2.08.2024.
//

import Foundation

struct User: Codable {
    
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
