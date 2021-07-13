//
//  ItemViewController.swift
//  AppleStore
//
//  Created by Vlad on 09.07.2021.
//

import UIKit

final class ItemViewController: UIViewController {

    //MARK: - Visual components
    private let itemImagesScrollView = UIScrollView()
    private let firstItemImageView = UIImageView()
    private let secondItemImageView = UIImageView()
    private let thirdItemImageView = UIImageView()
    private let itemLabel = UILabel()
    private let shipmentOptionsLabel = UILabel()
    private let shipmentDateLabel = UILabel()
    private let shipmentAddressLabel = UILabel()
    private let addToBusketButton = UIButton()
    private let shipmentImageView = UIImageView()
    private let approveStatusImageView = UIImageView()
    private let compatableLabel = UILabel()
    private let compatableDeviceLabel = UILabel()
    private let grayColorButton = UIButton()
    private let darkGrayColorButton = UIButton()
    private let itemPriceLabel = UILabel()

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Public methods

    func setupItemInfo(itemName: String, firstItemImageName: String, secondItemImageName: String, thirdItemImageName: String) {
        firstItemImageView.image = UIImage(named: firstItemImageName)
        secondItemImageView.image = UIImage(named: secondItemImageName)
        thirdItemImageView.image = UIImage(named: thirdItemImageName)
        itemLabel.text = itemName
    }

    //MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .black

        setupFirstItemImageView()
        setupSecondItemImageView()
        setupThirdItemImageView()
        setupItemLabel()
        setupNavigationBar()
        setupShipmentOptionsLabel()
        setupShipmentDateLabel()
        setupShipmentAddressLabel()
        setupShipmentImageView()
        setupAddToBusketButton()
        setupApproveStatusImageView()
        setupCompatableLabel()
        setupCompatableDeviceLabel()
        setupGrayColorButton()
        setupDarkGrayColorButton()
        setupItemPriceLabel()
        setupItemImagesScrollView()
    }

    private func setupItemImagesScrollView() {
        view.addSubview(itemImagesScrollView)
        itemImagesScrollView.frame = CGRect(x: 90, y: 200, width: 250, height: 250)
        itemImagesScrollView.contentMode = .scaleAspectFit
        itemImagesScrollView.contentSize = CGSize(width: 770, height: 250)
        itemImagesScrollView.showsHorizontalScrollIndicator = false
        itemImagesScrollView.isPagingEnabled = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(itemImageTap))
        itemImagesScrollView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func setupFirstItemImageView() {
        firstItemImageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        itemImagesScrollView.addSubview(firstItemImageView)
        firstItemImageView.contentMode = .scaleAspectFit
    }

    private func setupSecondItemImageView() {
        secondItemImageView.frame = CGRect(x: 260, y: 0, width: 250, height: 250)
        itemImagesScrollView.addSubview(secondItemImageView)
        secondItemImageView.contentMode = .scaleAspectFit
    }

    private func setupThirdItemImageView() {
        thirdItemImageView.frame = CGRect(x: 520, y: 0, width: 250, height: 250)
        itemImagesScrollView.addSubview(thirdItemImageView)
        thirdItemImageView.contentMode = .scaleAspectFit
    }

    private func setupNavigationBar() {
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: nil), UIBarButtonItem(image: UIImage(systemName: "suit.heart"), style: .plain, target: self, action: nil)]
        navigationController?.navigationBar.tintColor = .link
    }

    private func setupItemLabel() {
        view.addSubview(itemLabel)
        itemLabel.frame = CGRect(x: 20, y: 125, width: 390, height: 20)
        itemLabel.numberOfLines = 0
        itemLabel.adjustsFontSizeToFitWidth = true
        itemLabel.font = UIFont.boldSystemFont(ofSize: 17)
        itemLabel.textColor = .white
        itemLabel.textAlignment = .center
    }

    private func setupShipmentOptionsLabel() {
        shipmentOptionsLabel.text = "Заказ сегодня в течение дня, доставка:"
        shipmentOptionsLabel.textColor = .white
        shipmentOptionsLabel.font = UIFont.boldSystemFont(ofSize: 13)
        shipmentOptionsLabel.frame = CGRect(x: 60, y: 750, width: 340, height: 20)
        view.addSubview(shipmentOptionsLabel)
    }

    private func setupShipmentDateLabel() {
        shipmentDateLabel.text = "Чт 25 Фев – Бесплатно"
        shipmentDateLabel.textColor = .lightGray
        shipmentDateLabel.font = UIFont.boldSystemFont(ofSize: 13)
        shipmentDateLabel.frame = CGRect(x: 60, y: 770, width: 340, height: 20)
        view.addSubview(shipmentDateLabel)
    }

    private func setupShipmentAddressLabel() {
        shipmentAddressLabel.text = "Варианты доставки для местоположения: 115533"
        shipmentAddressLabel.font = UIFont.boldSystemFont(ofSize: 13)
        shipmentAddressLabel.textColor = .link
        shipmentAddressLabel.frame = CGRect(x: 60, y: 790, width: 340, height: 20)
        view.addSubview(shipmentAddressLabel)
    }

    private func setupShipmentImageView() {
        shipmentImageView.image = UIImage(systemName: "shippingbox")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        shipmentImageView.frame = CGRect(x: 20, y: 750, width: 25, height: 25)
        view.addSubview(shipmentImageView)
    }

    private func setupAddToBusketButton() {
        addToBusketButton.setTitle("Добавить в корзину", for: .normal)
        addToBusketButton.backgroundColor = .link
        addToBusketButton.setTitleColor(.white, for: .normal)
        addToBusketButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        addToBusketButton.layer.cornerRadius = 5
        addToBusketButton.frame = CGRect(x: 20, y: 680, width: 390, height: 35)
        view.addSubview(addToBusketButton)
    }

    private func setupApproveStatusImageView() {
        approveStatusImageView.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal)
        approveStatusImageView.frame = CGRect(x: 50, y: 620, width: 20, height: 20)
        view.addSubview(approveStatusImageView)
    }

    private func setupCompatableLabel() {
        compatableLabel.text = "Совместимо с"
        compatableLabel.font = UIFont.boldSystemFont(ofSize: 13)
        compatableLabel.textColor = .lightGray
        compatableLabel.frame = CGRect(x: 80, y: 620, width: 100, height: 20)
        view.addSubview(compatableLabel)
    }

    private func setupCompatableDeviceLabel() {
        compatableDeviceLabel.text = "MacBook Pro – Евгений"
        compatableDeviceLabel.font = UIFont.boldSystemFont(ofSize: 13)
        compatableDeviceLabel.textColor = .link
        compatableDeviceLabel.frame = CGRect(x: 180, y: 620, width: 200, height: 20)
        view.addSubview(compatableDeviceLabel)
    }

    private func setupGrayColorButton() {
        grayColorButton.backgroundColor = .gray
        grayColorButton.frame = CGRect(x: 170, y: 560, width: 30, height: 30)
        grayColorButton.layer.cornerRadius = 15
        view.addSubview(grayColorButton)
    }

    private func setupDarkGrayColorButton() {
        darkGrayColorButton.backgroundColor = .darkGray
        darkGrayColorButton.frame = CGRect(x: 210, y: 560, width: 30, height: 30)
        darkGrayColorButton.layer.cornerRadius = 15
        darkGrayColorButton.layer.borderWidth = 2
        darkGrayColorButton.layer.borderColor = UIColor.blue.cgColor
        view.addSubview(darkGrayColorButton)
    }

    private func setupItemPriceLabel() {
        itemPriceLabel.text = "3 990.00 руб."
        itemPriceLabel.textColor = .gray
        itemPriceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        itemPriceLabel.frame = CGRect(x: 150, y: 150, width: 150, height: 20)
        view.addSubview(itemPriceLabel)
    }

    @objc private func itemImageTap() {
        let viewController = ItemWebViewViewController()
        viewController.itemName = itemLabel.text
        present(viewController, animated: true, completion: nil)
    }
}
