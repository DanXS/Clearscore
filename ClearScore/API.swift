//
//  API.swift
//  ClearScore
//
//  Created by Dan Shepherd on 10/08/2021.
//

import Foundation
import Alamofire

class API {
    static func getCreditScore(url: URL, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
                    .responseJSON { response in
                        if let status = response.response?.statusCode {
                            switch(status){
                            case 200:
                                if let result = response.value {
                                    completion(result, nil)
                                }
                                break
                            default:
                                completion(nil, response.error)
                            }
                        }
                }
    }
}
