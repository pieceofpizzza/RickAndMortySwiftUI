//
//  ModalViewModel.swift
//  rickAndMortySwiftUI
//
//  Created by Дарина Лисанова on 07.07.2023.
//

import Foundation
import Combine
class ModalViewModel: ObservableObject {
    @Published var data: Modal.DataToShow
    
    init(data: Main.Origin) {
        self.data = Modal.DataToShow(origin: data)
        getEarthData(urlS: data.url)
    }
    
    private func getEarthData(urlS: String) {
        guard let url = URL(string: urlS) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r, e in
            guard e == nil else {
                print(e!.localizedDescription)
                return
            }
            guard let d = d else { return }
            print(d)
        }.resume()
    }
}
