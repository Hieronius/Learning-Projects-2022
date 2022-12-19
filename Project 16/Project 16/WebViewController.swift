


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
        var urlString = ""
        // defined special currentCapital variable to set address for Wiki. Let's continue here.
        switch firstVC.currentCapital {
        case "London":
            urlString = "https://www.wikipedia.org"
        case "Oslo":
            urlString = "https://www.wikipedia.org"
        case "Paris":
            urlString = "https://www.wikipedia.org"
        case "Rome":
            urlString = "https://www.wikipedia.org"
        default:
            urlString = "https://www.wikipedia.org"
        }
        
        
        if let url = URL(string: "https://www.wikipedia.org") {
            let request = URLRequest(url: url)
            wkwebView.load(request)
    }
    
}
}
