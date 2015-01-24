//
//  MusicLibrary.swift
//  MusicBox
//
//  Created by Mário Silva on 23/01/15.
//  Copyright (c) 2015 Mário Silva. All rights reserved.
//

import Foundation

struct MusicLibrary {
    
    let library: [Playlist] = [
        Playlist(title: "Rise and Shine",
            description: "Get your morning going by singing along to these classic tracks as you hit the shower bright and early!",
            icon: "coffee.pdf",
            largeIcon: "coffee_large.pdf",
            artists: ["American Authors", "Vacationer", "Matt and Kim", "MGMT", "Echosmith", "Tokyo Police Club", "La Femme"],
            color: ["red": 255, "green": 204, "blue": 51, "alpha": 1.0]
        ),
        Playlist(title: "Runner's Rampage",
            description: "Hit the track hard and get in beast mode with everything from dance tracks to classic hip hop. All the right fuel to motivate you to push your limits.",
            icon: "running.pdf",
            largeIcon: "running_large.pdf",
            artists: ["Avicii", "Calvin Harris", "Pitbull", "Iggy Azalea", "Rita Ora", "Drake", "Lil Wayne"],
            color: ["red": 255, "green": 102, "blue": 51, "alpha": 1.0]
        ),
        Playlist(title: "Joy Ride",
            description: "Let this eclectic playlist take you wherever your heart desires. Cruise along in style to these energetic beats.",
            icon: "helmet.pdf",
            largeIcon: "helmet_large.pdf",
            artists: ["Afrojack", "Kid Cudi", "Daft Punk", "Icona Pop", "Gesaffelstien", "Roksnoix", "deadmau5"],
            color: ["red": 153, "green": 102, "blue": 204, "alpha": 1.0]
        ),
        Playlist(title: "In The Zone",
            description: "Keep calm and focus. Shut out the noise around you and grind away with some mind sharpening instrumental tunes.",
            icon: "laptop.pdf",
            largeIcon: "laptop_large.pdf",
            artists: ["Dr. Dre", "Snoop Dogg", "Com Truise", "D12", "Flying Lotus", "Kanye West", "Rundfunk"],
            color: ["red": 51, "green": 153, "blue": 204, "alpha": 1.0]
        ),
        Playlist(title: "Button Masher",
            description: "Turn up the speakers and get out of my way! The ultimate gaming playlist to get you hyped up and ready for the crazy fun that’s about to happen.",
            icon: "joystick.pdf",
            largeIcon: "joystick_large.pdf",
            artists: ["Skrillex", "The Game", "2 Chainz", "Jay Z", "T.I.", "Rihanna", "Eminem"],
            color: ["red": 51, "green": 204, "blue": 102, "alpha": 1.0]
        ),
        Playlist(title: "Futbal Remix",
            description: "There’s nothing like the world’s game. Kick around the field with this eclectic playlist from around the world. Futbal for life.",
            icon: "ball.pdf",
            largeIcon: "ball_large.pdf",
            artists: ["Shakira", "Santana", "Wyclef Jean", "Aloe Blacc", "Pitbull", "Enrique Iglesias", "Ricky Martin"],
            color: ["red": 255, "green": 102, "blue": 153, "alpha": 1.0]
        )
    ]
}