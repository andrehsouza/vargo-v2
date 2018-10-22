//
//  RequestResultType.swift
//  Vargo
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import Foundation

enum RequestResultType<T> {
    case success(T)
    case failure(ErrorResponse)
}
