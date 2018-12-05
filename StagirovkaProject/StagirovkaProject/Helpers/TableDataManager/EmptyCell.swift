
import UIKit
//import PureLayout

class EmptyCell: BaseTableViewCell {

    override class func heightCell() -> CGFloat {
        return UITableView.automaticDimension
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewModelChanged() {
        super.viewModelChanged()
        let viewModel = self.viewModel as! EmptyViewModel
        
        //contentView.autoSetDimension(.height, toSize: viewModel.heightCell!)
        
        backgroundColor = viewModel.color
    }
}
