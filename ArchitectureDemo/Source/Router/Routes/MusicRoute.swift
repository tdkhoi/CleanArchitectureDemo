//
//  Music.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation


protocol MusicRoute {
    func openMusicScene()
}

extension MusicRoute where Self: RouterProtocol {
    func openMusicScene() {
        let transition = PushTransition()
        let musicVC = MusicViewController()
        musicVC.view.backgroundColor = .cyan
        musicVC.router.openTransition = transition
        
        open(musicVC, transition: transition)
    }
}
