//
//  JSONSyntaxView.h
//  JSONSyntaxView
//
//  Created by Haider Khan on 8/16/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TargetConditionals.h>

#if TARGET_OSX
#import <AppKit/AppKit.h>
#elseif TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#endif

//! Project version number for JSONSyntaxView.
FOUNDATION_EXPORT double JSONSyntaxViewVersionNumber;

//! Project version string for JSONSyntaxView.
FOUNDATION_EXPORT const unsigned char JSONSyntaxViewVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <JSONSyntaxView/PublicHeader.h>


