

import UIKit
import Alamofire

protocol ListModelDelegate: AnyObject {
    func reloadTable()
    
}

class ListVM: NSObject {
    
    //MARK: VARIABLES
    weak var delegate: ListModelDelegate?
    private var dataModel: Model?
    public var isNormalState = true
    
    //MARK: API CALLING
    public func apiCall(for url: String) {
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            responseData in
            print(responseData)
            guard let data = responseData.data else {
                return
            }
            do {
                let modelData = try JSONDecoder().decode(Model.self, from: data)
                self.dataModel = modelData
                self.delegate?.reloadTable()
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
}

//MARK: TABLEVIEW DELEGATES
extension ListVM: UITableViewDelegate, UITableViewDataSource {
    
    //number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    // number of items for different sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return dataModel?.your_crypto_holdings?.count ?? 0
        case 2:
            return dataModel?.all_transactions?.count ?? 0
        case 3:
            return 1
        default:
            break
        }
        return blankNumber
    }
    
    // content of cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cryptoDetails = dataModel?.crypto_balance
        let cryptoHoldings = dataModel?.your_crypto_holdings
        let transactions = dataModel?.all_transactions
        let cryptoPrices = dataModel?.crypto_prices
        
        // handling normal state and zero state table view cells's content
        // normal state
        if isNormalState {
            
            if indexPath.section != 3{
                let cell = tableView.dequeueReusableCell(withIdentifier: customCell, for: indexPath) as! CustomTVC
                switch indexPath.section {
                case 0:
                    cell.configureCell(title: cryptoDetails?.title, description: cryptoDetails?.subtitle, logo: nil, amount: cryptoDetails?.current_bal_in_usd, subAmount: nil)
                    return cell
                case 1:
                    cell.configureCell(title: cryptoHoldings?[indexPath.row].title, description: cryptoHoldings?[indexPath.row].current_bal_in_token, logo: cryptoHoldings?[indexPath.row].logo, amount: cryptoHoldings?[indexPath.row].current_bal_in_usd, subAmount: nil)
                    return cell
                case 2:
                    cell.configureCell(title: transactions?[indexPath.row].title, description: transactions?[indexPath.row].txn_time, logo: transactions?[indexPath.row].txn_logo, amount: transactions?[indexPath.row].txn_amount, subAmount: transactions?[indexPath.row].txn_sub_amount)
                    return cell
                default:
                    break
                }
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: tvcPrices, for: indexPath) as! CurrentPriceTVC
                cell.cryptoPrices = cryptoPrices ?? [CryptoPrice]()
                DispatchQueue.main.async {
                    cell.collectionCurrentPrices.reloadData()
                }
                return cell
            }
        }
        // zero state
        else {
            switch indexPath.section {
            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cryptoDetailCell, for: indexPath) as! CryptoZeroTVC
                cell.configureCell(title: cryptoDetails?.title, subTitle: cryptoDetails?.subtitle)
                return cell
            case 1:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: yourHoldingsCell, for: indexPath) as! CryptoHoldingTVC
                cell.configureCell(title: cryptoHoldings?[indexPath.row].title, logo: cryptoHoldings?[indexPath.row].logo)
                return cell
            case 2:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: customCell, for: indexPath) as! CustomTVC
                cell.configureCell(title: transactions?[indexPath.row].title, description: transactions?[indexPath.row].txn_time, logo: transactions?[indexPath.row].txn_logo, amount: transactions?[indexPath.row].txn_amount, subAmount: transactions?[indexPath.row].txn_sub_amount)
                return cell
            case 3:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: tvcPrices, for: indexPath) as! CurrentPriceTVC
                cell.cryptoPrices = cryptoPrices ?? [CryptoPrice]()
                DispatchQueue.main.async {
                    cell.collectionCurrentPrices.reloadData()
                }
                
                return cell
            default:
                break
            }
        }
        return blankCell
    }
    
    // height for cell: dynamic and fixed
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 3:
            return 180
        default:
            return UITableView.automaticDimension
        }
    }
    
    // height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 80
        }
    }
    // header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed(headerCell, owner: self, options: nil)?.first as? HeaderTVC
        headerCell?.setHeader(with: headerArray[section], for: section)
        return headerCell
    }
    
}



