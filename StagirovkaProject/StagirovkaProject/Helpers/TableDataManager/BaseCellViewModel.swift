

import UIKit

class BaseCellViewModel {
    var cellIdentifier: String?
    var loadFromNib: Bool = false
    var cellClass: AnyClass? {
        didSet {
            if let cellClass = cellClass {
                self.cellIdentifier = String(describing: cellClass.self)
            } else {
                self.cellIdentifier = nil
            }
        }
    }

    var didSelect: ((BaseCellViewModel) -> Void)?
    var index: UInt?
    
    var object: Any?
    
    var text: String?
}
