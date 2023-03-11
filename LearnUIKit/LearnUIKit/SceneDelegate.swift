//
//  SceneDelegate.swift
//  LearnUIKit
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private lazy var bookStorage = BookStorage()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let rootController = initControllers()
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
    
    private func initControllers() -> UIViewController {
        let tabbar = UITabBarController()
        tabbar.tabBar.backgroundColor = .white
        
        guard let book = bookStorage.books.first?.value else { return tabbar }
        let vc = ControllerFactory.generateController(book, title: "Test0", changeHandler: bookStorage.changeBook)
        bookStorage.addObserver(WeakObserverBoxStorage(vc))
        let vc2 = ControllerFactory.generateController(book, title: "Test2", color: .lightGray, changeHandler: bookStorage.changeBook)
        bookStorage.addObserver(WeakObserverBoxStorage(vc2))
        
        let nextVc = NextViewController()
        let nextNavigationController = UINavigationController(rootViewController: nextVc)
        nextNavigationController.tabBarItem.title = "Next"
        nextVc.navigate = { [weak nextNavigationController] in
            let vc3 = ControllerFactory.generateController(book, title: "Next3", changeHandler: self.bookStorage.changeBook)
            self.bookStorage.addObserver(WeakObserverBoxStorage(vc3))
            nextNavigationController?.pushViewController(vc3, animated: true)
        }
        tabbar.setViewControllers([vc, vc2, nextNavigationController], animated: false)
        return tabbar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

