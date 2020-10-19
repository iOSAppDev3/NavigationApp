// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let uRLStructure = try? newJSONDecoder().decode(URLStructure.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.uRLStructureTask(with: url) { uRLStructure, response, error in
//     if let uRLStructure = uRLStructure {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseURLStructure { response in
//     if let uRLStructure = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - URLStructure
class URLStructure: Codable {
    var title: JSONNull?
    var isFeatured, isCampaign: Bool

    init(title: JSONNull?, isFeatured: Bool, isCampaign: Bool) {
        self.title = title
        self.isFeatured = isFeatured
        self.isCampaign = isCampaign
    }
}
