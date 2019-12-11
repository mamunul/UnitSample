//
//  LocationLoader.swift
//  UnitSample
//
//  Created by New User on 11/12/19.
//  Copyright © 2019 New User. All rights reserved.
//

import Foundation
import CoreLocation

protocol APIRequest{
    associatedtype RequestDataType
    associatedtype ResponseDataType
    
    func makeRequest(from data:RequestDataType) -> URLRequest
    func parseResponse(data:Data) throws -> ResponseDataType
}

class APIRequestLoader<T:APIRequest>{
    let apiRequest:T
    let urlSession:URLSession
    
    init(apiRequest:T,urlSession:URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadAPIRequest(requestData:T.RequestDataType,
                        completionHandler:@escaping (T.ResponseDataType?,Error?)->Void){
        let urlRequest = apiRequest.makeRequest(from: requestData)

        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {completionHandler(nil,error);return}
            do{
                let response = try self.apiRequest.parseResponse(data: data)
                
                completionHandler(response,nil)
    
            }catch{
                completionHandler(nil,error)
            }
        }.resume()
    }
}


class PointOfInterestRequest:APIRequest{
    func makeRequest(from coordinate:CLLocationCoordinate2D) -> URLRequest{
        var components = URLComponents(string: "https://example.com/locations")!
        components.queryItems = [
            URLQueryItem(name: "lat", value:"\(coordinate.latitude)"),
            URLQueryItem(name: "long", value: "\(coordinate.longitude)")
        ]
        
        return URLRequest(url: components.url!)
    }
    
    func parseResponse(data:Data) throws -> [PointOfInterest]{
        return try JSONDecoder().decode([PointOfInterest].self, from: data)
    }
}
