


import UIKit
import WebKit

class WebViewController: UIViewController, UIWebViewDelegate {
    // var webView = WKWebView()
    
    @IBOutlet var wkwebView: WKWebView!
    
//    override func loadView() {
//        self.view = webView
//    }
    
    var firstVC = ViewController()
    var currentCapitalTitle: String?
    var urlStringS = ""
    
    
    override func viewDidLoad() {
//        let webView = WKWebView()
        // getCapitalWebPage()
        
        
    
}
    func getCapitalWebPage() {
        
        // let firstVC = ViewController()
        // print("3 - \(firstVC.currentCapital)")
        // let currentCapitalTitle = firstVC.currentCapital
//        currentCapitalTitle = firstVC.currentCapital
//        print("4 - \(currentCapitalTitle)")
////        var urlString = ""
//        print("2 - \(currentCapitalTitle)")
        // defined special currentCapital variable to set address for Wiki. Let's continue here.
//        switch currentCapitalTitle {
//        case "London":
//            urlString = "https://en.wikipedia.org/wiki/London"
//        case "Oslo":
//            urlString = "https://en.wikipedia.org/wiki/Oslo"
//        case "Paris":
//            urlString = "https://en.wikipedia.org/wiki/Paris"
//        case "Rome":
//            urlString = "https://en.wikipedia.org/wiki/Rome"
//        default:
//            urlString = "https://www.wikipedia.org/wiki/Berlin"
//        }
//        let urlString = firstVC.urlString
        // print("2 - \(urlStringS)")
        
//        if let url = URL(string: urlStringS) {
//            let request = URLRequest(url: url)
//            wkwebView.load(request)
    }
}
