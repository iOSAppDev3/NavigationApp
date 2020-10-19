// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nav = try? newJSONDecoder().decode(Nav.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.navTask(with: url) { nav, response, error in
//     if let nav = nav {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseNav { response in
//     if let nav = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Nav
class Nav: Codable {
    var name, navigationName: String
    var icon: JSONNull?
    var navigation: NavNavigation
    var styles: [String]
    var children: [NavChild]?

    init(name: String, navigationName: String, icon: JSONNull?, navigation: NavNavigation, styles: [String], children: [NavChild]?) {
        self.name = name
        self.navigationName = navigationName
        self.icon = icon
        self.navigation = navigation
        self.styles = styles
        self.children = children
    }
}
