//
//  SceneDelegate.swift
//  AppleStore
//
//  Created by Vlad on 09.07.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window?.windowScene = scene

        let mainTabBarController = MainScreenTabBarViewController()

        window?.rootViewController = mainTabBarController
        window?.makeKeyAndVisible()
    }
}
