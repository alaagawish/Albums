//
//  Address.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import Foundation

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}


