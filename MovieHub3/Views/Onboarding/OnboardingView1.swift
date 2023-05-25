//
//  OnboardingView1.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//
import SwiftUI

struct OnboardingView1: View {
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
                        Text("Fast And")
                        Text("Convenient")
                        Text("Movie nights")
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

                }

                Spacer()
            }
            .foregroundColor(.white)

        }
    }
}

struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}
