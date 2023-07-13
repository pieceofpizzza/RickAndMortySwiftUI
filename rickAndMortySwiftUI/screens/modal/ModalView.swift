//
//  ModalView.swift
//  rickAndMortySwiftUI
//
//  Created by Дарина Лисанова on 07.07.2023.
//

import SwiftUI

struct ModalView: View {
    
    
    @ObservedObject var vm: ModalViewModel
    
    @Binding var isShow: Bool
    var body: some View {
        VStack {
            Text(vm.data.name)
            
            Button {
                isShow = false
            } label: {
                Image(systemName: "cross")
                    .padding()
                    .background(Color.black)
            }

        }
    }
}
