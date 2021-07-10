//
//  ItemViewController.swift
//  AppleStore
//
//  Created by Vlad on 09.07.2021.
//

import UIKit

final class ItemViewController: UIViewController {

    //MARK: - Visual components
    private let itemImageView = UIImageView()
    private let itemLabel = UILabel()

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Public methods

    func setupItemInfo(itemName: String, itemImageName: String) {
        itemImageView.image = UIImage(named: itemImageName)
        itemLabel.text = itemName
    }

    //MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .black

        setupItemImageView()
        setupItemLabel()
    }

    private func setupItemImageView() {
        view.addSubview(itemImageView)
        itemImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        itemImageView.center = view.center
        itemImageView.contentMode = .scaleAspectFit
    }

    private func setupItemLabel() {
        view.addSubview(itemLabel)
        itemLabel.frame = CGRect(x: 100, y: 175, width: 250, height: 150)
        itemLabel.numberOfLines = 0
        itemLabel.adjustsFontForContentSizeCategory = true
        itemLabel.font = UIFont.boldSystemFont(ofSize: 25)
        itemLabel.textColor = .white
    }
}
