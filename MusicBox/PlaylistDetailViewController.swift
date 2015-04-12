//
//  PlaylistDetailViewController.swift
//  MusicBox
//
//  Created by Mário Silva on 23/01/15.
//  Copyright (c) 2015 Mário Silva. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var playlistCoverImage: UIImageView!
    @IBOutlet weak var playlistTitle: UILabel!
    @IBOutlet weak var playlistDescription: UILabel!
    @IBOutlet weak var artists: UITableView!

    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if playlist != nil {
            self.assingDataToLabels()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "playTrack" {
            let playerViewController = segue.destinationViewController as! PlayerViewController
            let selectedIndex = artists.indexPathForSelectedRow()
            playerViewController.file = "birds"
            playerViewController.cover = playlist!.icon
            playerViewController.artist = playlist!.artists[selectedIndex!.row]
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist!.artists.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
       
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        
        cell.textLabel?.text = playlist!.artists[indexPath.row]

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("playTrack", sender: nil)
        
    }
    
    private func assingDataToLabels() -> Void {
        playlistCoverImage.image = playlist!.icon
        playlistCoverImage.backgroundColor = playlist!.backgroundColor
        playlistTitle.text = playlist!.title
        playlistDescription.text = playlist!.description
    }
    
    
    
}
