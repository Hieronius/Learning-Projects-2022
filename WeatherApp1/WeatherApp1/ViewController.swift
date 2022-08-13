import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlString = "http://api.apixu.com/v1/current.json?key=2fbcbca7114dd43fb82e1449491806018q=\(searchBar.text!)"
        
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
        }
        
        task.resume()
    }
}
