
import UIKit

class CurrentPriceTVC: UITableViewCell {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var collectionCurrentPrices: UICollectionView!
    
    //MARK: VARIABLES
    public var cryptoPrices = [CryptoPrice]()
    
    //MARK: VIEW LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    //MARK: HELPER METHODS
    private func initialSetup() {
        collectionCurrentPrices.delegate = self
        collectionCurrentPrices.dataSource = self
        collectionCurrentPrices.register(UINib(nibName: cvcPrices, bundle: nil), forCellWithReuseIdentifier: cvcPrices)
        
    }
    
}

//MARK: COLLECTION VIEW DELEGATES
extension CurrentPriceTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cryptoPrices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentPricesCVC", for: indexPath) as! CurrentPricesCVC
        cell.configureCell(title: cryptoPrices[indexPath.row].title, subTitle: cryptoPrices[indexPath.row].current_price_in_usd, url: cryptoPrices[indexPath.row].logo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2.0
        let height = collectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
}
