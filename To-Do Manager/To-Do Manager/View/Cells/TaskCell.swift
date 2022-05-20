
import UIKit

/// 1.7
/// Custom cluss for stack prototype cell
class TaskCell: UITableViewCell {
    
    /// 1.8
    @IBOutlet var symbol: UILabel!
    @IBOutlet var title: UILabel!

    // Method to work with cell if she was made with Interface Builder (structure of this cell stored in storyboard-file or in xib-file)
    // Method gives us ability to edit graphic elements stored in the cell
    override func awakeFromNib() {
        super.awakeFromNib()
    // Initialization code
    }
    
    // This method activated when user clicked on specific cell.
    // This method can be used to editing different animations inside the cell
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
    }

}

