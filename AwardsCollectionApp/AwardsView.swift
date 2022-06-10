//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//  Changed by Ivanov Mikhail on 10.06.2022
//

import SwiftUI


struct AwardsView: View {
    let awards = Award.getAwards()
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    var body: some View {
        NavigationView {
            VStack {
                CustomGridView(items: activeAwards, columns: 2) { itemSize, award in
                    VStack {
                        award.awardView
                        Text(award.title)
                    }
                    .padding()
                    .frame(width: itemSize, height: itemSize)
                    
                }
            }
            .navigationBarTitle("Your awards: \(activeAwards.count)")
        }
    }
}

//struct AwardsView: View {
//    let awards = Award.getAwards()
//    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
//    var activeAwards: [Award] {
//        awards.filter { $0.awarded }
//    }
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(activeAwards, id: \.title) { award in
//                        VStack {
//                            award.awardView
//                            Text(award.title)
//                        }
//                    }
//                }
//            }
//            .navigationBarTitle("Your awards: \(activeAwards.count)")
//        }
//    }
//}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
