//
//  ContentView.swift
//  Notes
//
//  Created by Avinash Kumar on 22/09/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(fetchRequest: Note.fetchRequest()) var notes: FetchedResults<Note>
    
    @State private var actionSheetVisiable = false
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(notes,id: \.createdAt) { note in
                    
                    NavigationLink(destination: NoteDetail(note: note)){
                        NoteCard(note: note)
                    }
                }.onDelete(perform: deleteNotes)
                
            } .navigationTitle(Text("Notes"))
            .navigationBarItems(trailing: Button(action: {
                actionSheetVisiable.toggle()
            }, label: {
                Text("Add")
            })
            .sheet(isPresented: $actionSheetVisiable) {
                AddNote()
            })
            
            
        }
        
        
    }
    
    func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            let note:Note = notes[index]
            moc.delete(note)
        }
        try? moc.save()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
                
            }
        }
    }
    
    
}


struct NoteCard : View {
    
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
            Text(note.caption)
        }
    }
}

