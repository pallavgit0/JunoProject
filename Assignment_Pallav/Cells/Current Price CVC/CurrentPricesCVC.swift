

import UIKit

class CurrentPricesCVC: UICollectionViewCell {
    
    @IBOutlet weak var imgVw: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureCell(title: String?, subTitle: String?, url: String?) {
        if let title, let subTitle, let url  {
            lblTitle.text = title
            lblSubtitle.text = "$" + subTitle
            ImageConverter.svgToImage(urlString: url, for: imgVw)
        }
    }
}
