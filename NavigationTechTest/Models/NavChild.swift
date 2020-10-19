// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let navChild = try? newJSONDecoder().decode(NavChild.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.navChildTask(with: url) { navChild, response, error in
//     if let navChild = navChild {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseNavChild { response in
//     if let navChild = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - NavChild
class NavChild: Codable {
    var name, navigationName: String
    var icon: JSONNull?
    var navigation: FluffyNavigation
    var styles: [String]
    var children: [ChildChild]?

    init(name: String, navigationName: String, icon: JSONNull?, navigation: FluffyNavigation, styles: [String], children: [ChildChild]?) {
        self.name = name
        self.navigationName = navigationName
        self.icon = icon
        self.navigation = navigation
        self.styles = styles
        self.children = children
    }
}
