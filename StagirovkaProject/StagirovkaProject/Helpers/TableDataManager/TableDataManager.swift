

import UIKit

typealias CellConfigurationBlock = (_ cell: Any, _ item: Any, _ indextPath: IndexPath) -> Void

class TableDataManager: NSObject {
    
    var configurationBlock: CellConfigurationBlock?
    
    var arrayViewModels: [BaseCellViewModel]? {
        didSet {
            arrayViewModelsChanged()
        }
    }
    var tableView: UITableView? {
        didSet {
            if let tableView = tableView {
                tableView.delegate = self
                tableView.dataSource = self
            }
        }
    }

    func arrayViewModelsChanged() {
        if let arrayViewModels = arrayViewModels {
            for viewModel in arrayViewModels {
                if let cellClass = viewModel.cellClass, let cellIdentifier = viewModel.cellIdentifier {
                    if viewModel.loadFromNib {
                        tableView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
                    } else {
                        tableView?.register(cellClass, forCellReuseIdentifier: cellIdentifier)
                    }
                }
            }
        }
        tableView?.reloadData()
    }
}

//MARK: UITableViewDataSource
extension TableDataManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let arrayViewModels = arrayViewModels {
            return arrayViewModels.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = arrayViewModels![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier!)
        if cell is BaseTableViewCell {
            let baseCell = cell as! BaseTableViewCell
            
            if let configBlock = configurationBlock {
                configBlock(cell ?? UITableViewCell(), viewModel, indexPath)
            }
            
            
            baseCell.viewModel = viewModel
            baseCell.viewModelChanged()
            viewModel.index = UInt(indexPath.row)
        }
        return cell!
    }
}

//MARK: UITableViewDelegate
extension TableDataManager: UITableViewDelegate {
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModel = arrayViewModels![indexPath.row]
        let cellClass = viewModel.cellClass as! BaseTableViewCell.Type
        return cellClass.heightCell()
    }*/

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = arrayViewModels![indexPath.row]
        if let didSelect = viewModel.didSelect {
            didSelect(viewModel)
        }
    }
}
