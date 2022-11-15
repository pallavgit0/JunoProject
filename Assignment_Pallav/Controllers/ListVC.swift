
import UIKit

class ListVC: UIViewController {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: PROPERTIES
    private var listVM = ListVM()
    public var urltofetch: String?
    public var isNormalState = true
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: HELPER METHODS
    private func initialSetUp() {
        
        listVM.delegate = self
        tableView.delegate = listVM
        tableView.dataSource = listVM
        
        // register cells
        tableView.register(UINib(nibName: cryptoDetailCell, bundle: nil), forCellReuseIdentifier: cryptoDetailCell)
        tableView.register(UINib(nibName: customCell, bundle: nil), forCellReuseIdentifier: customCell)
        tableView.register(UINib(nibName: yourHoldingsCell, bundle: nil), forCellReuseIdentifier: yourHoldingsCell)
        tableView.register(UINib(nibName: tvcPrices, bundle: nil), forCellReuseIdentifier: tvcPrices)
        tableView.register(UINib(nibName: headerCell, bundle: nil), forCellReuseIdentifier: headerCell)
        
        // handle api calls for states
        listVM.isNormalState = self.isNormalState
        listVM.apiCall(for: isNormalState ? urlForNormalState : urlForZeroState)
        tableView.separatorInset = UIEdgeInsets.zero
    }
}

//MARK: EXTENSIONS
extension ListVC : ListModelDelegate {
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
