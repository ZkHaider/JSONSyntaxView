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

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")

        window.contentView = ContentView(frame: .zero)

        window.makeKeyAndOrderFront(nil)
    }

}

