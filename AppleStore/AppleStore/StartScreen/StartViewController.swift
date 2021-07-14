//
//  StartViewController.swift
//  AppleStore
//
//  Created by Vlad on 14.07.2021.
//

import UIKit

final class StartViewController: UIViewController {

    //MARK: - Visual components

    private let loadingProgressView = UIProgressView()
    private let loadingImageView = UIImageView()
    private var timer = Timer()

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    //MARK: - Private methods

    private func setupView() {

        view.backgroundColor = .white

        setupLoadingProgressView()
        setupLoadingImageView()
        setupTimer()
    }

    private func setupLoadingProgressView() {
        loadingProgressView.frame = CGRect(x: 20, y: 600, width: 390, height: 10)
        loadingProgressView.transform = loadingProgressView.transform.scaledBy(x: 1, y: 2)
        loadingProgressView.progressTintColor = .green
        loadingProgressView.tintColor = .systemGray6
        loadingProgressView.progress = 0.0
        view.addSubview(loadingProgressView)
    }

    private func setupLoadingImageView() {
        loadingImageView.image = UIImage(named: "walls")
        loadingImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 500)
        view.addSubview(loadingImageView)
        loadingImageView.alpha = 0
        loadingImageView.contentMode = .scaleAspectFit
    }

    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(loadStartScreen), userInfo: nil, repeats: true)
    }

    @objc private func loadStartScreen() {
        loadingImageView.alpha += 0.1
        loadingProgressView.progress += 0.1
        if loadingProgressView.progress == 1.0 {
            timer.invalidate()
            let mainTabBarController = MainScreenTabBarViewController()
            mainTabBarController.modalPresentationStyle = .fullScreen
            present(mainTabBarController, animated: true, completion: nil)
        }
    }
}
