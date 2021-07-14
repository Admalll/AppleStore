//
//  OnboardingPageViewController.swift
//  AppleStore
//
//  Created by Vlad on 14.07.2021.
//

import UIKit

final class OnboardingPageViewController: UIViewController {

    //MARK: - Visual components

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let onboardImageView = UIImageView()
    private let skipButton = UIButton()
    private let nextButton = UIButton()
    private let getStartedButton = UIButton()

    //MARK: - Open properties

    var page: Pages

    //MARK: - Initializators

    init(with page: Pages) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    //MARK: - Private methods

    private func setupView() {
        setupTitleLabel()
        setupDescriptionLabel()
        setupOnboardImageView()
        setupSkipButton()
        setupNextButton()
        setupGetStartedButton()
    }

    private func setupTitleLabel() {
        titleLabel.frame = CGRect(x: 80, y: 600, width: 270, height: 40)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.text = page.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(titleLabel)
    }

    private func setupDescriptionLabel() {
        descriptionLabel.frame = CGRect(x: 50, y: 635, width: 330, height: 60)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = page.description
        descriptionLabel.textColor = .systemGray4
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(descriptionLabel)
    }

    private func setupOnboardImageView() {
        onboardImageView.image = UIImage(named: page.imageName)
        onboardImageView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 400)
        onboardImageView.contentMode = .scaleToFill
        view.addSubview(onboardImageView)
    }

    private func setupSkipButton() {
        switch page.index {
        case 0,1 :
            skipButton.setTitle("SKIP", for: .normal)
            skipButton.frame = CGRect(x: 40, y: 725, width: 100, height: 30)
            skipButton.setTitleColor(.black, for: .normal)
            skipButton.addTarget(self, action: #selector(openNextController), for: .touchUpInside)
            view.addSubview(skipButton)
        default:
            break
        }
    }

    private func setupNextButton() {
        switch page.index {
        case 0, 1:
            nextButton.setTitle("NEXT", for: .normal)
            nextButton.frame = CGRect(x: 300, y: 725, width: 100, height: 30)
            nextButton.setTitleColor(.systemBlue , for: .normal)
            view.addSubview(nextButton)
        default:
            break
        }
    }

    private func setupGetStartedButton() {
        switch page.index {
        case 2:
            getStartedButton.setTitle("GET STARTED!", for: .normal)
            getStartedButton.setTitleColor(.systemBlue, for: .normal)
            getStartedButton.frame = CGRect(x: 135, y: 725, width: 150, height: 30)
            getStartedButton.addTarget(self, action: #selector(openNextController), for: .touchUpInside)
            view.addSubview(getStartedButton)
        default:
            break
        }
    }

    @objc private func openNextController() {
        dismiss(animated: true)
    }
}
