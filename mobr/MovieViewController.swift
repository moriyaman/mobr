//
//  MovieViewController.swift
//  mobr
//
//  Created by Yuki Moriyama on 2015/02/13.
//  Copyright (c) 2015年 yuki.moriyama. All rights reserved.
//

import UIKit
import MediaPlayer

class MovieViewController: UIViewController {
    
    var moviePlayer:MPMoviePlayerController!
    var companyId: Int?
    var url: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show()
        SVProgressHUD.showWithStatus("Now Loading...")
        
        if (companyId == nil) {
          url = NSURL(string: "https://kid84interactive.herokuapp.com/img/atrae.mp4")!  
        } else if (companyId == 0) {
          url = NSURL(string: "https://kid84interactive.herokuapp.com/img/atrae.mp4")!
        } else {
          url = NSURL(string: "https://kid84.herokuapp.com/images/other_company.mp4")!
        }
        
        self.moviePlayer = MPMoviePlayerController(contentURL: url)
        self.moviePlayer.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(moviePlayer.view)
        
        self.moviePlayer.fullscreen = true
        self.moviePlayer.controlStyle = MPMovieControlStyle.Embedded
        self.moviePlayer.repeatMode = MPMovieRepeatMode.One
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMPMoviePlayerPlaybackDidFinishNotificationReceived:", name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMPMoviePlayerLoadStateDidChangeNotificationReceived:", name: MPMoviePlayerLoadStateDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMPMoviePlayerWillEnterFullscreenNotificationReceived:", name: MPMoviePlayerWillEnterFullscreenNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMPMoviePlayerWillExitFullscreenNotificationReceived:", name: MPMoviePlayerWillExitFullscreenNotification, object: nil)
    }
    
    func onMPMoviePlayerPlaybackDidFinishNotificationReceived(notification: NSNotification){
        let userInfo: NSDictionary = notification.userInfo!
        let reason = userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] as Int
        println("onMPMoviePlayerPlaybackDidFinishNotificationReceived = " + String(reason))
    }
    
    func onMPMoviePlayerLoadStateDidChangeNotificationReceived(notification: NSNotification){
        let state = self.moviePlayer.loadState
        SVProgressHUD.dismiss()
        println("onMPMoviePlayerLoadStateDidChangeNotificationReceived = " + String(state.rawValue))
    }
    
    func onMPMoviePlayerWillEnterFullscreenNotificationReceived(notification: NSNotification){
        println("onMPMoviePlayerWillEnterFullscreenNotificationReceived")
    }
    
    func onMPMoviePlayerWillExitFullscreenNotificationReceived(notification: NSNotification){
        println("onMPMoviePlayerWillExitFullscreenNotificationReceived")
    }
    
}