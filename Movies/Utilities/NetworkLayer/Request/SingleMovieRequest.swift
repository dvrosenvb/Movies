//
//  SingleMovieRequest.swift
//  Movies
//
//  Created by Rosendo Vázquez on 20/02/22.
//

import Foundation

struct SingleMovieRequest: DataRequest {
    
    private let apiKey: String = Constants.API_KEY
    private let baseUrl: String = Constants.URL_BASE
    
    var url: String {
        let baseURL: String = baseUrl
        let path: String = "\(Constants.SINGLE_MOVIE)/\(Constants.ID_MOVIE)?api_key=\(apiKey)"
        let complete = baseURL + path
        return complete
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [:]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Movie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(MoviesResponse.self, from: data)
        return response.results
    }
}
