//
//  ErrorHandle.swift
//  SplashBookAG
//
//  Created by Alexander on 15.11.2023.
//

import Foundation


enum MachineErrors: Error {
    case missingName
    case priceFail(coinsNeeded: Int)
    case outOfStock
}

struct Item2 {
    var price: Int
    var count : Int
}

class VendingBar {
    var items = [
        "Twix": Item2(price: 10, count: 2),
        "Nuts": Item2(price: 3, count: 3),
        "Cola": Item2(price: 9, count: 100)
    ]
    
    private var deposit: Int = 0
    
    func addCoins(_ coins: Int) {
        deposit += coins
    }
    
    func getItem(named itemName: String, count: Int) throws {
        
        guard let item = items[itemName] else {
            throw MachineErrors.missingName
        }
        
        guard item.count > 0 else {
            throw MachineErrors.outOfStock
        }
        
        guard item.price >= deposit else {
            throw MachineErrors.priceFail(coinsNeeded: deposit - item.price)
        }
        
        deposit -= item.price
        var newItem = item
        items[itemName]!.count -= count
        print(items[itemName])
    }
}


let favoriteSnacks = [
    "Alice": "Twix",
    "Trevor": "Nuts"
]


