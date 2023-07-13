//
//  MainView.swift
//  rickAndMortySwiftUI
//
//  Created by Дарина Лисанова on 07.07.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel = MainViewModel()
    @State private var isShow: Bool = false
    var body: some View {
        VStack {
            viewModel.data?.image?
                .resizable()
                .frame(width: 325, height: 325)
            
            Text(viewModel.data?.name ?? "")
                .font(Font.title)
            
            HStack{
                VStack(alignment: .leading){
                    Text(viewModel.data?.status ?? "")
                    Text(viewModel.data?.species ?? "")
                    Text(viewModel.data?.type ?? "")
                    Text(viewModel.data?.gender ?? "")
                    Button {
                        if viewModel.data != nil {
                            isShow = true
                        }
                    } label: {
                        Text(viewModel.data?.origin ?? "")
                            .foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.gray)
                }
                Spacer()
            }


            
        }
        .padding(30)
        .background(Color.green)
        .sheet(isPresented: $isShow) {
            ModalView(vm: ModalViewModel(data: viewModel.data!.originData), isShow: $isShow)
        }
    }
}
