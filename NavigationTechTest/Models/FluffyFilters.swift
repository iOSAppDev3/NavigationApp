// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fluffyFilters = try? newJSONDecoder().decode(FluffyFilters.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.fluffyFiltersTask(with: url) { fluffyFilters, response, error in
//     if let fluffyFilters = fluffyFilters {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFluffyFilters { response in
//     if let fluffyFilters = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - FluffyFilters
class FluffyFilters: Codable {
    var isonsale: String?

    init(isonsale: String?) {
        self.isonsale = isonsale
    }
}
