//
//  ViewController.swift
//  AppleStore
//
//  Created by Vlad on 09.07.2021.
//

import UIKit

final class SearchViewController: UIViewController {

    //MARK: - Private properties
    let searchView = SearchView()


    //MARK: - UIViewController

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchView
        searchView.delegate = self
    }

    //MARK: - Private methods

    private func setupNavigation() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - SearchViewDelegate

extension SearchViewController: SearchViewDelegate {
    func openItemsViewController(name: String, imageName: String) {
        let vc = ItemViewController()
        vc.setupItemInfo(itemName: name, itemImageName: imageName)
        navigationController?.pushViewController(vc, animated: true)
    }
}
