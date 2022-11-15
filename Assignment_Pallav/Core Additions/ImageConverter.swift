
import UIKit

/// converts image from url and load in imageview using SDWebImageSVGCoder
struct ImageConverter {
    
    static func svgToImage(urlString: String, for imageView: UIImageView) {
        guard let url = URL(string: urlString) else{
            return
        }
        DispatchQueue.main.async {
            imageView.sd_setImage(with: url)
        }
    }
}
