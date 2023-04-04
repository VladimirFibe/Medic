import Foundation

struct OnboardingModel: Identifiable {
    let id: Int
    let title: String
    let text: String
    let image: String
}

extension OnboardingModel {
    static let all = [
        OnboardingModel(id: 1,
                        title: "Анализы",
                        text: "Экспресс сбор и получение проб",
                        image: "onboarding1"),
        OnboardingModel(id: 2,
                        title: "Уведомления",
                        text: "Вы быстро узнаете о результатах",
                        image: "onboarding2"),
        OnboardingModel(id: 3,
                        title: "Мониторинг",
                        text: "Наши врачи всегда наблюдают за вашими показателями здоровья",
                        image: "onboarding3"),
    ]
}
