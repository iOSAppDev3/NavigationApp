//
//  ServiceManager.swift
//  NavigationTechTest
//
//  Created by Bakkiya Lakshmi on 18/10/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import Alamofire

class ServiceManager {
    private let base_url =  "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/nav.json"
    
    /// API request to get the json
    func fetchNavigationAPI(completion: @escaping (Welcome?, Error?) -> ()) {
        AF.request(base_url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers : nil).validate(statusCode: 200..<300).responseJSON { response in
         switch response.result {
         case .success(_):
              do {
                print(response)
                let resp = try JSONDecoder().decode(Welcome.self, from: response.data!)
                completion(resp, nil)
              } catch{
                 print("Error")
              }
             break

         case .failure(let error):
             print(error)
             completion(nil, error)
             break
           }
        }
    }
}
