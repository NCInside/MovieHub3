//
//  OnboardingView1.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//
import SwiftUI

struct OnboardingView3: View {
    @Binding var shouldonboard:Bool

    var body: some View {
        ZStack{
            Image("BG_Onboarding3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .ignoresSafeArea(edges: .top)
                .colorMultiply(Color.red)


            VStack{
                VStack{
                    Spacer()

                    VStack(alignment: .leading) {
                        Text("Find & Order")
                        Text("Movies")
                        Text("Around You")
                        VStack(alignment: .leading) {
                            Text("Updated Catalog of popular movies")
                            Text("taking place in your locality")
                            Divider()
                        }
                            .font(Font.system(size: 10))
                        Divider()
                    }.padding(.leading)
                        .font(Font.system(size: 50))
                        .bold()

                    Spacer()
                    Button(action: {
                        shouldonboard.toggle()
                    }, label: {
                        Text("Create an account")
                            .bold()
                            .frame(width: 300, height: 50)
                            .background(.gray)
                            .cornerRadius(50)

                    })
                    Spacer()

                }

                Spacer()
            }
            .foregroundColor(.white)

        }
    }
}

struct OnboardingView3_Previews: PreviewProvider {
    @State private var shouldonboard:Bool = true
    static var previews: some View {
        OnboardingView3(shouldonboard: .constant(true))
    }
}
