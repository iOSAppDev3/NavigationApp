// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let childChild = try? newJSONDecoder().decode(ChildChild.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.childChildTask(with: url) { childChild, response, error in
//     if let childChild = childChild {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseChildChild { response in
//     if let childChild = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - ChildChild
class ChildChild: Codable {
    var name, navigationName: String
    var navigation: PurpleNavigation
    var styles: [JSONAny]

    init(name: String, navigationName: String, navigation: PurpleNavigation, styles: [JSONAny]) {
        self.name = name
        self.navigationName = navigationName
        self.navigation = navigation
        self.styles = styles
    }
}
