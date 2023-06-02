//
//  ReviewCreate.swift
//  MovieHub3
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct ReviewCreate: View {
    
    @EnvironmentObject private var viewModel: MovieDetailViewModel
    private let valueRange = Array(stride(from: 0.0, through: 5.0, by: 0.1))
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Leave a Review")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .heavy, design: .default))
            TextEditor(text: $viewModel.comment)
                .scrollContentBackground(.hidden)
                .foregroundColor(.white)
                .background(.white.opacity(0.1))
                .frame(height: 100)
                .cornerRadius(8)
            Text("Score")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .heavy, design: .default))
            Picker("Select a value", selection: $viewModel.score) {
                ForEach(valueRange, id: \.self) { value in
                    Text("\(value, specifier: "%.1f")")
                        .foregroundColor(.white)
                }
            }
            .pickerStyle(.automatic)
            .frame(height: 150)
            .cornerRadius(8)
            
            Button(action: {
                guard !viewModel.comment.isEmpty else { return }
                viewModel.addReview()
                dismiss()
            }) {
                Text("Submit")
                    .font(.headline)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
            }
            .background(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
            .foregroundColor(.red)
            .cornerRadius(8)

            
            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(maxHeight: .infinity)
        .background(Color.black)
    }
}

struct ReviewCreate_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCreate()
    }
}
