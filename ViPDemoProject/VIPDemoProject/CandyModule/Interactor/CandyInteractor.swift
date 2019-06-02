//
//  CandyInteractor.swift
//  VipDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

/// Candy Module Interactor Protocol
protocol CandyInteractorProtocol {
    // Fetch Canry Entity from Data Layer
    func fetchCandy()
    // Fetch Object from Data Layer
    func update(candyQuantity quantity:Int)
}

/// Candy Module Interactor
class CandyInteractor: CandyInteractorProtocol {
    
    private static let vat:Float = 6.5
    private var candyEntity:CandyEntity?
    private let apiWorker: CandyAPIWorkerProtocol

    var presenter: CandyPresenterProtocol?

    required init(withApiWorker apiWorker:CandyAPIWorkerProtocol) {
        self.apiWorker = apiWorker
    }
    
    func fetchCandy() {
        apiWorker.fetchCandy { [unowned self] (candyEntity) in
            self.candyEntity = candyEntity
            self.presenter?.interactor(self, didFetch: candyEntity)
        }
    }
    
    func update(candyQuantity quantity: Int) {
        guard let candyEntity = self.candyEntity else {
            return
        }
        
        let totalPrice = candyEntity.price * Float(quantity)
        let tax = (totalPrice/100) * CandyInteractor.vat
        let totalInclTax = totalPrice + tax
        presenter?.interactor(self,
                              didUpdateTotalPrice: totalPrice,
                              totalInclTax: totalInclTax,
                              vat: CandyInteractor.vat,
                              quantity: quantity)
    }
}
