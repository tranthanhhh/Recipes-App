//
//  RecipeTabViews.swift
//  Recipe List App
//
//  Created by Tran Thanh on 10/26/22.
//

import SwiftUI

struct RecipeTabViews: View {
    var body: some View {
        TabView {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabViews_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabViews()
    }
}
