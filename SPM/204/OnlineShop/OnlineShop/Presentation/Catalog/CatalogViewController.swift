//
//  CatalogViewController.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import UIKit
import Macaroni
import ImageLoader

class CatalogViewController: UIViewController {
    @Injected
    var imageLoader: ImageLoader

    @IBOutlet
    private var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            do {
                let image = try await imageLoader.loadImage("https://i.etsystatic.com/15332298/r/il/da85ac/1935059239/il_fullxfull.1935059239_l0ky.jpg")
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            } catch {
                print("Could not load image: \(error)")
            }
        }
    }
}
