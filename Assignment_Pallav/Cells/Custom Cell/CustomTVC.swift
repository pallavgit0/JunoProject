
import UIKit

class CustomTVC: UITableViewCell {

    //MARK: IBOUTLETS
    @IBOutlet weak var imageVw: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblSubPrice: UILabel!
    
    //MARK: VIEW LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: HELPER METHODS
    func configureCell(title: String?, description: String?, logo: String?, amount: String?, subAmount: String?) {
        if let title, let description, let amount{
            lblTitle.text = title
            lblSubTitle.text = description
            lblPrice.text = "$" + amount
        }
        if let subAmount {
            lblSubPrice.text = subAmount
        } else {
            lblSubPrice.isHidden = true
        }
        if let logo {
            ImageConverter.svgToImage(urlString: logo, for: imageVw)
        }
        else {
            imageVw.isHidden = true
        }
    }
}
