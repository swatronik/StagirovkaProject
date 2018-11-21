
import UIKit
//import PureLayout

class BaseTableViewCell: UITableViewCell {

    var viewModel: BaseCellViewModel?

    func viewModelChanged() {
        print("Missing subclass implementation.")
        
    }

    class func heightCell() -> CGFloat {
        return 0.0
    }
    
    func configureCell() {
        print("Missing subclass implementation.")
    }
}

