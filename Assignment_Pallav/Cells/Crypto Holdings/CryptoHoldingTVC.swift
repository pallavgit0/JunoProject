
import UIKit

class CryptoHoldingTVC: UITableViewCell {
    
    @IBOutlet weak var imgVw: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func configureCell(title: String?, logo: String?) {
        if let title, let logo {
            lblTitle.text = title
            ImageConverter.svgToImage(urlString: logo, for: imgVw)
        }
    }
}
