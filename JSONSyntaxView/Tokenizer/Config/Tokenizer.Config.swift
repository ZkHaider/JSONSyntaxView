//
//  Tokenizer.Config.swift
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit
#elseif os(iOS)
import UIKit
#endif 

public protocol TokenizerConfig {
    var defaultAttributes: [NSAttributedString.Key: Any] { get }
    var nonStringAttributes: [NSAttributedString.Key: Any] { get }
    var stringAttributes: [NSAttributedString.Key: Any] { get }
    var keyAttributes: [NSAttributedString.Key: Any] { get }
    init() 
}

public struct DefaultConfig: TokenizerConfig {
    
    public let defaultAttributes: [NSAttributedString.Key : Any]
    public let nonStringAttributes: [NSAttributedString.Key : Any]
    public let stringAttributes: [NSAttributedString.Key : Any]
    public let keyAttributes: [NSAttributedString.Key : Any]

    public init() {
        var defaultAttributes: [NSAttributedString.Key: Any] = [:]
        var nonStringAttributes: [NSAttributedString.Key: Any] = [:]
        var stringAttributes: [NSAttributedString.Key: Any] = [:]
        var keyAttributes: [NSAttributedString.Key: Any] = [:]
        #if os(OSX)
        //
        defaultAttributes[.foregroundColor] = NSColor(
            deviceWhite: 1.0, alpha: 1.0
        )
        nonStringAttributes[.foregroundColor] = NSColor(
            deviceRed: 0.668,
            green: 0.514,
            blue: 0.898,
            alpha: 1.0
        )
        stringAttributes[.foregroundColor] = NSColor(
            deviceRed: 0.937,
            green: 0.534,
            blue: 0.459,
            alpha: 1.0
        )
        keyAttributes[.foregroundColor] = NSColor(
            deviceRed: 0.937,
            green: 0.534,
            blue: 0.459,
            alpha: 1.0
        )
        #elseif os(iOS)
        defaultAttributes[.foregroundColor] = UIColor(
            white: 1.0,
            alpha: 1.0
        )
        nonStringAttributes[.foregroundColor] = UIColor(
            red: 0.668,
            green: 0.514,
            blue: 0.898,
            alpha: 1.0
        )
        stringAttributes[.foregroundColor] = UIColor(
            red: 0.937,
            green: 0.534,
            blue: 0.459,
            alpha: 1.0
        )
        keyAttributes[.foregroundColor] = UIColor(
            red: 0.937,
            green: 0.534,
            blue: 0.459,
            alpha: 1.0
        )
        #endif
        self.defaultAttributes = defaultAttributes
        self.nonStringAttributes = nonStringAttributes
        self.stringAttributes = stringAttributes
        self.keyAttributes = keyAttributes
    }
    
}

extension DefaultConfig {
    public static var defaultValue: DefaultConfig {
        return DefaultConfig()
    }
}
