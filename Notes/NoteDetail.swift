//
//  NoteDetail.swift
//  Notes
//
//  Created by Avinash Kumar on 23/09/20.
//

import SwiftUI

struct NoteDetail: View {
    
    var note: Note
    
    var body: some View {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return Text(formatter.string(from: note.createdAt))
    }
}


