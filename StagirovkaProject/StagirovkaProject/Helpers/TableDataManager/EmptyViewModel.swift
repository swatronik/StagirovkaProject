
import UIKit

class EmptyViewModel: BaseCellViewModel {
    var color : UIColor?
    var heightCell: CGFloat?
    
    convenience init(color: UIColor, height: CGFloat) {
        self.init()
        self.color = color
        self.heightCell = height
    }
    
    override init() {
        super.init()
        heightCell = 1
        cellClass = EmptyCell.self
    }

}
