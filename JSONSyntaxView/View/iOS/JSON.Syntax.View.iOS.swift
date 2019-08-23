//
//  JSON.Syntax.View.iOS.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit

public final class JSONSyntaxView: UITextView {
    
    // MARK: - Tokenizer
    
    internal let jsonTokenizer: JSONTokenizer
    
    // MARK: - Init
    
    public init(config: TokenizerConfig = DefaultConfig.defaultValue,
                indentMatcher: RegexMatcher = IndentMatcher.matcher,
                keyMatcher: RegexMatcher = KeyMatcher.matcher,
                valueMatcher: RegexMatcher = ValueMatcher.matcher,
                endMatcher: RegexMatcher = EndMatcher.matcher,
                defaultframe frame: CGRect = .zero,
                textContainer: NSTextContainer? = nil) {
        self.jsonTokenizer = try! JSONTokenizer(with: config,
                                                indentMatcher: indentMatcher,
                                                keyMatcher: keyMatcher,
                                                valueMatcher: valueMatcher,
                                                endMatcher: endMatcher)
        super.init(frame: frame, textContainer: textContainer)
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
        }
        addSubviews()
        prepareViews()
    }
}

extension JSONSyntaxView: UITextViewDelegate {
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        
        // We stopped editing text so go ahead and use the tokenizer to change our changed value
        
    }
    
}

#endif
