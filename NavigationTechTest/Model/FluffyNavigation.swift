//  NavigationTechTest
//
//  Created by Bakkiya Lakshmi on 18/10/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

// MARK: - FluffyNavigation
struct FluffyNavigation: Codable {
    var uri: String?
    var type: TypeEnum?
    var target: String?
    var depth, data: String?
    var filters: PurpleFilters?
    var urlStructure: URLStructure?
    var seoSlug: String?

    enum CodingKeys: String, CodingKey {
        case uri
        case type, target, depth, data, filters, urlStructure
        case seoSlug
    }
}
