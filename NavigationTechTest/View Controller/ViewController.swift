//
//  ViewController.swift
//  NavigationTechTest
//
//  Created by Bakkiya Lakshmi on 18/10/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {

    var navArray : [Nav]!
    var dataNavArray : [NavGeneric] = []
    var indendationLevel:Int   = 0
    var indendationWidth:CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getNavigationAPI()
    }
    
    func configure() {
        // Setting Expanded array values
        for nav in navArray {
            let dataObj = NavGeneric()
            dataObj.isExpanded = false
            dataObj.name = nav.name
            if nav.children?.count ?? 0 > 0 {
                dataObj.canBeExpanded = true
            } else {
                dataObj.canBeExpanded = false
            }
            dataObj.level = 0
            dataObj.type = 0
            self.dataNavArray.append(dataObj)
        }
    }
    
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataNavArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = .white
        if self.dataNavArray.count > 0 {
            let navObj : NavGeneric =  dataNavArray[indexPath.row]
            cell.textLabel?.text = navObj.name
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            cell.textLabel?.textColor = .lightGray
            cell.indentationWidth = indendationWidth
            cell.indentationLevel = navObj.level ?? 0
            // Show disclosure only if the cell can expand
            if navObj.canBeExpanded {
                cell.accessoryView = self.viewForDisclosureForState(navObj.isExpanded)
            } else {
                cell.accessoryView = nil
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        let navObj = dataNavArray[indexPath.row]
        let selectedCell = tableView.cellForRow(at: indexPath)
        if navObj.canBeExpanded {
            if navObj.isExpanded {
                self.collapseCellsFromIndexOf(navObj, indexPath: indexPath, tableView: tableView)
                selectedCell?.textLabel?.textColor = .lightGray
                selectedCell?.accessoryView = self.viewForDisclosureForState(false)
            } else {
                self.expandCellsFromIndexOf(navObj, indexPath: indexPath, tableView: tableView)
                selectedCell?.textLabel?.textColor = .white
                selectedCell?.accessoryView = self.viewForDisclosureForState(true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }
}


extension ViewController {
    
    /// Function to show the arrow image on the right side
    func viewForDisclosureForState(_ isExpanded:Bool) -> UIView {
        var imageName:String = ""
        if(isExpanded)
        {
            imageName = "down_arrow"
        }
        else
        {
            imageName = "right_arrow"
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.frame = CGRect(x: 0, y: 6, width: 24, height: 24)
        view.addSubview(imageView)
        return view
    }
    
    /// Function to get the child values
    func fetchChildrenforParent(_ parentProduct:NavGeneric) {
           // If canBeExpanded then only we need to create child
           if(parentProduct.canBeExpanded)
           {
               // If Children are already added then no need to add again
               if(parentProduct.children.count > 0){
               return
               }
               // The children property of the parent will be filled with this objects
               // If the parent is of type region, then fetch the location.
                var childArray : [NavChild] = []
               if (parentProduct.type == 0) {
                    for nav in navArray{
                        if nav.name == parentProduct.name {
                            childArray.append(contentsOf: nav.children!)
                        }
                    }
                    
                    for child in childArray {
                        let navObj = NavGeneric()
                        navObj.name = child.name
                        navObj.level  = parentProduct.level! + 1;
                        // This is used for setting the indentation level so that it look like an accordion view
                        navObj.type = 1 //OBJECT_TYPE_LOCATION;
                        navObj.isExpanded = false
                        if child.children?.count ?? 0 > 0 {
                            navObj.canBeExpanded = true
                         } else {
                            navObj.canBeExpanded = false
                         }
                         parentProduct.children.append(navObj)
                    }
               } else {
                    var childArray : [ChildChild] = []
                    for nav in navArray {
                        if nav.children?.count ?? 0 > 0 {
                            for submenu in nav.children! {
                                if submenu.name == parentProduct.name {
                                    childArray.append(contentsOf: submenu.children!)
                                }
                            }
                        }
                    }
                    for child in childArray {
                       let navObj = NavGeneric()
                       navObj.name = child.name
                       navObj.level = parentProduct.level! + 1
                       // This is used for setting the indentation level so that it look like an accordion view
                       navObj.type = 1 //OBJECT_TYPE_LOCATION;
                       navObj.isExpanded = false
                       navObj.canBeExpanded = false
                       parentProduct.children.append(navObj)
                   }
               }
           }
       }

    /// Function to remove the required cells
    func collapseCellsFromIndexOf(_ prod:NavGeneric,indexPath:IndexPath, tableView:UITableView)->Void {
        // Find the number of childrens opened under the parent recursively as there can be expanded children also
        let collapseCol = self.numberOfCellsToBeCollapsed(prod)
        // Find the end index by adding the count to start index+1
        let end = indexPath.row + 1 + collapseCol
        // Find the range from the parent index and the length to be removed.
        let collapseRange =  ((indexPath.row+1) ..< end)
        // Remove all the objects in that range from the main array so that number of rows are maintained properly
        dataNavArray.removeSubrange(collapseRange)
        prod.isExpanded = false
        // Create index paths for the number of rows to be removed
        var indexPaths = [IndexPath]()
        for i in 0..<collapseRange.count {
            indexPaths.append(IndexPath.init(row: collapseRange.lowerBound+i, section: 0))
        }
        // Animate and delete
        tableView.deleteRows(at: indexPaths, with: .left)
        
    }
    
    /// Function to expend the required cells
    func expandCellsFromIndexOf(_ nav:NavGeneric, indexPath:IndexPath, tableView:UITableView)->Void{
        
        self.fetchChildrenforParent(nav)

        // Expand only if children are available
        if nav.children.count > 0 {
           nav.isExpanded = true
           var i = 0;
           // Insert all the child to the main array just after the parent
           for data in nav.children {
               dataNavArray.insert(data, at: indexPath.row+i+1)
               i += 1;
           }
           // Find the range for insertion
           let expandedRange = NSMakeRange(indexPath.row, i)
           
           var indexPaths = [IndexPath]()
           // Create index paths for the range
           for i in 0..<expandedRange.length {
               indexPaths.append(IndexPath.init(row: expandedRange.location+i+1, section: 0))
           }
           // Insert the rows
           tableView.insertRows(at: indexPaths, with: .left)
        }
    }
    
    /// Function to get the number of cells to be closed
    func numberOfCellsToBeCollapsed(_ nav: NavGeneric) -> Int {
        var total = 0
        if nav.isExpanded {
            // Set the expanded status to no
            nav.isExpanded = false
            let child = nav.children
            total = child.count
            
            // traverse through all the children of the parent and get the count.
            for prodData in child{
                total += self.numberOfCellsToBeCollapsed(prodData)
            }
        }
        return total
    }
}

extension ViewController {
    
    /// Handling API request all  to get the json using fetchNanvigationAPI method from ServiceManager
    func getNavigationAPI() {
        DispatchQueue.main.async {
            self.showSpinner(onView: self.view)
        }
        ServiceManager().fetchNavigationAPI() {
            (resp, error) in
            if resp != nil {
                self.navArray = resp!.nav
                self.configure()
                self.tableView.reloadData()
            } else {
                print("Error json")
            }
        }
        DispatchQueue.main.async {
            self.removeSpinner()
        }
    }
}
