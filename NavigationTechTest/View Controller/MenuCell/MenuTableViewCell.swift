//
//  MenuTableViewCell.swift
//  NavigationTechTest
//
//  Created by Bakkiya Lakshmi on 18/08/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var rowHeight: NSLayoutConstraint!
    @IBOutlet weak var subMenuTitleLabel: UILabel!
    @IBOutlet weak var submenuTableView: UITableView!
    @IBOutlet weak var sideButton: UIButton!
    @IBOutlet weak var subMenuRowHeight: NSLayoutConstraint!
    // MARK:- Initializations
    var subNavigationName : [String] = ["Footwear", "Clothing", "Brands"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure() {
        self.rowHeight.constant = 44
        self.submenuTableView.dataSource = self
        self.submenuTableView.delegate = self
        let nibName = UINib(nibName: "SubMenuTableViewCell", bundle: nil)
        self.submenuTableView?.register(nibName, forCellReuseIdentifier: "SubMenuTableViewCell")
    }
    
    @IBAction func sideButtonAction(_ sender: UIButton) {
        if !self.sideButton.isSelected {
            self.rowHeight.constant = 200
            self.subMenuRowHeight.constant = CGFloat(self.subNavigationName.count * 20)
            self.sideButton.isSelected = true
        } else {
            self.rowHeight.constant = 44
            self.subMenuRowHeight.constant = 0
            self.sideButton.isSelected = false
        }
        self.submenuTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.subNavigationName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.subMenuRowHeight.constant
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubMenuTableViewCell", for: indexPath) as! SubMenuTableViewCell
        cell.textLabel?.text = self.subNavigationName[indexPath.row]
        return cell
    }
    
}
