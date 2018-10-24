//
//  APIService.swift
//  Vargo
//
//  Created by Andre on 22/10/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

final class APIService: NSObject {
    
    private var alamoFireManager: Alamofire.SessionManager
    private var url: String
    
    init(with url: String) {
        
        //Alamofire config
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        alamoFireManager = Alamofire.SessionManager(configuration: config)
        
        self.url = url
        
        super.init()
    }
    
}

// MARK: - Get Data

extension APIService {
    
    func getData<T: Decodable>(_ completion: @escaping (RequestResultType<T>) -> Void) {
        
        printRequest(url: url, method: "GET")
        
        alamoFireManager.request(url, method: .get, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON { response in
            self.printResponse(response: response)
            switch response.result {
            case .success:
                
                guard let data = response.data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(.decodeError))
                }
                
            case .failure:
                completion(.failure(ErrorResponse(response: response)))
            }
        }
    }
    
}

// MARK: - Print function

extension APIService {
    
    private func printRequest(url: String, method: String){
        debugPrint("----------------------- REQUEST ------------------------------")
        debugPrint("")
        debugPrint("\(method): \(url)")
        debugPrint("")
        debugPrint("---------------------------------------------------------------")
    }
    
    private func printResponse(response:DataResponse<Any>){
        debugPrint("----------------------- RESPONSE ------------------------------")
        debugPrint("")
        debugPrint("Request for \(response.response?.url?.absoluteString ?? "-sem url-") completed with status code \(response.response?.statusCode ?? 0)")
        debugPrint("data:")
        if let json = response.result.value as? [String : Any] {
            print(json)
        }
        debugPrint("")
        debugPrint("---------------------------------------------------------------")
    }
    
}
