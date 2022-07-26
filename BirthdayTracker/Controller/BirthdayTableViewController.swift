

import UIKit

class BirthdayTableViewController: UITableViewController, AddBirthdayViewControllerDelegate {
    
    var birthdays = [Birthday]()
    
    let dateFormatter = DateFormatter()
    


    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        
    }
    
    
    // MARK: - AddBirthdayViewControllerDelegate
    
    func addBirthdayViewController(_ addBirthdayViewController: AddBirthdayViewController, didAddBirthday birthday: Birthday) {
        birthdays.append(birthday)
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return birthdays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "birthdayCellIdentifier", for: indexPath)
        
        let birthday = birthdays[indexPath.row]
        
        cell.textLabel?.text = birthday.firstName + "" + birthday.lastName
        
        cell.detailTextLabel?.text = dateFormatter.string(from: birthday.birthdate)
        
        return cell
    }

}
