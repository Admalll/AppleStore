//
//  SearchView.swift
//  AppleStore
//
//  Created by Vlad on 09.07.2021.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    func openItemsViewController(name: String, firstImageName: String, secondImageName: String, thirdImageName: String)
}

final class SearchView: UIView {

    //MARK: - Visual components

    private let searchView = UIView()
    private let recentlyLabel = UILabel()
    private let clearRecentlyButton = UIButton()
    private let firstItemView = UIView()
    private let secondItemView = UIView()
    private let thirdItemView = UIView()
    private let fourthItemView = UIView()
    private let examplesRequestsLabel = UILabel()
    private var firstExampleView = UIView()
    private var secondExampleView = UIView()
    private var thirdExampleView = UIView()
    private var fourthExampleView = UIView()
    private let itemsScrollView = UIScrollView()

    //MARK: - Private properties
    weak var delegate: SearchViewDelegate?
    private var itemsInfoDictionary = [(name: "Чехол Incase Flat для MacBook pro 16 дюймов",
                                        firstImageName: "case",
                                        secondImageName: "case2",
                                        thirdImageName: "case3"),
                                       (name: "Спортивный ремешок Black Unity (для к...",
                                                                           firstImageName: "belt",
                                                                           secondImageName: "belt2",
                                                                           thirdImageName: "belt3"),
                                       (name: "Кожаный чехол для MacBook Pro 16 дюймов, золотой",
                                                                           firstImageName: "caseBown",
                                                                           secondImageName: "caseBown2",
                                                                           thirdImageName: "caseBown3"),
                                       (name: "iPhone 12 Pro Max 256 GB",
                                                                           firstImageName: "iphone",
                                                                           secondImageName: "iphone2",
                                                                           thirdImageName: "iphone3")
    ]

    //MARK: - Initializators

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupView()
    }

    //MARK: - Private methods

    private func setupView() {
        backgroundColor = .black

        setupSearchTextField()
        setupRecentlyLabel()
        setupClearRecentlyButton()
        setupFirstItemView()
        setupSecondItemView()
        setupThirdItemView()
        setupFourthItemView()
        setupExamplesRequestsLabel()
        setupFirstExampleView()
        setupSecondExampleView()
        setupThirdExampleView()
        setupFourthExampleView()
        setupItemsScrollView()
    }

    private func setupItemsScrollView() {
        addSubview(itemsScrollView)
        itemsScrollView.frame = CGRect(x: 20, y: 300, width: 390, height: 200)
        itemsScrollView.isPagingEnabled = false
        itemsScrollView.contentSize = CGSize(width: 600, height: 200)
        itemsScrollView.showsHorizontalScrollIndicator = false
    }

    private func setupSearchTextField() {
        addSubview(searchView)
        searchView.frame = CGRect(x: 20, y: 150, width: 380, height: 30)
        searchView.backgroundColor = UIColor(named: "AppGray")
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

    private func setupFirstItemView() {
        firstItemView.frame = CGRect(x: 0, y: 0, width: 150, height: 200)
        firstItemView.backgroundColor = UIColor(named: "AppGray")
        firstItemView.layer.cornerRadius = 10
        createImageForItem(imageName: itemsInfoDictionary[0].firstImageName, itemView: firstItemView, width: 100, aligmentX: 0)
        createLabelForItem(text: itemsInfoDictionary[0].name, itemView: firstItemView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openItemDetails(sender:)))
        firstItemView.isUserInteractionEnabled = true
        firstItemView.addGestureRecognizer(tapGestureRecognizer)
        itemsScrollView.addSubview(firstItemView)
        firstItemView.tag = 0
    }

    private func setupSecondItemView() {
        secondItemView.frame = CGRect(x: 160, y: 0, width: 150, height: 200)
        secondItemView.backgroundColor = UIColor(named: "AppGray")
        secondItemView.layer.cornerRadius = 10
        createImageForItem(imageName: itemsInfoDictionary[1].firstImageName, itemView: secondItemView, width: 30, aligmentX: 40)
        createLabelForItem(text: itemsInfoDictionary[1].name, itemView: secondItemView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openItemDetails(sender:)))
        secondItemView.isUserInteractionEnabled = true
        secondItemView.addGestureRecognizer(tapGestureRecognizer)
        itemsScrollView.addSubview(secondItemView)
        secondItemView.tag = 1
    }

    private func setupThirdItemView() {
        thirdItemView.frame = CGRect(x: 320, y: 0, width: 150, height: 200)
        thirdItemView.backgroundColor = UIColor(named: "AppGray")
        thirdItemView.layer.cornerRadius = 10
        createImageForItem(imageName: itemsInfoDictionary[2].firstImageName, itemView: thirdItemView, width: 100, aligmentX: 0)
        createLabelForItem(text: itemsInfoDictionary[2].name, itemView: thirdItemView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openItemDetails(sender:)))
        thirdItemView.isUserInteractionEnabled = true
        thirdItemView.addGestureRecognizer(tapGestureRecognizer)
        itemsScrollView.addSubview(thirdItemView)
        thirdItemView.tag = 2
    }

    private func setupFourthItemView() {
        fourthItemView.frame = CGRect(x: 480, y: 0, width: 150, height: 200)
        fourthItemView.backgroundColor = UIColor(named: "AppGray")
        fourthItemView.layer.cornerRadius = 10
        createImageForItem(imageName: itemsInfoDictionary[3].firstImageName, itemView: fourthItemView, width: 100, aligmentX: 0)
        createLabelForItem(text: itemsInfoDictionary[3].name, itemView: fourthItemView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openItemDetails(sender:)))
        fourthItemView.isUserInteractionEnabled = true
        fourthItemView.addGestureRecognizer(tapGestureRecognizer)
        itemsScrollView.addSubview(fourthItemView)
        fourthItemView.tag = 3
    }

    private func createImageForItem(imageName: String, itemView: UIView, width: Int, aligmentX: Int) {

        let imageView = UIImageView(image: UIImage(named: imageName))
        itemView.addSubview(imageView)
        imageView.frame = CGRect(x: 20 + aligmentX, y: 30, width: width, height: 75)
    }

    private func createLabelForItem(text: String, itemView: UIView) {
        let label = UILabel()
        label.text = text
        itemView.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 14)
        label.frame = CGRect(x: 10, y: 120, width: 130, height: 80)
        label.textColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
    }

    private func setupExamplesRequestsLabel() {
        addSubview(examplesRequestsLabel)
        examplesRequestsLabel.text = "Варианты запросов"
        examplesRequestsLabel.font = UIFont.boldSystemFont(ofSize: 21)
        examplesRequestsLabel.textColor = .white
        examplesRequestsLabel.frame = CGRect(x: 20, y: 550, width: 300, height: 30)
    }

    private func createExampleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }

    private func createExampleView(text: String) -> UIView {
        let view = UIView()

        let imageView = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal))
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 20, width: 20, height: 20)

        let viewUnderline = UIView()
        viewUnderline.backgroundColor = UIColor(named: "AppGray")

        view.addSubview(viewUnderline)
        viewUnderline.frame = CGRect(x: 0, y: 50, width: 390, height: 1)

        let label = createExampleLabel(text: text)
        view.addSubview(label)
        label.frame = CGRect(x: 40, y: 20, width: 200, height: 20)

        return view
    }

    private func setupFirstExampleView() {
        firstExampleView = createExampleView(text: "AirPods")
        addSubview(firstExampleView)
        firstExampleView.frame = CGRect(x: 20, y: 580, width: 390, height: 50)
    }

    private func setupSecondExampleView() {
        secondExampleView = createExampleView(text: "AppleCare")
        addSubview(secondExampleView)
        secondExampleView.frame = CGRect(x: 20, y: 630, width: 390, height: 50)
    }

    private func setupThirdExampleView() {
        thirdExampleView = createExampleView(text: "Beats")
        addSubview(thirdExampleView)
        thirdExampleView.frame = CGRect(x: 20, y: 680, width: 390, height: 50)
    }

    private func setupFourthExampleView() {
        fourthExampleView = createExampleView(text: "Сравните модели iPhone")
        addSubview(fourthExampleView)
        fourthExampleView.frame = CGRect(x: 20, y: 730, width: 390, height: 50)
    }

    @objc private func openItemDetails(sender: UITapGestureRecognizer) {
        guard let index = sender.view?.tag else { return }
        let itemInfo = itemsInfoDictionary[index]
        delegate?.openItemsViewController(name: itemInfo.name, firstImageName: itemInfo.firstImageName, secondImageName: itemInfo.secondImageName, thirdImageName: itemInfo.thirdImageName)
    }
}
