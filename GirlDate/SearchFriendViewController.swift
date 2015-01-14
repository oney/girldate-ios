//
//  SearchFriendViewController.swift
//  GirlDate
//
//  Created by YANG WAN-HUANG on 2015/1/15.
//  Copyright (c) 2015年 ithink. All rights reserved.
//

import UIKit

class SearchFriendViewController: UIViewController {

    
    @IBOutlet weak var countryTable: UITableView!
    var countryArray = ["Australia", "Singapore", "Malaysia", "United States", "Germany", "United Kingdom", "Kenya"]
    var searchArray = [String]()
    var countrySearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countrySearchController = ({

            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            self.countryTable.tableHeaderView = controller.searchBar
            
            return controller
        })()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.countryTable.reloadData()
    }
}

extension SearchFriendViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.countrySearchController.active)
        {
            return self.searchArray.count
        } else
        {
            return self.countryArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = self.countryTable.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        if (self.countrySearchController.active)
        {
            cell.textLabel?.text! = self.searchArray[indexPath.row]
            return cell
        }
            
        else
        {
            cell.textLabel?.text! = self.countryArray[indexPath.row]
            return cell
        }
    }
}

extension SearchFriendViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

extension SearchFriendViewController: UISearchResultsUpdating
{
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        self.searchArray.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text)
        let array = (self.countryArray as NSArray).filteredArrayUsingPredicate(searchPredicate!)
        self.searchArray = array as [String]
        
        self.countryTable.reloadData()
    }
}