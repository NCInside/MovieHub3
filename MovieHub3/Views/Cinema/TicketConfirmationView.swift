//
//  BuyTicketView.swift
//  MovieHub3
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct TicketConfirmationView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
        
    var movie: Movie
    var showtime: (theater: Theater, movietimes: [MovieTime])!
    @StateObject private var viewModel: CinemaMovieViewModel
    var theaterid: Int
    @Environment(\.presentationMode) var presentationMode
    @Binding var datetime: String
    @Binding var ticketAmount:String

    init(movie: Movie, theaterid: Int, datetime: Binding<String>, ticketAmount: Binding<String>){
        _datetime = datetime
        _ticketAmount = ticketAmount
        self.movie = movie
        self._viewModel = StateObject(wrappedValue: CinemaMovieViewModel(idmovietheater: movie.id, theaterid: theaterid))
        self.theaterid = theaterid
        self.showtime = (theater: viewModel.theater, movietimes: viewModel.showtimes)
        
    }
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    movie.image
                        .resizable()
                        .frame(width: 120, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    VStack(alignment: .leading){
                        Text(movie.title).font(.title).bold().foregroundColor(.white)
                        Text("\(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                                    let components = datetime.components(separatedBy: ",")
                                    let date = components.first?.trimmingCharacters(in: .whitespaces)
                                    let time = components.last?.trimmingCharacters(in: .whitespaces)
                                    
                                    Text("Date: \(date ?? "")")
                                    Text("Time: \(time ?? "")")
                                
                        Text("Cinema : \(viewModel.theater.name)")
                    }
                }
                .padding()
                .background(.red)
                HStack{
                    Text("Number of tickets: ")
                    Text("\(ticketAmount) people")
                }.background(.white)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 50)
            )
            
            
            HStack{
                Spacer()
                Text("Total payment")
                Spacer()
                Text("\(viewModel.counttotal(ticketAmount))")
                Spacer()
            }.foregroundColor(.white)
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 4)
            
            HStack{
                Spacer()
                VStack(alignment: .leading){
                    Text("Ticket price")
                    Text("Other fees")
                    Text("Discount")
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Rp 25.000 x \(ticketAmount)")
                    Text("Rp 0")
                    Text("Rp 0")
                }
                Spacer()
            }.foregroundColor(.white)

            Spacer()
                     
                     Button(action: {
                         presentationMode.wrappedValue.dismiss()
                     }) {
                         Text("Done")
                             .foregroundColor(.white)
                             .font(.headline)
                             .padding()
                             .frame(maxWidth: .infinity)
                             .background(Color.red)
                             .cornerRadius(10)
                     }
                     .padding()
            
        }.background(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
        
}


struct TicketConfirmationView_Previews: PreviewProvider {
    static var movies = ModelData().movies

    static var previews: some View {
        TicketConfirmationView(movie: movies[0], theaterid: 2, datetime: .constant("true"), ticketAmount: .constant("2"))
    }
}
