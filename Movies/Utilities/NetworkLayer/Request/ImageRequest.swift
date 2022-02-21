//
//  ImageRequest.swift
//  Movies
//
//  Created by Rosendo Vázquez on 20/02/22.
//

import UIKit

struct ImageRequest: DataRequest {
    
    let url: String
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw NSError(
                domain: ErrorResponseModel.invalidResponse.rawValue,
                code: 13,
                userInfo: nil
            )
        }
        
        return image
    }
}
