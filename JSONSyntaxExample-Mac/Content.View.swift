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
    
    let textView: NSTextView = {
        let view = NSTextView(frame: .zero)
        view.isEditable = true
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
        self.textView.frame = self.bounds.insetBy(dx: 0.0, dy: 20.0)
    }
    
    override func layoutSubtreeIfNeeded() {
        super.layoutSubtreeIfNeeded()
    }
    
}

extension ContentView {
    fileprivate func initialize() {
        func addSubviews() {
            self.addSubview(self.textView)
        }
        func prepareViews() {
            let tokenizer = try! JSONTokenizer()
            self.textView.textStorage?.append(tokenizer.highlight(json: "{\n \"counter\": 0 \n}"))
        }
        addSubviews()
        prepareViews()
    }
}
