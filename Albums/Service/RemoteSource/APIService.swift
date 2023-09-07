//
//  APIService.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import Foundation
import Moya

enum APIService {
    case getUsers
    case getUser(id: Int)
    case getAlbum(userId: Int)
    case getPhotos(albumId: Int)
}

extension APIService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return Constants.users
        case .getUser(let id):
            return Constants.users + "/\(id)"
        case .getAlbum(_):
            return Constants.albums
        case .getPhotos(_):
            return Constants.photos
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getUsers, .getUser:
            return .requestPlain
            
        case .getAlbum(let userId):
            let parameters: [String: Any] = [Constants.userId: userId]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        case .getPhotos(let albumId):
            let parameters: [String: Any] = [Constants.albumId: albumId]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
        
        
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}
