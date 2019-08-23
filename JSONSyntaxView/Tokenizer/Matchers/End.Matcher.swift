//
//  End.Matcher.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct EndMatcher: RegexMatcher {
    public let matchBlock: MatchBlock
    public init(matchBlock: @escaping MatchBlock) {
        self.matchBlock = matchBlock
    }
}

extension EndMatcher {
    
    public static let matcher: EndMatcher = {
        let matcher = EndMatcher { (line, range, string, prettyPrint, config) in
            let attributedString = NSAttributedString(
                string: string,
                attributes: config.defaultAttributes
            )
            line.append(attributedString)
            if prettyPrint {
                line.append(
                    NSAttributedString(string: "\n")
                )
            }
        }
        return matcher 
    }()
    
}
