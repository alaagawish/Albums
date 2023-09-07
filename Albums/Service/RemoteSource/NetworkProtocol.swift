//
//  NetworkProtocol.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import Foundation
import Moya

protocol NetworkProtocol {
    var provider: MoyaProvider<APIService> { get }
    func getUsers(handler: @escaping ([User]?) -> Void)
    func getPhotos(albumId: Int, handler: @escaping ([Photo]?) -> Void)
    func getAlbums(userId: Int, handler: @escaping ([Album]?) -> Void)
    func getUser(id: Int, handler: @escaping (User?) -> Void)
    
}
