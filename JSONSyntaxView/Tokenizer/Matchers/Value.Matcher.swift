//
//  Value.Matcher.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct ValueMatcher: RegexMatcher {
    public let matchBlock: MatchBlock
    public init(matchBlock: @escaping MatchBlock) {
        self.matchBlock = matchBlock
    }
}

extension ValueMatcher {
    
    public static let matcher: ValueMatcher = {
        return ValueMatcher { (line, range, string, prettyPrint, config) in
            let attributedString: NSAttributedString
            if let _ = string.range(of: "\\") {
                attributedString = NSAttributedString(
                    string: string,
                    attributes: config.nonStringAttributes
                )
            } else {
                attributedString = NSAttributedString(
                    string: string,
                    attributes: config.stringAttributes
                )
            }
            line.append(attributedString)
        }
    }()
    
}
