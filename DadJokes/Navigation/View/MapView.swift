//
//  MapView.swift
//  DadJokes
//
//  Created by dtthong on 29/07/2022.
//

import SwiftUI

struct MapView: View {
    @StateObject var modelView = StateViewModel()
    @State var show = false
    var body: some View {
        NavigationView{
            List {
                ForEach(self.modelView.listContact, id:\.self){item in
                    Text("\(item.name)")
                }.onDelete(perform: removeItem)
                   
            }.refreshable {
                modelView.getData()
            }
        }
    }
    func removeItem(at offsets: IndexSet){
        // preserve all ids to be deleted to avoid indices confusing
        let idsToDelete = offsets.map { self.modelView.listContact[$0].id }

           // schedule remote delete for selected ids
           _ = idsToDelete.compactMap { id in
               modelView.listContact.remove(atOffsets:offsets)
               modelView.deletePost(id: "\(String(describing: id ))")
           }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct ListItem: View {
    var avatar, name : String
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: avatar), content: { image in
                image.resizable()
            }, placeholder: {ProgressView()}).frame(width: 30, height: 30).clipShape(Circle())
            Text(name)
        }
    }
}
