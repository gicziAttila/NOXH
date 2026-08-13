import SwiftUI

struct MealCardView: View {
    let title: String
    let calories: Int
    let iconName: String
    
    var body: some View {
        // A ZStack szigorúan egyben tartja a rétegeket
        ZStack {
            // 1. Háttér
            Color(red: 38/255.0, green: 47/255.0, blue: 53/255.0)
            
            // 2. Vízjel
            Image(systemName: iconName)
                .font(.system(size: 180))
                .foregroundColor(.white)
                .opacity(0.04)
                .frame(width: 0, height: 0) // Nem nyomja szét a kártyát
                .offset(x: 90, y: 30)
            
            // 3. Tartalom
            VStack(alignment: .leading) {
                // Felső sor
                HStack(alignment: .top) {
                    Text(title)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        print("\(title) gomb megnyomva")
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(8)
                    }
                }
                
                // Középső Spacer: most már tudja, hogy csak a kártyán belül tágulhat!
                Spacer(minLength: 30)
                
                // Alsó sor
                HStack(alignment: .lastTextBaseline, spacing: 4) {
                    Text("\(calories)")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.system(size: 32))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                    
                    Text("KCAL")
                        .fontWeight(.bold)
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 14))
                }
            }
            .padding(16) // Belső margó
        }
        // A kártya fix mérete IDE KÍVÜLRE kerül a ZStack-re!
        .frame(height: 120)
        .cornerRadius(16)
        .clipped()
    }
}
