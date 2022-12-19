


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
        
        let firstVC = ViewController()
        let currentCapitalTitle = firstVC.currentCapital! ?? ""
        var urlString = ""
        // defined special currentCapital variable to set address for Wiki. Let's continue here.
        switch currentCapitalTitle {
        case "London":
            urlString = "https://en.wikipedia.org/wiki/London"
        case "Oslo":
            urlString = "https://en.wikipedia.org/wiki/Oslo"
        case "Paris":
            urlString = "https://en.wikipedia.org/wiki/Paris"
        case "Rome":
            urlString = "https://en.wikipedia.org/wiki/Rome"
        default:
            urlString = "https://www.wikipedia.org/wiki/Berlin"
        }
        
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            wkwebView.load(request)
    }
    
}
}
