// https://github.com/Quick/Quick

import Quick
import Nimble
import WebKit
import ContentFittingWebView

final class MockContentFittingWebViewDelegate: ContentFittingWebViewDelegate {
    var willChangeSizeCalled = false
    var didChangeSizeCalled = false

    func contentFittingWebView(_ contentFittingWebView: ContentFittingWebView, willChangeSizeTo size: CGSize) {
        willChangeSizeCalled = true
    }

    func contentFittingWebView(_ contentFittingWebView: ContentFittingWebView, didChangeSizeTo size: CGSize) {
        didChangeSizeCalled = true
    }
}

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("ContentFittingWebView") {
            let webView = ContentFittingWebView(frame: .zero, configuration: WKWebViewConfiguration())

            it("has an intrinsic content size") {
                webView.loadHTMLString("<p>Test</p>", baseURL: nil)
                expect(webView.intrinsicContentSize.height).toEventually(beGreaterThan(0), timeout: 5)
            }

            it("lets its delegate know when its size changes") {
                let delegate = MockContentFittingWebViewDelegate()
                let initialSize = webView.intrinsicContentSize
                webView.delegate = delegate
                webView.loadHTMLString("<br/><br/><p>Test</p>", baseURL: nil)
                expect(delegate.willChangeSizeCalled).toEventually(beTrue())
                expect(delegate.didChangeSizeCalled).toEventually(beTrue())
                expect(webView.intrinsicContentSize) != initialSize
            }
        }
    }
}
