//
//  BuyTicketView.swift
//  MovieHub3
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct BuyTicketView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
//    var movie: Movie
    var showtime: (theater: Theater, movietimes: [MovieTime])!

    @StateObject private var viewModel: CinemaMovieViewModel
    @State private var theaterid: Int
    @State private var movie: Movie
    
    @State var datetime: String = ""
    @State var ticketAmount: String = ""

    init(movie: Movie, theaterid: Int) {
        self._movie = State(initialValue: movie)
        self._viewModel = StateObject(wrappedValue: CinemaMovieViewModel(idmovietheater: movie.id, theaterid: theaterid))
        self._theaterid = State(initialValue: theaterid)
        self.showtime = (theater: viewModel.theater, movietimes: viewModel.showtimes)
    }
    
    @StateObject private var ticketViewModel = TicketViewModel()
    @State private var isTicketConfirmed = false

    var body: some View {
#if os(iOS)
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .center) {
                        movie.image
                            .resizable()
                            .frame(width: 170, height: 270)
                        HStack(spacing: 3) {
                            ForEach (0..<(Int(movie.score) + 1), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                            }
                            ForEach (0..<Int(5 - movie.score), id: \.self) { _ in
                                Image(systemName: "star")
                                    .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                            }
                        }
                        
                        Text(movie.title)
                            .font(.system(size: 18, weight: .heavy, design: .default))
                            .foregroundColor(.white)
                            .padding(.top, 5)
                        Text("\(movie.genres[0]) | \(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                    }
                    VStack(alignment: .leading) {
                        Text(viewModel.theater.name)
                            .font(.title2)
                            .bold()
                        HStack {
                            Image(systemName: "map.fill")
                            Text(viewModel.theater.location)
                        }
                        HStack {
                            Image(systemName: "phone.fill")
                            Text(viewModel.theater.phone)
                        }
                        Divider()
                        
                        Text("Showtime: ")
                        
                        VStack(alignment: .leading) {
                            ForEach(showtime.movietimes, id: \.self) { time in
                                VStack {
                                    HStack {
                                        Capsule()
                                            .fill(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                                            .frame(width: 190, height: 30)
                                            .overlay(
                                                Text(time.date.prefix(5))
                                            )
                                        Spacer()
                                    }
                                    HStack {
                                        ForEach(time.hours, id: \.self) { hour in
                                            Button(action: {
                                                datetime = time.date + ", " + hour
                                            }) {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0), lineWidth: 2)
                                                    .frame(width: 50, height: 30)
                                                    .overlay(
                                                        Text(hour)
                                                            .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                                                    )
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.leading)
                }
                .padding(.top, 15)
                .foregroundColor(.white)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 4)
                
                HStack {
                    Text("Ticket amount:")
                    TextField("Enter a number", text: $ticketAmount)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.black)
                }
                .foregroundColor(.white)
                
                Text(datetime)
                    .foregroundColor(.white)
                Text(ticketAmount)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    var numberOfTickets = Int(ticketAmount) ?? 0
                    var price: Double = Double(ticketAmount)! * 25000
                    ticketViewModel.buyTicket(movie: movie, theaterID: viewModel.theater.id, time: datetime, numberOfTickets: numberOfTickets, price: price)
                    isTicketConfirmed = true
                }) {
                    Text("Confirm order")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                        .cornerRadius(10)
                }
                .background(
                    NavigationLink(
                        destination: TicketConfirmationView(
                            movie: movie,
                            theaterid: viewModel.theater.id,
                            datetime: $datetime,
                            ticketAmount: $ticketAmount
                        ),
                        isActive: $isTicketConfirmed,
                        label: {
                            EmptyView()
                        })
                    .hidden()
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(25)
            .background(Color.black)
        }
        .onAppear {
            // Reset the datetime, ticketAmount, theaterid, and movie variables when the view appears
            datetime = ""
            ticketAmount = ""
            theaterid = self.theaterid
            movie = self.movie
        }
        #endif
#if os(macOS)
VStack {
    Spacer()
    
    HStack {
        Spacer()
        // Form
        VStack {
            HStack {
                Text("Ticket amount:")
                TextField("Enter a number", text: $ticketAmount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
            }
            .foregroundColor(.white)
            
            HStack {
                Text("Ticket amount:")
                TextField("Enter a number", text: $datetime)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .disabled(true)
            }
            .foregroundColor(.white)
        }
        .frame(width: 700)
        Spacer()
        
        // Movie banner and info
        VStack {
            HStack {
                // Banner
                movie.image
                    .resizable()
                    .frame(width: 170, height: 270)
                
                // Info
                VStack {
                    HStack(spacing: 3) {
                        ForEach(0..<(Int(movie.score) + 1), id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                        }
                        ForEach(0..<Int(5 - movie.score), id: \.self) { _ in
                            Image(systemName: "star")
                                .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                        }
                    }
                    
                    Text(movie.title)
                        .font(.system(size: 18, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    Text("\(movie.genres[0]) | \(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                        .padding(.top, 1)
                    
                    HStack {
                        Text("Showtime: ")
                            .font(.system(size: 14, weight: .medium, design: .default))
                        
                        VStack(alignment: .leading) {
                            ForEach(showtime.movietimes, id: \.self) { time in
                                HStack {
                                    Capsule()
                                        .fill(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                                        .frame(width: 80, height: 30)
                                        .overlay(
                                            Text(time.date.prefix(5))
                                        )
                                    ForEach(time.hours, id: \.self) { hour in
                                        Button(action: {
                                            datetime = time.date + ", " + hour
                                        }) {
                                            Text(hour).foregroundColor(.white)
                                        }
                                        .background(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                                        .frame(width: 80, height: 30)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding(25)
    .background(Color.black)
    
    Button(action: {
        var numberOfTickets = Int(ticketAmount) ?? 0
        var price: Double = Double(ticketAmount)! * 25000
        ticketViewModel.buyTicket(movie: movie, theaterID: viewModel.theater.id, time: datetime, numberOfTickets: numberOfTickets, price: price)
        isTicketConfirmed = true
    }) {
        Text("Confirm order")
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
            .cornerRadius(0)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0), lineWidth: 2)
            )
    }
    .padding()
    
    NavigationLink(
        destination: TicketConfirmationView(
            movie: movie,
            theaterid: viewModel.theater.id,
            datetime: $datetime,
            ticketAmount: $ticketAmount
        ),
        isActive: $isTicketConfirmed,
        label: {
            EmptyView()
        })
}
#endif


    }
    
}


struct BuyTicketView_Previews: PreviewProvider {
    static var movies = ModelData().movies

    static var previews: some View {
        BuyTicketView(movie: movies[0], theaterid: 2)
    }
}
