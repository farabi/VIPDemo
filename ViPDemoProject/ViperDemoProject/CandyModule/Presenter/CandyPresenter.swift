//
//  CandyPresenter.swift
//  ViperDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Foundation


/// Candy Module Presenter Protocol
protocol CandyPresenterProtocol : class {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetchCandy()
    /// Quantity changed action
    func update(candyQuantity quantity:Int)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: CandyInteractorProtocol, didFetch object: CandyEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: CandyInteractorProtocol, didFailWith error: Error)
    /// The Interactor updates the Presenter with new total price.
    func interactor(_ interactor: CandyInteractorProtocol, didUpdateTotalPrice totalPrice:Float, totalInclTax:Float,vat:Float, quantity:Int)
}

/// Candy View Model
struct CandyViewModel {
    let title: String
    let description: String
    let price: String
    let imageName: String
}

/// Total Price View Model
struct TotalPriceViewModel {
    let totalPrice: String
    let totalInclTax: String
    let vat: String
    let quantity: String
}

/// Candy Module Presenter
class CandyPresenter {

    weak var view: CandyViewProtocol?
    var wireframe: CandyRouterProtocol?
    var interactor: CandyInteractorProtocol?
}

// MARK: - extending CandyPresenter to implement it's protocol
extension CandyPresenter: CandyPresenterProtocol {
    
    func fetchCandy() {
        interactor?.fetchCandy()
    }
    
    func update(candyQuantity quantity:Int) {
        interactor?.update(candyQuantity: quantity)
    }
    
    // MARK: - implement UI action handler
    func interactor(_ interactor: CandyInteractorProtocol, didFetch object: CandyEntity) {
        
        let priceText = "\(object.price) €"
        let candyViewModel = CandyViewModel(title: object.title,
                                            description: object.description,
                                            price: priceText,
                                            imageName: object.imageName)
        
        view?.set(viewModel: candyViewModel)
    }
    
    func interactor(_ interactor: CandyInteractorProtocol, didFailWith error: Error) {
        // Manage fetch failure
    }
    
    func interactor(_ interactor: CandyInteractorProtocol,
                    didUpdateTotalPrice totalPrice: Float,
                    totalInclTax: Float,
                    vat: Float,
                    quantity: Int) {

        let totalPriceText = "Total Price : \(totalPrice)€"
        let totalInclTaxText = "Incl Tax : \(totalInclTax)€"
        let vatText = "Tax : \(vat)%"
        let quantity = "Quantity : \(quantity)"
        
        let totalPriceViewModel = TotalPriceViewModel(totalPrice: totalPriceText,
                                                      totalInclTax: totalInclTaxText,
                                                      vat: vatText,
                                                      quantity: quantity)
        view?.set(totalPriceViewModel: totalPriceViewModel)
    }
}
