import Foundation

/// Координатор приложения
final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactoryProtocol

    init(
        router: Routable,
        coordinatorFactory: CoordinatorFactoryProtocol
    ) {
        self.coordinatorFactory = coordinatorFactory
        super.init(router: router)
    }
}

extension ApplicationCoordinator: Coordinator {
    func start(with option: Void) {
        startSplashScreenCoordinator()
    }
}

private extension ApplicationCoordinator {
    func startSplashScreenCoordinator() {
        let coordinator = coordinatorFactory.makeSplashScreenCoordinator(output: self, router: router)
        coordinator.start()
    }
}

extension ApplicationCoordinator: SplashScreenOutput {
    func moduleFinish() {
        print("ApplicationCoordinator должен запустить онбординг")
    }
}
