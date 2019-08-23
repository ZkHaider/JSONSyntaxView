//
//  Indent.Matcher.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct IndentMatcher: RegexMatcher {
    
    public let matchBlock: MatchBlock
    
    public init(matchBlock: @escaping MatchBlock) {
        self.matchBlock = matchBlock
    }
}

extension IndentMatcher {
    
    public static let matcher: IndentMatcher = {
        return IndentMatcher { (line, range, string, prettyPrint, config) in
            let attributedString = NSAttributedString(
                string: string,
                attributes: config.defaultAttributes
            )
            if prettyPrint {
                line.append(attributedString)
            }
        }
    }()
    
}
