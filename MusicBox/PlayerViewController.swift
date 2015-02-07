//
//  AVPlayerViewController.swift
//  MusicBox
//
//  Created by Mário Silva on 06/02/15.
//  Copyright (c) 2015 Mário Silva. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class PlayerViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var pauseButton: UIImageView!
    @IBOutlet weak var playButton: UIImageView!
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackCurrentTime: UILabel!
    @IBOutlet weak var trackDuration: UILabel!
    
    var file: String?
    var cover: UIImage?
    var artist: String?
    
    var audioPlayer = AVAudioPlayer()
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidePlayButton()
        verifyFile()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        audioPlayer.pause()
    }

    func verifyFile() -> Void {
        let audioPath = NSString(string: NSBundle.mainBundle().pathForResource(file, ofType: "wav")!)
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        if error == nil {
            setArtist()
            setPlayer()
            setDurationLabel()
        } else {
            errorMessage()
        }
    }
    
    func setPlayer() -> Void {
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        play()
    }

    func errorMessage() -> Void {
        let title = "Error loading file"
        let message = "File not found?"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.backToPreviousViewController()
        })
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func backToPreviousViewController() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func play() -> Void {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("timerDidFire:"), userInfo: nil, repeats: true)
        audioPlayer.play()
    }
    
    func pause() -> Void {
        audioPlayer.pause()
        timer?.invalidate()
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) -> Void {
        timer?.invalidate()
        progressView.setProgress(0, animated: false)
        setCurrentTimeLabel()
        hidePauseButton()
    }
    
    func timerDidFire(timer: NSTimer) -> Void {
        updateProgressView(timer.timeInterval)
    }
    
    func timeFormatter(seconds: NSTimeInterval) -> String {
        let date = NSDate(timeIntervalSinceReferenceDate: seconds)
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "mm:ss"
        return timeFormatter.stringFromDate(date)
    }
    
    func setArtist() -> Void {
        artistLabel.text = artist
    }
    
    func setDurationLabel() -> Void {
        trackDuration.text = timeFormatter(audioPlayer.duration)
    }
    
    func setCurrentTimeLabel() -> Void {
        trackCurrentTime.text = timeFormatter(Double(progressView.progress) * audioPlayer.duration)
    }
    
    func updateProgressView(timeInterval: NSTimeInterval) -> Void {
        let progressValue: Float = progressView.progress + Float(timeInterval / audioPlayer.duration)
        progressView.setProgress(progressValue, animated: true)
        setCurrentTimeLabel()
    }
    
    func hidePlayButton() -> Void {
        playButton.hidden = true
        pauseButton.hidden = false
    }
    
    func hidePauseButton() -> Void {
        pauseButton.hidden = true
        playButton.hidden = false

    }
    
    @IBAction func pauseTapped(sender: UITapGestureRecognizer) {
        pause()
        hidePauseButton()
    }

    @IBAction func didPlayTapped(sender: UITapGestureRecognizer) {
        play()
        hidePlayButton()
    }
}
