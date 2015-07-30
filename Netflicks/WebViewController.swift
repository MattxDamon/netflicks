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
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var url: NSURL!
    
    //so it is able to play as soon as video loads
    func playerReady(videoPlayer: YouTubePlayerView) {
        playerView.play()
        playButton.setTitle("Pause", forState: .Normal)
        
        //Ending:
        self.activityIndicator.stopAnimating()
//        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,100,100))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        view.addSubview(activityIndicator)
        
        //show video is loading
        activityIndicator.startAnimating()
//        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        //setting up the video
        playerView.playerVars = ["playsinline": "1"]
        playerView.loadVideoURL(url!)
    }
    

    @IBAction func playButtonPressed(sender: AnyObject) {
        if playerView.ready {
            if playerView.playerState != YouTubePlayerState.Playing {
                playerView.play()
                playButton.setTitle("Pause", forState: .Normal)
            } else {
                playerView.pause()
                playButton.setTitle("Play", forState: .Normal)
            }
        }
    }
    
    //noted by the author that these methods should be optional in the delegate
    func playerStateChanged(videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
    }
    func playerQualityChanged(videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
    }
}
