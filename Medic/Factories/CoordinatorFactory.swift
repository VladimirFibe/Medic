import Foundation

protocol CoordinatorFactoryProtocol: AnyObject {
    func makeApplicationCoordinator(router: Routable) -> AnyCoordinator<Void>
    func makeSplashScreenCoordinator(
        output: SplashScreenOutput & BaseCoordinator,
        router: Routable
    ) -> AnyCoordinator<Void>
}
final class CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeSplashScreenCoordinator(
        output: BaseCoordinator & SplashScreenOutput,
        router: Routable
    ) -> AnyCoordinator<Void> {
        AnyCoordinator(SplashScreenCoordinator(
            output: output,
            router: router,
            parent: output,
            moduleFactory: ModuleFactory.shared
        ) )
    }
    

    static let shared = CoordinatorFactory()
    private init() {}

    func makeApplicationCoordinator(router: Routable) -> AnyCoordinator<Void> {
        AnyCoordinator(ApplicationCoordinator(
            router: router,
            coordinatorFactory: self
        ))
    }

//    func makeSplashScreenCoordinator(output: BaseCoordinator & SplashScreenOutput, router: Routable) -> AnyCoordinator<Void> {
//        AnyCoordinator(SplashScreenCoordinator(moduleFactory: ModuleFactory.shared, router: router, parent: output)
//        )
//    }
}
