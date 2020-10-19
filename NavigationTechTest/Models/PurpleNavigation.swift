// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purpleNavigation = try? newJSONDecoder().decode(PurpleNavigation.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.purpleNavigationTask(with: url) { purpleNavigation, response, error in
//     if let purpleNavigation = purpleNavigation {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePurpleNavigation { response in
//     if let purpleNavigation = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - PurpleNavigation
class PurpleNavigation: Codable {
    var uri: String
    var type: TypeEnum
    var target: String
    var depth, data: JSONNull?

    enum CodingKeys: String, CodingKey {
        case uri = "URI"
        case type, target, depth, data
    }

    init(uri: String, type: TypeEnum, target: String, depth: JSONNull?, data: JSONNull?) {
        self.uri = uri
        self.type = type
        self.target = target
        self.depth = depth
        self.data = data
    }
}
