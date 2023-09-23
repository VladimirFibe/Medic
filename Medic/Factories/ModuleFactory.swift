import Foundation

protocol ModuleFactoryProtocol: AnyObject {
    func makeSplashScreenModule(output: SplashScreenOutput) -> Presentable
}

final class ModuleFactory: ModuleFactoryProtocol {
    static let shared = ModuleFactory()
    private init() {}

    func makeSplashScreenModule(output: SplashScreenOutput) -> Presentable {
        SplashScreenViewController(output: output)
    }
    
}
