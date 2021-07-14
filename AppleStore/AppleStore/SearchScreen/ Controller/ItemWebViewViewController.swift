//
//  ItemWebViewViewController.swift
//  AppleStore
//
//  Created by Vlad on 13.07.2021.
//

import UIKit
import WebKit

enum Const {
    static let caseGray = "https://www.apple.com/ru/macbook-pro-16/"
    static let iphone = "https://www.apple.com/ru/iphone/"
    static let caseBrown = "https://www.apple.com/ru/shop/product/MRQM2ZM/A/%D0%BA%D0%BE%D0%B6%D0%B0%D0%BD%D1%8B%D0%B9-%D1%87%D0%B5%D1%85%D0%BE%D0%BB-%D0%B4%D0%BB%D1%8F-13%E2%80%91%D0%B4%D1%8E%D0%B9%D0%BC%D0%BE%D0%B2%D1%8B%D1%85-macbook-air-%D0%B8-macbook-pro-%D0%B7%D0%BE%D0%BB%D0%BE%D1%82%D0%B8%D1%81%D1%82%D0%BE%E2%80%91%D0%BA%D0%BE%D1%80%D0%B8%D1%87%D0%BD%D0%B5%D0%B2%D1%8B%D0%B9-%D1%86%D0%B2%D0%B5%D1%82?fnode=0d6062b669ad91588d35d0aabb4627d1b0062b9755451111cdb2f226be3f9cad8d9af0b663de62dcdc9b09e8e7ed9559537052afd7f5ecb12f5cde293ff03c22f633d51e25597a15d7c850150b34735f44bfadea22ee3af4350f2c395993f72855313d85d98a7f74595a87e66ffdf7ee"
    static let belt = "https://www.apple.com/ru/shop/watch/bands/%D1%81%D0%BF%D0%BE%D1%80%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9-%D1%80%D0%B5%D0%BC%D0%B5%D1%88%D0%BE%D0%BA"
    static let caseItemName = "Чехол Incase Flat для MacBook pro 16 дюймов"
    static let iphoneItemName = "iPhone 12 Pro Max 256 GB"
    static let caseBownItemName = "Кожаный чехол для MacBook Pro 16 дюймов, золотой"
    static let beltItemName = "Спортивный ремешок Black Unity (для к..."
}

final class ItemWebViewViewController: UIViewController {

    //MARK: - Visual components

    private let webView = WKWebView()
    private var goBackItem = UIBarButtonItem()
    private var goForwardItem = UIBarButtonItem()
    private let activityIndicator = UIActivityIndicatorView()

    //MARK: - Private properties
    private var currentURL: URL?
    var itemName: String?

    //MARK: - UIViewController

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        view = webView

        setupWebView()
        setupToolBar()
        setupActivityIndicator()
    }

    private func setupWebView() {
        webView.navigationDelegate = self

        switch itemName {
        case Const.caseItemName:
            setupUrl(string: Const.caseGray)
        case Const.beltItemName:
            setupUrl(string: Const.belt)
        case Const.caseBownItemName:
            setupUrl(string: Const.caseBrown)
        case Const.iphoneItemName:
            setupUrl(string: Const.iphone)
        default:
            break
        }
    }

    private func setupUrl(string: String) {
        if let url = URL(string: string) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    private func setupToolBar() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        goBackItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(goBack))
        goForwardItem = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(goForward))
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(refreshPage))
        let shareItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareAction))
        let fixedSpaceItem = UIBarButtonItem(systemItem: .fixedSpace)
        let flexibleSpaceItem = UIBarButtonItem(systemItem: .flexibleSpace)
        fixedSpaceItem.width = 20
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: screenHeight - 115, width: screenWidth, height: 44))
        toolBar.barTintColor = .darkGray
        toolBar.isTranslucent = false
        toolBar.items = [goBackItem, fixedSpaceItem, goForwardItem, flexibleSpaceItem, refreshItem, fixedSpaceItem, shareItem]
        webView.addSubview(toolBar)
    }

    private func setupActivityIndicator() {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.center = webView.center
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        webView.addSubview(activityIndicator)

    }

    private func showActivityIndicator(show: Bool) {
        show ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }

    private func setupBarButtonNavigationItems() {
        goBackItem.isEnabled = webView.canGoBack
        goForwardItem.isEnabled = webView.canGoForward
    }

    @objc private func goBack() {
        webView.canGoBack ? webView.goBack() : nil
    }

    @objc private func goForward() {
        webView.canGoForward ? webView.goForward() : nil
    }

    @objc private func refreshPage() {
        webView.reload()
    }

    @objc private func shareAction() {
        if let sharingStringUrl = currentURL?.absoluteString {
            let sharingController = UIActivityViewController(activityItems: [sharingStringUrl], applicationActivities: nil)
            present(sharingController, animated: true, completion: nil)
        }
    }
}

//MARK: - WKNavigationDelegate

extension ItemWebViewViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
        setupBarButtonNavigationItems()
        currentURL = webView.url

    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        setupBarButtonNavigationItems()
        setupActivityIndicator()
        showActivityIndicator(show: true)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
        setupBarButtonNavigationItems()
    }
}
