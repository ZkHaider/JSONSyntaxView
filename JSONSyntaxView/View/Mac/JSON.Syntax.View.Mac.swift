//
//  JSON.Syntax.View.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit

public final class JSONSyntaxView: NSTextView {
    
    // MARK: - Tokenizer
    
    internal let jsonTokenizer: JSONTokenizer
    
    // MARK: - Init
    
    public init(config: TokenizerConfig = DefaultConfig.defaultValue,
                indentMatcher: RegexMatcher = IndentMatcher.matcher,
                keyMatcher: RegexMatcher = KeyMatcher.matcher,
                valueMatcher: RegexMatcher = ValueMatcher.matcher,
                endMatcher: RegexMatcher = EndMatcher.matcher,
                defaultFrame frameRect: NSRect = .zero,
                textContainer: NSTextContainer? = nil) {
        self.jsonTokenizer = try! JSONTokenizer(with: config,
                                                indentMatcher: indentMatcher,
                                                keyMatcher: keyMatcher,
                                                valueMatcher: valueMatcher,
                                                endMatcher: endMatcher)
        super.init(frame: frameRect, textContainer: textContainer)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension JSONSyntaxView {
    
    fileprivate func initialize() {
        func addSubviews() {
            
        }
        func prepareViews() {
            self.delegate = self
            self.wantsLayer = true
            self.canDrawConcurrently = true
        }
        addSubviews()
        prepareViews()
    }
    
}

extension JSONSyntaxView: NSTextViewDelegate {
    
    // Monitor and update text changes
    public func textDidChange(_ notification: Notification) {
        print(notification)
    }
    
}

#endif
