//
//  MainViewModel.swift
//  rickAndMortySwiftUI
//
//  Created by Дарина Лисанова on 07.07.2023.
//
import UIKit
import SwiftUI
import Combine
class MainViewModel: ObservableObject {
    @Published var data: Main.DataToShow?
    
    let link = "https://rickandmortyapi.com/api/character/1"
    
    var post: Main.Post?
    
    init() {
        makeRequest()
    }
    
    private func makeRequest(){
        guard let url = URL(string: link) else {return}
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
            }

            guard let data = data else {
                print("data error")
                return
            }

            do {
                let post = try JSONDecoder().decode((Main.Post).self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.post = post
                    self?.showData(post: post)
                }
                print(post)
            }

            catch {
                print(String(describing: error))
            }
        }.resume()
    }
    
    private func showData(post: Main.Post) {
        self.data = Main.DataToShow(post: post)
        if let url = URL(string: post.image) {
            DispatchQueue.global(qos: .background).async { [weak self] in
                do {
                    
                    let data = try Data(contentsOf: url)
                    if let uiImage = UIImage(data: data){
                        DispatchQueue.main.async {
                            self?.data?.set(image: Image(uiImage: uiImage))
                        }
                    }
                    
                    
                } catch {
                    print(error)
                }
            }
        }
    }
}
