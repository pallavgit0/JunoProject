
import UIKit

class HeaderTVC: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnViewAll: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setHeader(with title: String, for section: Int) {
        lblTitle.text = title
        switch section {
        case 2:
            btnViewAll.isHidden = false
        default:
            btnViewAll.isHidden = true
        }
    }
}
