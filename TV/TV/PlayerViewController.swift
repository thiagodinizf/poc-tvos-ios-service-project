//
//  PlayerViewController.swift
//  TV
//
//  Created by Thiago Diniz on 28/06/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Foundation
import BitmovinPlayer

class PlayerViewController: UIViewController {
    
    var player: BitmovinPlayer?
    
    deinit {
        player?.destroy()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        // Define needed resources
        guard let streamUrl = URL(string: "https://bitmovin-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8") else {
            return
        }
        
        // Create player configuration
        let config = PlayerConfiguration()
        
        do {
            try config.setSourceItem(url: streamUrl)
            
            // Create player based on player configuration
            let player = BitmovinPlayer(configuration: config)
            
            // Create player view and pass the player instance to it
            let playerView = BMPBitmovinPlayerView(player: player, frame: .zero)
            
            // Listen to player events
            player.add(listener: self)
            
            playerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            playerView.frame = view.bounds
            
            view.addSubview(playerView)
            view.bringSubview(toFront: playerView)
            
            self.player = player
        } catch {
            print("Configuration error: \(error)")
        }
    }
}

extension PlayerViewController: PlayerListener {
    
    func onPlay(_ event: PlayEvent) {
        print("onPlay \(event.time)")
    }
    
    func onPaused(_ event: PausedEvent) {
        print("onPaused \(event.time)")
    }
    
    func onTimeChanged(_ event: TimeChangedEvent) {
        print("onTimeChanged \(event.currentTime)")
    }
    
    func onDurationChanged(_ event: DurationChangedEvent) {
        print("onDurationChanged \(event.duration)")
    }
    
    func onError(_ event: ErrorEvent) {
        print("onError \(event.message)")
    }
}
