
import UIKit

class ViewController: UIViewController {
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: BUTTON ACTIONS
    @IBAction func btnZeroState(_ sender: Any) {
        let vc = UIStoryboard.init(name: main, bundle: Bundle.main).instantiateViewController(withIdentifier: listVC) as? ListVC
        vc?.urltofetch = urlForZeroState
        vc?.isNormalState = false
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnNormalState(_ sender: Any) {
        let vc = UIStoryboard.init(name: main, bundle: Bundle.main).instantiateViewController(withIdentifier: listVC) as? ListVC
        vc?.urltofetch = urlForNormalState
        vc?.isNormalState = true
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

