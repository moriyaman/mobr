//
//  CompanyViewController.swift
//  mobr
//
//  Created by Yuki Moriyama on 2015/02/13.
//  Copyright (c) 2015年 yuki.moriyama. All rights reserved.
//

import Foundation
import UIKit

enum CellGroup: Int {
    case FirstCell
    case ListCell
    
    func name() -> String {
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

class CompanyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var videoPhoto: UIImageView!
    
    var companyId: Int!
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // dinamic height
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if(companyId != 0){
           videoPhoto.image = UIImage(named: "other.png")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellName = ""
        var cellGroup: CellGroup! = CellGroup(rawValue: indexPath.row)
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellGroup.name(), forIndexPath: indexPath) as UITableViewCell
        
        if (companyId != 0) {
            if (cellGroup == .FirstCell) {
                var titleLabel = cell.viewWithTag(1) as UILabel
                titleLabel.text = "ビジネス・コミュニケーションという視点から、日本の競争力を向上させる教育のプロフェッショナル・アイソルート代表との少人数座談会"
            } else {
                var textLabel = cell.viewWithTag(2) as UILabel
                textLabel.text = "私たちアイソルートは、「ビジネスコミュニケーション」という事業領域に焦点を当て、「ソフトウェアエンジニアリング」と「教育サービス」を通じて、ビジネスで生じるコミュニケーションの課題解決に向け、独自性の高いサービスを提供して行こうとする会社です。"
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    @IBAction func playMovie(sender: AnyObject) {
        performSegueWithIdentifier("playMovieView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if(segue.identifier == "playMovieView") {
            var movieViewController: MovieViewController = segue.destinationViewController as MovieViewController
            movieViewController.companyId = self.companyId as Int
        }
    }

}