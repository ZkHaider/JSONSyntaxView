//
//  AppDelegate.swift
//  JSONSyntaxExample-Mac
//
//  Created by Haider Khan on 8/16/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Cocoa
import SwiftUI
import JSONSyntaxView

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var window: NSWindow = {
        return NSWindow(contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
                        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                        backing: .buffered,
                        defer: false)
    }()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentViewController = ContentViewController()
        window.center()
        window.contentView = contentViewController.view
        window.contentViewController = contentViewController
        window.makeKeyAndOrderFront(nil)
    }

}

