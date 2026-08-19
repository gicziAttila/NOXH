import Foundation

enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Woman"
}

enum ActivityLevel: Double, CaseIterable {
    case sedentary = 1.2
    case lightlyActive = 1.375
    case moderatelyActive = 1.55
    case veryActive = 1.725
    case extraActive = 1.9
}

enum PrimaryGoal: String, CaseIterable {
    case loseWeight = "Weight Loss"
    case athletic = "Athletic Physique"
    case buildMuscle = "Muscle Growth"
}

struct GoalOption: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let dailyKcal: Int
    let proteinGrams: Int
    let carbsGrams: Int
    let fatGrams: Int
}

class NutritionCalculator {
    
    static func generateOptions(weight: Double, height: Double, age: Int, gender: Gender, activity: ActivityLevel, primaryGoal: PrimaryGoal) -> [GoalOption] {
        
        var bmr = (10.0 * weight) + (6.25 * height) - (5.0 * Double(age))
        bmr += (gender == .male) ? 5.0 : -161.0
        
        let tdee = bmr * activity.rawValue
        
        return [
            createOption(title: "Maintain weight", desc: "", targetKcal: tdee, weight: weight, goal: primaryGoal),
            createOption(title: "Mild Weight Loss", desc: "0.25kg/week", targetKcal: tdee - 250, weight: weight, goal: primaryGoal),
            createOption(title: "Weight Loss", desc: "0.5kg/week", targetKcal: tdee - 500, weight: weight, goal: primaryGoal),
            createOption(title: "Extreme Weight Loss", desc: "1kg/week", targetKcal: tdee - 1000, weight: weight, goal: primaryGoal)
        ]
    }
    
    private static func createOption(title: String, desc: String, targetKcal: Double, weight: Double, goal: PrimaryGoal) -> GoalOption {
        let finalKcal = max(1200, Int(targetKcal))
        
        
        let proteinMultiplier: Double
        switch goal {
        case .loseWeight:
            proteinMultiplier = 1.5
        case .athletic:
            proteinMultiplier = 2.2
        case .buildMuscle:
            proteinMultiplier = 2.0
        }
        
        let protein = Int(weight * proteinMultiplier)
        let proteinKcal = protein * 4
        
        let fat = Int(weight * 0.9)
        let fatKcal = fat * 9
        
        let remainingKcal = finalKcal - proteinKcal - fatKcal
        let carbs = max(0, remainingKcal / 4)
        
        return GoalOption(
            title: title,
            description: desc,
            dailyKcal: finalKcal,
            proteinGrams: protein,
            carbsGrams: carbs,
            fatGrams: fat
        )
    }
}
