import UIKit

protocol SplashScreenOutput: AnyObject {
    func moduleFinish()
}

class SplashScreenViewController: UIViewController {
    private weak var output: SplashScreenOutput?

    init(output: SplashScreenOutput? = nil) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.output?.moduleFinish()
        }
    }
}
