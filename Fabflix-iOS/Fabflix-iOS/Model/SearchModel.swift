//
//  Search.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/26/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchDelegate {
    func updateListMovieData(withData data: [ListMovieData])
}

class SearchModel {
    
    let url = baseUrl + "api/mobile-search"
    
    var delegate: SearchDelegate?
    
    func search(withTitle title: String) {
        
        let params = "?title=\(title)"
        
        AF.request(url + params).response { (response) in
            guard let responseData = response.data else { return }
            // handle the windowsCP1250 Encoding
            let responseString = String(data: responseData, encoding: .windowsCP1250)
            guard let modifiedDataInUTF8Format = responseString?.data(using: String.Encoding.utf8) else {
                 print("could not convert data to UTF-8 format")
                 return
            }
            do {
                // decode data to ListMovieData type
                let listMovieDataArray = try JSONDecoder().decode([ListMovieData].self, from: modifiedDataInUTF8Format)
                print("get listMovieDataArray successful")
                self.delegate?.updateListMovieData(withData: listMovieDataArray)
            } catch {
                print(error)
            }
        }
    }
}
