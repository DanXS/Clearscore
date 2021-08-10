//
//  API.swift
//  ClearScore
//
//  Created by Dan Shepherd on 10/08/2021.
//

import Foundation
import Alamofire

class API {
    static func getCreditScore(url: URL, completion: @escaping (_ result: CreditScore?, _ error: Error?) -> Void) {
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
                    .responseJSON { response in
                        if let status = response.response?.statusCode {
                            switch(status){
                            case 200:
                                if let json = response.value as? Dictionary<String, Any> {
                                    completion(CreditScore(json: json), nil)
                                }
                                break
                            default:
                                completion(nil, response.error)
                            }
                        }
                }
    }
}
