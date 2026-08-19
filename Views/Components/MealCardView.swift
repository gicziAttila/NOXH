import SwiftUI

struct MealCardView: View {
    let title: String
    let calories: Int
    let iconName: String
    
    var body: some View {
        ZStack {
            Color(red: 38/255.0, green: 47/255.0, blue: 53/255.0)
                .overlay(
                    Image(systemName: iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 160)
                        .foregroundColor(.white)
                        .opacity(0.04)
                        .offset(x: 30, y: 20)
                    , alignment: .bottomTrailing
                )
            
            VStack(alignment: .leading) {
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
                            .glassEffect(in: .rect(cornerRadius: 10))
                    }
                }
                
                
                Spacer(minLength: 30)
                
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
            .padding(16)
        }
        .frame(height: 150)
        .cornerRadius(16)
        .clipped()
    }
}
