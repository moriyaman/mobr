//
//  HomeViewController.swift
//  mobr
//
//  Created by Yuki Moriyama on 2015/02/13.
//  Copyright (c) 2015年 yuki.moriyama. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum CellGroup: Int {
        case FirstCell
        case ListCell
        
        func name () -> String {
            switch self{
            case .FirstCell:
                return "First Cell"
            case .ListCell:
                return "List Cell"
            default:
                return "List Cell"
            }
        }
    }
    
    @IBOutlet var tableView: UITableView!
    var tapCompanyId: Int!
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        self.tapCompanyId = indexPath.row
        performSegueWithIdentifier("companyDetail", sender: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellName = ""
        var cellGroup: CellGroup! = CellGroup(rawValue: indexPath.row)
        if (indexPath.row == 0) {
            cellName = "First Cell"
        } else {
            cellName = "List Cell"
        }
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellName, forIndexPath: indexPath) as UITableViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if(segue.identifier == "companyDetail") {
            var companyViewController: CompanyViewController = segue.destinationViewController as CompanyViewController
            companyViewController.companyId = self.tapCompanyId as Int
        }
    }

}