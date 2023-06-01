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
        VStack {
            if ticketViewModel.tickets.isEmpty {
                Text("No tickets found.")
                    .foregroundColor(.gray)
            } else {
                List(ticketViewModel.tickets) { ticket in
                    TicketRowView(ticket: ticket)
                }
            }
        }
        .onAppear {
            ticketViewModel.fetchAllTickets()
        }
    }
}


struct Transaction_History_Previews: PreviewProvider {
    static var previews: some View {
        Transaction_History()
    }
}

struct TicketRowView: View {
    var ticket: Ticket

    var body: some View {
        VStack(alignment: .leading) {
            Text("Number of Tickets: \(ticket.numberOfTickets)")
                .font(.headline)
            Text("Theater ID: \(ticket.theatreID)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Price: \(ticket.price)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

