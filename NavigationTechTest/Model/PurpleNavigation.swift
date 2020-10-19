//  NavigationTechTest
//
//  Created by Bakkiya Lakshmi on 18/10/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

// MARK: - PurpleNavigation
struct PurpleNavigation: Codable {
    var uri: String?
    var type: TypeEnum?
    var target: String?
    var depth, data: String?

    enum CodingKeys: String, CodingKey {
        case uri
        case type, target, depth, data
    }
}
