//
//  AddNote.swift
//  Notes
//
//  Created by Avinash Kumar on 23/09/20.
//

import SwiftUI

struct AddNote: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State var title:String = ""
    @State var caption:String = ""
    @State var priority: Int = 5
    
    var body: some View {
        NavigationView{
            Form{
                List{
                    Section{
                        TextField("Title",text: $title)
                        TextField("Body",text: $caption)
                        Picker("Priority", selection: $priority){
                            ForEach(0...10, id: \.self){ int in
                                Text(String(int))
                            }
                        }
                        
                    }
                    Button("Add Note") {
                        let note = Note(context: moc)
                        note.caption = caption
                        note.title = title
                        note.priority = Int64(priority)
                        note.createdAt = Date()
                        
                        do {
                            try moc.save()
                        } catch {
                            print("Error \(error.localizedDescription)")
                        }
                    }
                }
            }.navigationBarTitle(Text("New Note"))
        }
        
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNote()
    }
}
