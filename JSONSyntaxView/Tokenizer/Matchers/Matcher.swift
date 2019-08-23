//
//  Matcher.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public protocol RegexMatcher {
    typealias MatchBlock = (NSMutableAttributedString, NSRange, String, Bool, TokenizerConfig) -> ()
    var matchBlock: MatchBlock { get }
}
