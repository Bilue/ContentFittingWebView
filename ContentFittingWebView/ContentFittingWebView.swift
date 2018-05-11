//
//  ContentFittingWebView.swift
//  ContentFittingWebView
//
//  Created by Rhys Powell on 11/5/18.
//  Copyright © 2018 Bilue. All rights reserved.
//

import UIKit
import WebKit

/// A delegate that will receive updates when a `ContentFittingWebView's` size changes
@objc public protocol ContentFittingWebViewDelegate {
    /// Called before the web view invalidates its current content size
    @objc optional func contentFittingWebView(_ contentFittingWebView: ContentFittingWebView, willChangeSizeTo size: CGSize)
    /// Called after the web view invalidates its current content size
    @objc optional func contentFittingWebView(_ contentFittingWebView: ContentFittingWebView, didChangeSizeTo size: CGSize)
}

/// A `WKWebView` subclass which keeps its `intrinsicContentSize` up to date
///
/// - Note: If content is expected to change after the initial load, set
///   `hasLiveContent` to true
public final class ContentFittingWebView: WKWebView {

    var contentSizeObservationToken: NSKeyValueObservation?

    /// Whether the content of this web view is expected to change in size
    // after the initial load
    var hasLiveContent: Bool = false

    /// A delegate that will receive updates when this web view's size changes
    weak var delegate: ContentFittingWebViewDelegate?

    public override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        startObservingHeight()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        startObservingHeight()
    }

    public override var intrinsicContentSize: CGSize {
        return scrollView.contentSize
    }

    private func startObservingHeight() {
        contentSizeObservationToken = observe(\.scrollView.contentSize, options: [.initial, .old, .new]) { (_, change) in
            if let oldValue = change.oldValue,
                let newValue = change.newValue {
                if oldValue.height == newValue.height {
                    self.delegate?.contentFittingWebView?(self, willChangeSizeTo: newValue)
                    self.invalidateIntrinsicContentSize()
                    self.delegate?.contentFittingWebView?(self, didChangeSizeTo: newValue)
                    if !self.hasLiveContent { self.contentSizeObservationToken?.invalidate() }
                }
            }
        }
    }
}
