//
//  PlaylistDetailViewController.swift
//  MusicBox
//
//  Created by Mário Silva on 23/01/15.
//  Copyright (c) 2015 Mário Silva. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var segueLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = segueLabel
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
