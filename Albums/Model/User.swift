//
//  User.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
    
}
