//
//  Network.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import Foundation
import Alamofire
import Moya

class Network: NetworkProtocol {
    var provider = Moya.MoyaProvider<APIService>(plugins: [NetworkLoggerPlugin()])
    
    func getUsers(handler: @escaping ([User]?) -> Void) {
        provider.request(.getUsers) { result in
            switch result {
            case .success(let response):
                do {
                    let users = try JSONDecoder().decode([User].self, from: response.data)
                    handler(users)
                }catch let error {
                    print(error)
                }
            case .failure(let error):
                print("Request users failed with error: \(error)")
            }
        }
    }
    
    func getPhotos(albumId: Int, handler: @escaping ([Photo]?) -> Void) {
        provider.request(.getPhotos(albumId: albumId)) { result in
            switch result {
            case .success(let response):
                do {
                    let photos = try JSONDecoder().decode([Photo].self, from: response.data)
                    handler(photos)
                }catch let error {
                    print(error)
                }
            case .failure(let error):
                print("Request photos failed with error: \(error)")
            }
        }
    }
    
    func getAlbums(userId: Int, handler: @escaping ([Album]?) -> Void) {
        provider.request(.getAlbum(userId: userId)) { result in
            
            switch result {
            case .success(let response):
                do {
                    let albums = try JSONDecoder().decode([Album].self, from: response.data)
                    handler(albums)
                    
                } catch let error {
                    print(error)
                }
                
            case .failure(let error):
                print("Request albums failed with error: \(error)")
            }
        }
    }
    
    func getUser(id: Int, handler: @escaping (User?) -> Void) {
        provider.request(.getUser(id: id)) { result in
            switch result {
            case .success(let response):
                do {
                    let user = try JSONDecoder().decode(User.self, from: response.data)
                    handler(user)
                }catch let error {
                    print(error)
                }
            case .failure(let error):
                print("Request user failed with error: \(error)")
            }
        }
    }
    
    
}
