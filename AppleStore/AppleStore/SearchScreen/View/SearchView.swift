//
//  SearchView.swift
//  AppleStore
//
//  Created by Vlad on 09.07.2021.
//

import UIKit

final class SearchView: UIView {

    //MARK: - Visual components

    private let searchView = UIView()
    private let recentlyLabel = UILabel()
    private let clearRecentlyButton = UIButton()

    //MARK: - Initializators

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private methods

    private func setupView() {
        backgroundColor = .black

        setupSearchTextField()
        setupRecentlyLabel()
        setupClearRecentlyButton()
    }

    private func setupSearchTextField() {
        addSubview(searchView)
        searchView.frame = CGRect(x: 20, y: 150, width: 380, height: 30)
        searchView.backgroundColor = .darkGray
        searchView.layer.cornerRadius = 5

        let searchImageView = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal))
        searchView.addSubview(searchImageView)
        searchImageView.frame = CGRect(x: 10, y: 5, width: 20, height: 20)

        let searchLabel = UILabel()
        searchLabel.text = "Поиск по продуктам и магазинам"
        searchLabel.textColor = .lightGray
        searchView.addSubview(searchLabel)
        searchLabel.frame = CGRect(x: 40, y: 5, width: 300, height: 20)
    }

    private func setupRecentlyLabel() {
        addSubview(recentlyLabel)
        recentlyLabel.text = "Недавно просмотренные"
        recentlyLabel.frame = CGRect(x: 20, y: 250, width: 300, height: 30)
        recentlyLabel.font = UIFont.boldSystemFont(ofSize: 21)
        recentlyLabel.textColor = .white
    }

    private func setupClearRecentlyButton() {
        addSubview(clearRecentlyButton)
        clearRecentlyButton.setTitle("Очистить", for: .normal)
        clearRecentlyButton.frame = CGRect(x: 300, y: 251, width: 100, height: 30)
        clearRecentlyButton.setTitleColor(.link, for: .normal)
    }
}
