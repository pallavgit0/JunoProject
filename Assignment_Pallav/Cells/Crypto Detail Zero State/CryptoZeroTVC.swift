
import UIKit

class CryptoZeroTVC: UITableViewCell {

    //MARK: IBOUTLETS
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageVw: UIImageView!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    //MARK: VIEW LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: HELPER METHODS
    func configureCell(title: String?, subTitle: String?) {
        lblTitle.text = title
        lblSubtitle.text = subTitle
    }
    
}
