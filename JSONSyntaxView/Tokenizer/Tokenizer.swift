//
//  JSON.Tokenizer.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/16/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public final class JSONTokenizer {
    
    let config: TokenizerConfig
    let regex: NSRegularExpression
    let indentMatcher: RegexMatcher
    let keyMatcher: RegexMatcher
    let valueMatcher: RegexMatcher
    let endMatcher: RegexMatcher
    
    public init(with config: TokenizerConfig = DefaultConfig.defaultValue,
                indentMatcher: RegexMatcher = IndentMatcher.matcher,
                keyMatcher: RegexMatcher = KeyMatcher.matcher,
                valueMatcher: RegexMatcher = KeyMatcher.matcher,
                endMatcher: RegexMatcher = EndMatcher.matcher) throws {
        
        self.config = config
        self.indentMatcher = indentMatcher
        self.keyMatcher = keyMatcher
        self.valueMatcher = valueMatcher
        self.endMatcher = endMatcher
        
        // ^( *)(".+" : )?("[^"]*"|[\w.+-]*)?([,\[\]{}]?,?$)
        self.regex = try NSRegularExpression(
            pattern: "^( *)(\".+\" : )?(\"[^\"]*\"|[\\w.+-]*)?([,\\[\\]{}]?,?$)",
            options: .anchorsMatchLines
        )
    }
    
    public func highlight(json string: String) -> NSAttributedString {
        return highlight(json: string,
                         withPrettyPrint: true)
    }
    
    public func highlight(json string: String,
                          withPrettyPrint prettyPrint: Bool) -> NSAttributedString {
        
        let parsedJSON: String
        if
            let data = string.data(using: .utf8),
            let json = try? JSONSerialization
                .jsonObject(
                    with: data,
                    options: []
                ) as? [AnyHashable: Any],
            let parsedData = try? JSONSerialization.data(
                withJSONObject: json,
                options: .prettyPrinted),
            let _parsedJSON = String(data: parsedData, encoding: .utf8) {
            parsedJSON = _parsedJSON
        } else {
            parsedJSON = ""
        }
        
        var line = NSMutableAttributedString(string: "")
        
        self.enumerateMatches(line: line,
                              parsedJSON: parsedJSON,
                              prettyPrint: prettyPrint,
                              indentBlock: self.indentMatcher,
                              keyBlock: self.keyMatcher,
                              valueBlock: self.valueMatcher,
                              endBlock: self.endMatcher)
        
        if line == NSAttributedString(string: "") {
            line = NSMutableAttributedString(string: parsedJSON)
        }
        
        return line
    }
    
    func enumerateMatches(
        line: NSMutableAttributedString,
        parsedJSON: String,
        prettyPrint: Bool,
        indentBlock: RegexMatcher,
        keyBlock: RegexMatcher,
        valueBlock: RegexMatcher,
        endBlock: RegexMatcher) {
        
        self.regex.enumerateMatches(
            in: parsedJSON,
            options: [],
            range: NSRange(location: 0,
                           length: parsedJSON.count)
        ) { (match, flags, stop) in
            
            guard
                let match = match,
                match.numberOfRanges >= 4
                else { return }
            
            let indentRange = match.range(at: 1)
            let keyRange = match.range(at: 2)
            let valueRange = match.range(at: 3)
            let endRange = match.range(at: 4)
            
            if (indentRange.location != NSNotFound) {
                let stringValue = parsedJSON.subString(start: indentRange.location,
                                                       end: indentRange.location + indentRange.length)
                indentBlock.matchBlock(line, indentRange, stringValue, prettyPrint, self.config)
            }
            
            if (keyRange.location != NSNotFound) {
                let stringValue = parsedJSON.subString(start: keyRange.location,
                                                       end: keyRange.location + keyRange.length)
                keyBlock.matchBlock(line, keyRange, stringValue, prettyPrint, self.config)
            }
            
            if (valueRange.location != NSNotFound) {
                let stringValue = parsedJSON.subString(start: valueRange.location,
                                                       end: valueRange.location + valueRange.length)
                valueBlock.matchBlock(line, keyRange, stringValue, prettyPrint, self.config)
            }
            
            if (endRange.location != NSNotFound) {
                let stringValue = parsedJSON.subString(start: endRange.location,
                                                       end: endRange.location + endRange.length)
                endBlock.matchBlock(line, endRange, stringValue, prettyPrint, self.config)
            }
        }
    }
    
}

extension String {
    
    func subString(start: Int,
                   end: Int) -> String {
        let startIndex = self.index(self.startIndex,
                                     offsetBy: start)
        let endIndex = self.index(startIndex,
                                   offsetBy: end - start)
        return String(self[startIndex..<endIndex])
    }
    
}
