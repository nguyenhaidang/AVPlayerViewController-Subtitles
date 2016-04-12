//
//  ViewController.swift
//  AVPlayerViewController-Subtitles
//
//  Created by mhergon on 23/12/15.
//  Copyright © 2015 mhergon. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Actions
    @IBAction func showVideo(sender: UIButton) {
        
        // Video file
        let videoFile = NSBundle.mainBundle().pathForResource("trailer_720p", ofType: "mov")
        
        // Subtitle file
        let subtitleFile = NSBundle.mainBundle().pathForResource("trailer_720p", ofType: "srt")
        let subtitleURL = NSURL(fileURLWithPath: subtitleFile!)
        
        // Movie player
        let moviePlayer = AVPlayerViewController()
        moviePlayer.player = AVPlayer(URL: NSURL(fileURLWithPath: videoFile!))
        presentViewController(moviePlayer, animated: true, completion: nil)
        
        // Add subtitles
        moviePlayer.addSubtitles(NSURL(fileURLWithPath: videoFile!)).open(file: subtitleURL)
        moviePlayer.addSubtitles(NSURL(fileURLWithPath: videoFile!)).open(file: subtitleURL, encoding: NSUTF8StringEncoding)
        
        // Play
        moviePlayer.player?.play()
        
    }

}

