//
//  RevenueCatViewController.swift
//  RCTest
//
//  Created by Robin Daugherty on 2020-11-28.
//

import UIKit
import Purchases

class RevenueCatViewController: UIViewController {

    @IBOutlet private weak var priceLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        loadPurchaseProducts()
    }

    private func loadPurchaseProducts() {
        Purchases.shared.offerings { (offerings, error) in
            if let error = error {
                debugPrint("Could not load purchase products: \(error.localizedDescription)")
            }

            guard let offerings = offerings else {
              debugPrint("Error finding offerings")
              return
            }

            var offering: Purchases.Offering? = nil
            if let currentOffering = offerings.offering(identifier: "2020-08") {
                offering = currentOffering
            } else {
                debugPrint("Could not find 2020-08 offerings")
            }

            if let package = offering?.availablePackages.first {
                DispatchQueue.main.async {
                    UIView.performWithoutAnimation {
                        self.priceLabel.text = package.localizedPriceString
                    }
                }
            }
        }
    }

}
