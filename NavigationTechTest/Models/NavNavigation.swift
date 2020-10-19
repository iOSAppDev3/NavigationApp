// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let navNavigation = try? newJSONDecoder().decode(NavNavigation.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.navNavigationTask(with: url) { navNavigation, response, error in
//     if let navNavigation = navNavigation {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseNavNavigation { response in
//     if let navNavigation = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - NavNavigation
class NavNavigation: Codable {
    var uri: String?
    var type: TypeEnum
    var target: String
    var depth, data: JSONNull?
    var filters: FluffyFilters
    var urlStructure: URLStructure?
    var seoSlug: String?

    enum CodingKeys: String, CodingKey {
        case uri = "URI"
        case type, target, depth, data, filters, urlStructure
        case seoSlug = "SEOSlug"
    }

    init(uri: String?, type: TypeEnum, target: String, depth: JSONNull?, data: JSONNull?, filters: FluffyFilters, urlStructure: URLStructure?, seoSlug: String?) {
        self.uri = uri
        self.type = type
        self.target = target
        self.depth = depth
        self.data = data
        self.filters = filters
        self.urlStructure = urlStructure
        self.seoSlug = seoSlug
    }
}
