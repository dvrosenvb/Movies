//
//  ErrorResponse.swift
//  Movies
//
//  Created by Rosendo Vázquez on 20/02/22.
//

import Foundation

enum ErrorResponseModel: String {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .apiError: return "[API] - Something it's worng"
        case .invalidEndpoint: return "[Endpoint] - Unknow"
        case .invalidResponse: return "[Response] - It's not a valid response"
        case .noData: return "[Data] - Nil"
        case .serializationError: return "[SERLZN] - Something is wrong"
        }
    }
}
