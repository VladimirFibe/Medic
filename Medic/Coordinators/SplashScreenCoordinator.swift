import Foundation

final class SplashScreenCoordinator: BaseCoordinator {
    private let moduleFactory: ModuleFactoryProtocol
    private let output: SplashScreenOutput?
    init(
        output: SplashScreenOutput,
        router: Routable,
        parent: BaseCoordinator,
        moduleFactory: ModuleFactoryProtocol
    ) {
        self.moduleFactory = moduleFactory
        self.output = output
        super.init(router: router, parent: parent)
    }
}

private extension SplashScreenCoordinator {
    func startModuleSplashScreen() {
        let module = moduleFactory.makeSplashScreenModule(output: self)
        router.setRootModule(module, transition: nil)
    }
}

extension SplashScreenCoordinator: SplashScreenOutput {
    func moduleFinish() {
        output?.moduleFinish()
    }
}

extension SplashScreenCoordinator: Coordinator {
    func start(with option: Void) {
        startModuleSplashScreen()
    }
}
