//
//  Photo.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
