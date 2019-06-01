//
//  CandyAPIWorker.swift
//  ViperDemoProject
//
//  Created by Saad El Oulladi on 15/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Foundation

protocol CandyAPIWorkerProtocol {
    func fetchCandy(callBack:(CandyEntity) -> Void)
}

class CandyAPIWorker : CandyAPIWorkerProtocol {

    func fetchCandy(callBack:(CandyEntity) -> Void) {
        let candyEntity = CandyEntity(title: "Magic Candy",
                                      description: "Magic candies coming from heaven, if you eat one and say a wish. Your wish will be granted.",
                                      price: 100,
                                      imageName: "magic_candy")
        callBack(candyEntity)
    }
}
