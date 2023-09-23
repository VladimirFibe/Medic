import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AnyCoordinator<Void>?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let rootController = SystemNavigationController(hideNavigationBar: true)
        window?.rootViewController = rootController
        let appCoordinator = CoordinatorFactory.shared.makeApplicationCoordinator(
            router: ApplicationRouter(rootController: rootController)
        )
        appCoordinator.start()
        self.appCoordinator = appCoordinator
        return true
    }
}

