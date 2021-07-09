//
//  MainScreenViewController.swift
//  AppleStore
//
//  Created by Vlad on 09.07.2021.
//

import UIKit

final class MainScreenTabBarViewController: UITabBarController {

    //MARK: - Private properties

    private let buyViewController = BuyViewController()
    private let searchViewController = SearchViewController()
    private let forYouViewController = ForYouViewController()
    private let busketViewController = BusketViewController()
    private lazy var searchNavigationController = UINavigationController(rootViewController: searchViewController)

    //MARK: - UITabBarController

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupControllers()
    }

    //MARK: - Private methods

    private func setupControllers() {
        viewControllers = [buyViewController, forYouViewController, searchNavigationController, busketViewController]
        tabBar.barTintColor = .black
        tabBar.unselectedItemTintColor = .white

        setupBuyViewController()
        setupSearchViewController()
        setupForYouViewController()
        setupBusketViewController()
    }

    private func setupBuyViewController() {
        buyViewController.title = "Купить"
        buyViewController.tabBarItem.image = UIImage(systemName: "laptopcomputer.and.iphone")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        buyViewController.tabBarItem.selectedImage = UIImage(systemName: "laptopcomputer.and.iphone")
    }

    private func setupSearchViewController() {
        searchViewController.title = "Поиск"
        searchViewController.navigationController?.tabBarItem.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        searchViewController.navigationController?.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass")
    }

    private func setupForYouViewController() {
        forYouViewController.title = "Для вас"
        forYouViewController.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        forYouViewController.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")
    }

    private func setupBusketViewController() {
        busketViewController.title = "Корзина"
        busketViewController.tabBarItem.image = UIImage(systemName: "case")
        busketViewController.tabBarItem.selectedImage = UIImage(systemName: "case")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    }

}
