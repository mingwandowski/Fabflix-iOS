//
//  SingleMovieModel.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/31/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import Foundation
import Alamofire

protocol SingleMovieDelegate {
    func updateSingleMovieData(withData data: SingleMovieData)
}

class SingleMovieModel {
    
    let url = baseUrl + "api/single-movie"
    
    var delegate: SingleMovieDelegate?
    
    func searchSingleMovie(withMovieId id: String) {
        
        let params = "?id=\(id)"
        
        AF.request(url + params).response { (response) in
            guard let responseData = response.data else { return }
            // handle the windowsCP1250 Encoding
            let responseString = String(data: responseData, encoding: .windowsCP1250)
            guard let modifiedDataInUTF8Format = responseString?.data(using: String.Encoding.utf8) else {
                 print("could not convert data to UTF-8 format")
                 return
            }
            do {
                // decode data to SingleMovieData type
                let singleMovieData = try JSONDecoder().decode(SingleMovieData.self, from: modifiedDataInUTF8Format)
                print("get singleMovieData successful")
                self.delegate?.updateSingleMovieData(withData: singleMovieData)
            } catch {
                print(error)
            }
        }
    }
}
