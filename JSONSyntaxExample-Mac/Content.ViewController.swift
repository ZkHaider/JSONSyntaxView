//
//  Content.ViewController.swift
//  JSONSyntaxExample-Mac
//
//  Created by Haider Khan on 8/22/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation
import AppKit

final public class ContentViewController: NSViewController {
    
    // MARK: - Views
    
    var _view: ContentView {
        return self.view as! ContentView
    }
    
    // MARK: - Init
    
    public required init() {
        super.init(nibName: nil, bundle: nil)
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func loadView() {
        self.view = ContentView(frame: .zero)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ContentViewController {
    fileprivate func initialize() {
        func addSubviews() {
            
        }
        func prepareViews() {
            
        }
        addSubviews()
        prepareViews()
    }
}
