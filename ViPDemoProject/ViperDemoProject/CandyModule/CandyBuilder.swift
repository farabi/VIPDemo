//
//  CandyBuilder.swift
//  ViperDemoProject
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
        
        //MARK: link Viper components.
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
