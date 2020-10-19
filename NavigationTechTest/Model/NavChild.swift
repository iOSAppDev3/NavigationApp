//  NavigationTechTest
//
//  Created by Bakkiya Lakshmi on 18/10/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

// MARK: - NavChild
struct NavChild: Codable {
    var name, navigationName: String?
    var icon: String?
    var navigation: FluffyNavigation?
    var styles: [String]?
    var children: [ChildChild]?
}

