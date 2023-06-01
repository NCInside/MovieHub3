//
//  TicketViewModel.swift
//  MovieHub3
//
//  Created by Vincent on 01/06/23.
//

import Foundation
import CoreData

class TicketViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    @Published var tickets: [Ticket] = []
    
    init() {
        container = NSPersistentContainer(name: "MovieHub3")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading Core Data stack: \(error)")
            }
        }
    }
    
    func buyTicket(movie: Movie, theaterID: Int, time: String, numberOfTickets: Int, price: Double) {
        let ticket = Ticket(context: container.viewContext)
        ticket.movieID = Int16(movie.id)
        ticket.theatreID = Int16(theaterID)
        ticket.time = time
        ticket.numberOfTickets = Int16(numberOfTickets)
        ticket.price = price
        
        do {
            try container.viewContext.save()
            print("Ticket bought and saved to Core Data.")
        } catch {
            print("Error saving ticket: \(error)")
        }
    }
    
    func fetchAllTickets() {
        let fetchRequest = NSFetchRequest<Ticket>(entityName: "Ticket")
        
        do {
            tickets = try container.viewContext.fetch(fetchRequest)
        } catch {
            print("Error fetching tickets: \(error)")
        }
    }
}
