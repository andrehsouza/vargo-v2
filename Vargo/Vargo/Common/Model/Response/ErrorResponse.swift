//
//  ResponseType.swift
//  DataMovie
//
//  Created by Andre on 25/08/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation
import Alamofire

enum ErrorResponse: Int {
    
    case genericError           = -1
    case invalidData            = -2
    case decodeError            = -3
    case badConnection          = 0
    case badRequest             = 400
    case unauthorized           = 401
    case forbidden              = 403
    case notFound               = 404
    case serverError            = 500
    case timeout                = -1001
    case alamofireConnection    = -1009
    
    
}

extension ErrorResponse {
    
    var title: String {
        return "Attention"
    }
    
    var message: String {
        switch self {
        case .badConnection: fallthrough
        case .timeout: fallthrough
        case .alamofireConnection: return "Please, check your internet connection."
        case .invalidData:
            return "Invalid data."
        case .decodeError:
            return "Decode error."
        case .unauthorized:
            return "You don't have permission to access."
        case .serverError:
            return "A Server error has occurred, please try again later."
        default:
            return "An unexpected error has occurred, please try again."
        }
    }
    
    var hideButton: Bool {
        switch self {
        case .unauthorized: return true
        default: return false
        }
    }
    
    var buttonText: String {
        return "Try Again"
    }
    
}

// MARK: - Custom initializer

extension ErrorResponse {
    
    init(response: DataResponse<Any>) {
        if let statusCode = response.response?.statusCode {
            self = ErrorResponse(rawValue: statusCode) ?? .genericError
        } else if let error = response.error {
            let code = (error as NSError).code
            self = ErrorResponse(rawValue: code) ?? .genericError
        } else {
            self = .genericError
        }
    }
}
