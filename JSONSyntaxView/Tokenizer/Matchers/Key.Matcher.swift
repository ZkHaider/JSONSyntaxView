//
//  Key.Matcher.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct KeyMatcher: RegexMatcher {
    public let matchBlock: MatchBlock
    public init(matchBlock: @escaping MatchBlock) {
        self.matchBlock = matchBlock
    }
}

extension KeyMatcher {
    
    public static let matcher: KeyMatcher = {
        return KeyMatcher { (line, range, string, prettyPrint, config) in
            let key = string[string.index(after: string.startIndex)..<string.endIndex]
            line.append(
                NSAttributedString(
                    string: String(key),
                    attributes: config.keyAttributes
                )
            )
            line.append(
                NSAttributedString(
                    string: prettyPrint ? " : " : ":",
                    attributes: config.defaultAttributes
                )
            )
        }
    }()
    
}
