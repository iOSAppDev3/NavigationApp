// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purpleFilters = try? newJSONDecoder().decode(PurpleFilters.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.purpleFiltersTask(with: url) { purpleFilters, response, error in
//     if let purpleFilters = purpleFilters {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePurpleFilters { response in
//     if let purpleFilters = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - PurpleFilters
class PurpleFilters: Codable {
    var facetNew, sort, isonsale, teSortOrder: String?

    enum CodingKeys: String, CodingKey {
        case facetNew = "facet:new"
        case sort, isonsale
        case teSortOrder = "te_sort_order"
    }

    init(facetNew: String?, sort: String?, isonsale: String?, teSortOrder: String?) {
        self.facetNew = facetNew
        self.sort = sort
        self.isonsale = isonsale
        self.teSortOrder = teSortOrder
    }
}
