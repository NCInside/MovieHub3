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
        NavigationView {
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
                    }
                }
                .background(Color.black)
            }
            .navigationBarTitle("Transactions", displayMode: .inline)
        }
        .onAppear {
            ticketViewModel.fetchAllTickets()
        }
        .background(Color.black)
    }
}

//struct TicketView: View {
//    var ticket: Ticket
//       var modelData = ModelData()
//
//       var body: some View {
//           VStack {
//               Text("Ticket Details")
//                   .font(.title)
//                   .foregroundColor(.white)
//
//               HStack {
//                   VStack(alignment: .leading) {
//                       Text("Movie: \(modelData.movies[Int(ticket.movieID)].title)")
//                           .font(.headline)
//                           .foregroundColor(.white)
//                       Text("Theater: \(modelData.theaters[Int(ticket.theatreID)].name)")
//                           .font(.subheadline)
//                           .foregroundColor(.red)
//
//                       Text("Number of Tickets: \(ticket.numberOfTickets)")
//                           .font(.subheadline)
//                           .foregroundColor(.white)
//                       Text("Total Price: Rp\(String(format: "%.0f", ticket.price))")
//                           .font(.subheadline)
//                           .foregroundColor(.white)
//                   }
//                   .padding(.vertical, 8)
//                   .background(Color.black)
//
//                   Spacer()
//
//                   modelData.movies[Int(ticket.movieID)].image
//                       .resizable()
//                       .aspectRatio(contentMode: .fill)
//                       .frame(width: 80, height: 80)
//                       .clipShape(Circle())
//               }
//               .padding(.horizontal)
//
//               Spacer()
//
//               Button(action: {
//                   // Action to handle ticket confirmation
//               }) {
//                   Text("Confirm Ticket")
//                       .foregroundColor(.white)
//                       .font(.headline)
//                       .padding()
//                       .frame(maxWidth: .infinity)
//                       .background(Color.red)
//                       .cornerRadius(10)
//               }
//               .padding()
//           }
//           .background(Color.black)
//           .navigationBarBackButtonHidden(true)
//           .navigationBarItems(leading:
//               Button(action: {
//                   // Action to dismiss the TicketView
//               }) {
//                   Image(systemName: "chevron.left")
//                       .foregroundColor(.white)
//               }
//           )
//       }
//}


struct TicketRowView: View {
    var ticket: Ticket
    var modelData = ModelData()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text((modelData.movies[Int(ticket.movieID)].title))
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Theater: \(modelData.theaters[Int(ticket.theatreID)].name)")
                    .font(.subheadline)
                    .foregroundColor(.red)
                Text("Showtime: \(ticket.time ?? "aa")")
                    .font(.subheadline)
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

