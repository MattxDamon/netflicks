//
//  WebViewController.swift
//  Netflicks
//
//  Created by Matthew Barth on 7/28/15.
//  Copyright (c) 2015 Matthew Barth. All rights reserved.
//

import UIKit
import YouTubePlayer

class WebViewController: UIViewController, YouTubePlayerDelegate {

    @IBOutlet weak var playerView: YouTubePlayerView!
    @IBOutlet weak var playButton: UIButton!
    
    var url: NSURL!
    
    //so it is able to play as soon as video loads
    func playerReady(videoPlayer: YouTubePlayerView) {
//        self.activityIndicator.stopAnimating()
        playerView.play()
        playButton.setTitle("Pause", forState: .Normal)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting up the video
        playerView.playerVars = ["playsinline": "1"]
        playerView.loadVideoURL(url!)
    }
    
    
    //noted by the author that these methods should be optional in the delegate
    func playerStateChanged(videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
//        self.activityIndicator.stopAnimating()
    }
    func playerQualityChanged(videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
    }
}
