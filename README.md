# JSONSyntaxView

Simple creation of a `TextField` that highlights `JSON` for you.

## Installation 

### Carthage 

Add `github "ZkHaider/JSONSyntaxView" "master"` to your Cartfile, and run Carthage. 

### Requirements

- Deployment target iOS 11.0+
- Swift 4+
- Xcode 10+

## Usage 

#### Simple View Creation 

```swift 
import JSONSyntaxView 

// Create
let jsonTextView: JSONTextView = JSONTextView()

// Highlight your json string 
jsonTextView.highlight(json: "{"value": "my JSON string"}")
```

#### Configurations 

You can initialize a `JSONSyntaxView` with different `Matcher` types and custom configs.

You can create your own `Matcher` just conform to the `RegexMatcher` protocol:

```swift 
import JSONSyntaxView 

struct MyCustomMatcher: RegexMatcher {

    let matchBlock: MatchBlock 

    init(matchBlock: @escaping MatchBlock) {
        self.matchBlock = matchBlock
    }

}
```

Then initialize like so:

```swift 
import JSONSyntaxView 

let jsonSyntaxView = JSONSyntaxView(indentMatcher: MyCustomMatcher(...))
```

Create a custom configuration by conforming to the `TokenizerConfig` protocol. 

```swift 
import JSONSyntaxView 

struct MyCustomConfig: TokenizerConfig {

    // Initialize attributes...

}
```

Set up your view like so:

```swift
import JSONSyntaxView

let jsonSyntaxView = JSONSyntaxView(config: MyCustomConfig())
```
