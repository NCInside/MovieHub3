//
//  OnboardingView1.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//
import SwiftUI

struct OnboardingView2: View {
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
                        Text("Post Your")
                        Text("Thoughts")
                        Text("Online")
                        VStack(alignment: .leading) {
                            Text("Learn what everyone else is saying")
                            Text("about a certain movie")
                            Divider()
                        }
                            .font(Font.system(size: 10))
                        Divider()
                    }.padding(.leading)
                        .font(Font.system(size: 50))
                        .bold()

                    Spacer()

                }

                Spacer()
            }
            .foregroundColor(.white)

        }
    }
}

struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2()
    }
}
