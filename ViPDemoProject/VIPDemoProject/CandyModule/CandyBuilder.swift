//
//  CandyBuilder.swift
//  VipDemoProject
//
//  Created by Saad El Oulladi on 16/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

class CandyBuilder {

    class func buildModule(arroundView view:CandyViewProtocol) {
        
        //MARK: Initialise components.
        let presenter = CandyPresenter()
        let interactor = CandyInteractor(withApiWorker: CandyAPIWorker())
        let router = CandyRouter()
        
        //MARK: link VIP components.
        view.presenter = presenter
        view.interactor = interactor
        view.wireframe = router
        presenter.view = view
        interactor.presenter = presenter
    }
}
