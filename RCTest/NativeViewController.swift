//
//  NativeViewController.swift
//  RCTest
//
//  Created by Robin Daugherty on 12/2/20.
//

import UIKit
import StoreKit

class NativeViewController: UIViewController {

    @IBOutlet private weak var priceLabel: UILabel!

    private var request: SKProductsRequest!

    private var products = [SKProduct]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        loadPurchaseProducts()
    }

    private func loadPurchaseProducts() {
        let productIdentifiers = Set(arrayLiteral: "dog.harper.subscription.monthly202008")

        request = SKProductsRequest(productIdentifiers: productIdentifiers)
        request.delegate = self
        request.start()
    }

    private func displayStore(_ products: [SKProduct]) {
        guard let product = products.first else { return }

        DispatchQueue.main.async {
            self.priceLabel.text = "\(product.priceLocale.currencySymbol ?? "")\(product.price.stringValue)"
        }
    }

}

extension NativeViewController: SKProductsRequestDelegate {

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if !response.products.isEmpty {
           products = response.products
           // Custom method.
           displayStore(products)
        }
    }

}
