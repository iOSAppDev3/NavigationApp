//  NavigationTechTest
//
//  Created by Bakkiya Lakshmi on 18/10/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

// MARK: - PurpleFilters
struct PurpleFilters: Codable {
    var facetNew, sort, isonsale, teSortOrder: String?

    enum CodingKeys: String, CodingKey {
        case facetNew
        case sort, isonsale
        case teSortOrder
    }
}
