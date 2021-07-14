//
//  OnboardingViewController.swift
//  AppleStore
//
//  Created by Vlad on 14.07.2021.
//

import UIKit

final class OnboardingViewController: UIViewController {

    //MARK: - Private properties

    var pageViewController: UIPageViewController?
    private var pages: [Pages] = Pages.allCases
    private var currentIndex = 0

    //MARK: - UIViewController

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    //MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .white
        setupPageViewController()
    }

    private func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController?.dataSource = self
        pageViewController?.delegate = self
        pageViewController?.view.backgroundColor = .clear
        pageViewController?.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 150)
        for item in pageViewController?.view?.subviews ?? [] {
            if item is UIPageControl{
                (item as! UIPageControl).pageIndicatorTintColor = .systemGray6
                (item as! UIPageControl).currentPageIndicatorTintColor = .link
                break
            }
        }
        guard let pageViewController = pageViewController else { return }
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        let initialVC = OnboardingPageViewController(with: pages[0])
        pageViewController.setViewControllers([initialVC], direction: .forward, animated: true)
        pageViewController.didMove(toParent: self)
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let currentVC = viewController as? OnboardingPageViewController else {
            return nil
        }

        var index = currentVC.page.index

        if index == 0 {
            return nil
        }

        index -= 1

        let vc = OnboardingPageViewController(with: pages[index])

        return vc
    }


    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? OnboardingPageViewController else {
            return nil
        }

        var index = currentVC.page.index

        if index >= self.pages.count - 1 {
            return nil
        }

        index += 1

        let vc = OnboardingPageViewController(with: pages[index])

        return vc
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
}

extension OnboardingViewController: UIPageViewControllerDelegate { }

extension UIPageViewController {
    var pageControl: UIPageControl? {
        for view in view.subviews {
            if view is UIPageControl {
                return view as? UIPageControl
            }
        }
    return nil
    }
}
