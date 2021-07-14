//
//  ForYouViewController.swift
//  AppleStore
//
//  Created by Vlad on 09.07.2021.
//

import UIKit

final class ForYouViewController: UIViewController {

    //MARK: - Visual components

    private let forYouLabel = UILabel()
    private let underlineView = UIView()
    private let avatarImageView = UIImageView()
    private let whatsNewLabel = UILabel()
    private let orderView = UIView()
    private let itemImageView = UIImageView()
    private let yourOrderShippedLabel = UILabel()
    private let shipmentDetailsLabel = UILabel()
    private let shipmentsDetailsButton = UIButton()
    private let shipmentUnderlineView = UIView()
    private let recomendedForYouLabel = UILabel()
    private let recomendationsImageView = UIImageView()
    private let getMoreInfoLabel = UILabel()
    private let turnOnNotificationLabel = UILabel()
    private let notificationButton = UIButton()
    private let recomendationsUnderlineView = UIView()
    private let yourDevicesLabel = UILabel()
    private let showAllButton = UIButton()
    private let shipmentProgressView = UIProgressView()
    private let processingLabel = UILabel()
    private let shipmentedLabel = UILabel()
    private let deliveredLabel = UILabel()

    //MARK: - UIViewController

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBar()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        restoreTabBar()
    }

    //MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .white

        setupForYouLabel()
        setupUnderlineView()
        setupAvatarImageView()
        setupWhatsNewLabel()
        setupOrderView()
        setupItemImageView()
        setupYourOrderShippedLabel()
        setupShipmentDetailsLabel()
        setupShipmentsDetailsButton()
        setupShipmentUnderlineView()
        setupRecomendedForYouLabel()
        setupRecomendationsImageView()
        setupGetMoreInfoLabel()
        setupTurnOnNotificationLabel()
        setupNotificationButton()
        setupRecomendationsUnderlineView()
        setupYourDevicesLabel()
        setupShowAllButton()
        setupShipmentProgressView()
        setupShipmentLabels()
    }

    private func setupTabBar() {
        tabBarController?.tabBar.barTintColor = UIColor(named: "AppLightGray")
        tabBarController?.tabBar.unselectedItemTintColor = .darkGray
    }

    private func restoreTabBar() {
        tabBarController?.tabBar.barTintColor = .black
        tabBarController?.tabBar.unselectedItemTintColor = .white
    }

    private func setupForYouLabel() {
        forYouLabel.text = "Для вас"
        forYouLabel.font = UIFont.boldSystemFont(ofSize: 30)
        forYouLabel.textColor = .black
        forYouLabel.frame = CGRect(x: 20, y: 100, width: 390, height: 40)
        view.addSubview(forYouLabel)
    }

    private func setupUnderlineView() {
        underlineView.backgroundColor = .systemGray4
        underlineView.frame = CGRect(x: 20, y: 150, width: 390, height: 1)
        view.addSubview(underlineView)
    }

    private func setupAvatarImageView() {
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.clipsToBounds = true
        avatarImageView.frame = CGRect(x: 368, y: 88, width: 45, height: 45)
        avatarImageView.backgroundColor = .systemBlue
        avatarImageView.layer.cornerRadius = 45/2
        view.addSubview(avatarImageView)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseAvatarAction))
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        avatarImageView.isUserInteractionEnabled = true

        guard let data = UserDefaults.standard.value(forKey: "avatar") as? Data else { return }
        guard let image = UIImage(data: data) else { return }
        avatarImageView.image = image
    }

    private func setupWhatsNewLabel() {
        whatsNewLabel.text = "Вот что нового"
        whatsNewLabel.font = UIFont.boldSystemFont(ofSize: 25)
        whatsNewLabel.textColor = .black
        whatsNewLabel.frame = CGRect(x: 20, y: 180, width: 390, height: 30)
        view.addSubview(whatsNewLabel)
    }

    private func setupOrderView() {
        orderView.backgroundColor = .white
        orderView.frame = CGRect(x: 20, y: 250, width: 390, height: 175)
        orderView.layer.cornerRadius = 10
        orderView.layer.shadowColor = UIColor.darkGray.cgColor
        orderView.layer.shadowOpacity = 1
        orderView.layer.shadowRadius = 10
        orderView.layer.shadowOffset = .zero
        view.addSubview(orderView)
    }

    private func setupItemImageView() {
        itemImageView.image = UIImage(named: "airpods")
        itemImageView.frame = CGRect(x: 10, y: 10, width: 75, height: 75)
        itemImageView.contentMode = .scaleAspectFit
        orderView.addSubview(itemImageView)
    }

    private func setupYourOrderShippedLabel() {
        yourOrderShippedLabel.text = "Ваш заказ отправлен"
        yourOrderShippedLabel.font = UIFont.boldSystemFont(ofSize: 18)
        yourOrderShippedLabel.textColor = .black
        yourOrderShippedLabel.frame = CGRect(x: 100, y: 20, width: 200, height: 20)
        orderView.addSubview(yourOrderShippedLabel)
    }

    private func setupShipmentDetailsLabel() {
        shipmentDetailsLabel.text = "1 товар, доставка завтра"
        shipmentDetailsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        shipmentDetailsLabel.textColor = .gray
        shipmentDetailsLabel.frame = CGRect(x: 100, y: 50, width: 200, height: 20)
        orderView.addSubview(shipmentDetailsLabel)
    }

    private func setupShipmentsDetailsButton() {
        shipmentsDetailsButton.setImage(UIImage(systemName: "chevron.right")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        shipmentsDetailsButton.frame = CGRect(x: 350, y: 50, width: 25, height: 25)
        orderView.addSubview(shipmentsDetailsButton)
    }

    private func setupShipmentUnderlineView() {
        shipmentUnderlineView.backgroundColor = .systemGray4
        orderView.addSubview(shipmentUnderlineView)
        shipmentUnderlineView.frame = CGRect(x: 0, y: 100, width: shipmentUnderlineView.superview?.bounds.width ?? 1, height: 1)
    }

    private func setupRecomendedForYouLabel() {
        recomendedForYouLabel.text = "Рекомендуется вам"
        recomendedForYouLabel.font = UIFont.boldSystemFont(ofSize: 23)
        recomendedForYouLabel.textColor = .black
        recomendedForYouLabel.frame = CGRect(x: 20, y: 525, width: 390, height: 30)
        view.addSubview(recomendedForYouLabel)
    }

    private func setupRecomendationsImageView() {
        recomendationsImageView.image = UIImage(systemName: "dot.square")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        recomendationsImageView.contentMode = .scaleAspectFit
        recomendationsImageView.frame = CGRect(x: 40, y: 575, width: 45, height: 45)
        view.addSubview(recomendationsImageView)
    }

    private func setupGetMoreInfoLabel() {
        getMoreInfoLabel.text = "Получайте новости о своем заказе в режиме реального времени."
        getMoreInfoLabel.font = UIFont.boldSystemFont(ofSize: 16)
        getMoreInfoLabel.numberOfLines = 3
        getMoreInfoLabel.adjustsFontSizeToFitWidth = true
        getMoreInfoLabel.frame = CGRect(x: 125, y: 570, width: 250, height: 70)
        view.addSubview(getMoreInfoLabel)
    }

    private func setupTurnOnNotificationLabel() {
        turnOnNotificationLabel.text = "Включите уведомления, чтобы получать новости о своем заказе."
        turnOnNotificationLabel.font = UIFont.systemFont(ofSize: 14)
        turnOnNotificationLabel.textColor = .gray
        turnOnNotificationLabel.numberOfLines = 2
        turnOnNotificationLabel.adjustsFontSizeToFitWidth = true
        turnOnNotificationLabel.frame = CGRect(x: 125, y: 630, width: 250, height: 50)
        view.addSubview(turnOnNotificationLabel)
    }

    private func setupNotificationButton() {
        notificationButton.setImage(UIImage(systemName: "chevron.right")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        notificationButton.frame = CGRect(x: 390, y: 615, width: 25, height: 25)
        view.addSubview(notificationButton)
    }

    private func setupRecomendationsUnderlineView() {
        recomendationsUnderlineView.backgroundColor = .systemGray4
        recomendationsUnderlineView.frame = CGRect(x: 20, y: 700, width: 390, height: 1)
        view.addSubview(recomendationsUnderlineView)
    }

    private func setupYourDevicesLabel() {
        yourDevicesLabel.text = "Ваши устройства"
        yourDevicesLabel.font = UIFont.boldSystemFont(ofSize: 23)
        yourDevicesLabel.textColor = .black
        yourDevicesLabel.frame = CGRect(x: 20, y: 750, width: 200, height: 30)
        view.addSubview(yourDevicesLabel)
    }

    private func setupShowAllButton() {
        showAllButton.setTitle("Показать все", for: .normal)
        showAllButton.setTitleColor(.link, for: .normal)
        showAllButton.frame = CGRect(x: 270, y: 750, width: 150, height: 30)
        view.addSubview(showAllButton)
    }

    private func setupShipmentProgressView() {
        orderView.addSubview(shipmentProgressView)
        shipmentProgressView.frame = CGRect(x: 15, y: 115, width: (shipmentDetailsLabel.superview?.bounds.width ?? 1) - 30, height: 20)
        shipmentProgressView.trackTintColor = .systemGray6
        shipmentProgressView.tintColor = .systemGreen
        shipmentProgressView.progress = 0.5
        shipmentProgressView.transform = shipmentProgressView.transform.scaledBy(x: 1, y: 2)
    }

    private func setupShipmentLabels() {
        processingLabel.text = "Обрабатывается"
        processingLabel.font = UIFont.boldSystemFont(ofSize: 14)
        processingLabel.textColor = .black
        processingLabel.frame = CGRect(x: 15, y: 125, width: 120, height: 20)
        orderView.addSubview(processingLabel)

        shipmentedLabel.text = "Отправлено"
        shipmentedLabel.font = UIFont.boldSystemFont(ofSize: 14)
        shipmentedLabel.textColor = .black
        shipmentedLabel.frame = CGRect(x: 160, y: 125, width: 100, height: 20)
        orderView.addSubview(shipmentedLabel)

        deliveredLabel.text = "Доставлено"
        deliveredLabel.font = UIFont.boldSystemFont(ofSize: 14)
        deliveredLabel.textColor = .gray
        deliveredLabel.frame = CGRect(x: 295, y: 125, width: 100, height: 20)
        orderView.addSubview(deliveredLabel)
    }

    @objc private func chooseAvatarAction(sender: UITapGestureRecognizer) {

        let viewController = UIImagePickerController()
        viewController.sourceType = .photoLibrary
        viewController.allowsEditing = true
        viewController.delegate = self
        present(viewController, animated: true)
    }
}

//MARK: - UINavigationControllerDelegate

extension ForYouViewController: UINavigationControllerDelegate { }

//MARK: - UIImagePickerControllerDelegate

extension ForYouViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {
                print("No image found")
                return
        }
        let newImage = image
        avatarImageView.image = newImage
        guard let data = newImage.pngData() else { return }
        UserDefaults.standard.set(data, forKey: "avatar")
    }
}
