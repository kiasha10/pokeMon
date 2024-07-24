//
//  Service Errors.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

enum APIError: String, Error {
    case internalError
    case parsingError
    case serverError
}

enum Method {
    case GET
    case POST
}
