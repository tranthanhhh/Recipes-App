//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Tran Thanh on 11/1/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
                
            GeometryReader { geo in
            TabView(selection: $tabSelectionIndex) {
                // Loop through each recipe
                ForEach (0..<model.recipes.count) { index in
                    // Only show those that shoud be featured
                    if model.recipes[index].featured == true {
                        // Button Recipe Card
                        Button(action: {
                            //Show the recipe detail sheet
                            self.isDetailViewShowing = true
                        }, label: {
                            ZStack {
                                //Recipe Card
                                Rectangle()
                                    .foregroundColor(.white)

                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                        .font(Font.custom("Avenir", size: 15))
                                }
                                
                            }
                            
                        })
                        .tag(index)
                        .sheet(isPresented: $isDetailViewShowing ) {
                            //Show the Recipe Detail View
                            RecipeDetailView(recipe: model.recipes[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x:-5, y:5)
                    }
                    
                    
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preperation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
        
        }
    
    func setFeaturedIndex() {
        // Find the index of first recipe that is featured
        var index = model.recipes.firstIndex { (recipe) -> Bool in
                return recipe.featured
            }
            tabSelectionIndex = index ?? 0
        }
    }

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
