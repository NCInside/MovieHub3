//
//  Transaction History.swift
//  MovieHub3
//
//  Created by Vincent on 29/05/23.
//

import SwiftUI
struct Transaction_History: View {
    @StateObject private var ticketViewModel = TicketViewModel()
    
    var body: some View {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    if ticketViewModel.tickets.isEmpty {
                        Text("No tickets found.")
                            .foregroundColor(.gray)
                    } else {
                        List(ticketViewModel.tickets) { ticket in
                                TicketRowView(ticket: ticket)
                        
                            .listRowBackground(Color.black)
                        }
                        .foregroundColor(.white)
                        .listStyle(PlainListStyle())
                        .font(.system(size: 50))
                    }
                }
                .background(Color.black)
            }
            #if os(iOS)
            .navigationBarTitle("Transactions", displayMode: .inline)
            #endif
        .onAppear {
            ticketViewModel.fetchAllTickets()
        }
        .background(Color.black)
    }
}


struct TicketRowView: View {
    var ticket: Ticket
    var modelData = ModelData()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text((modelData.movies[Int(ticket.movieID)].title))
                    .font(.title)
                    .foregroundColor(.white)
                Text("Theater: \(modelData.theaters[Int(ticket.theatreID)].name)")
                    .font(.headline)
                    .foregroundColor(.red)
                Text("Showtime: \(ticket.time ?? "aa")")
                    .font(.body)
                    .foregroundColor(.white)
                Text("Number of Tickets: \(ticket.numberOfTickets)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("Total Price: Rp\(String(format: "%.0f", ticket.price))")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 8)
            .background(Color.black)
            
            Spacer()
            
            modelData.movies[Int(ticket.movieID)].image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        }
    }
}

