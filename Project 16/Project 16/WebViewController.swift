


import UIKit
import WebKit

class WebViewController: UIViewController, UIWebViewDelegate {
    // var webView = WKWebView()
    
    @IBOutlet var wkwebView: WKWebView!
    
//    override func loadView() {
//        self.view = webView
//    }
    
    override func viewDidLoad() {
//        let webView = WKWebView()
        
        if let url = URL(string: "https://www.wikipedia.org") {
            let request = URLRequest(url: url)
            wkwebView.load(request)
    }
    
}
}
