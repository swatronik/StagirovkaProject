//
//  AuthButtonViewModel.swift
//  StagirovkaProject
//
//  Created by Admin on 21/11/2018.
//  Copyright © 2018 PolyakovDenis. All rights reserved.
//

import UIKit

class AuthButtonViewModel: BaseCellViewModel {
    
    //    convenience init(eventModelShort: EventModel) {
    //        self.init()
    //        self.eventModelShort = eventModelShort
    //    }
    
    var actionClosure: (()->Void)?
    
    override init() {
        super.init()
        cellClass = AuthButtonViewCell.self
        loadFromNib = true
    }
    
    // MARK: - Getters
    
    //    func title() -> String {
    //
    //        guard let name = eventModelShort?.name else {
    //            return ""
    //        }
    //
    //        return name
    //    }
    //
    //    func textInfo() -> String {
    //        guard let textInfo = eventModelShort?.shortDescr else {
    //            return ""
    //        }
    //        return textInfo
    //    }
    //
    //    func dateString() -> String {
    //        guard let dateString = eventModelShort?.dateString else {
    //            return ""
    //        }
    //        return dateString
    //    }
    
}
