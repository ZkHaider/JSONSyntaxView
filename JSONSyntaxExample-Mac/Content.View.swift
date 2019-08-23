//
//  Content.View.swift
//  JSONSyntaxExample-Mac
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation
import AppKit
import JSONSyntaxView

final class ContentView: NSView {
    
    // MARK: - Views
    
    let textView: JSONSyntaxView = {
        let view = JSONSyntaxView(textContainer: NSTextContainer(containerSize: NSSize(width: 589.0,
                                                                                       height: 385.0)))
        view.string = "{\n \"counter\": 0 \n}"
        view.textColor = .white
        return view
    }()
    
    // MARK: - Init
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func layout() {
        super.layout()
        self.textView.frame = self.bounds.insetBy(dx: 0.0,
                                                  dy: 20.0)
    }
    
}

extension ContentView {
    fileprivate func initialize() {
        func addSubviews() {
            self.addSubview(self.textView)
        }
        func prepareViews() {
            
        }
        addSubviews()
        prepareViews()
    }
}
