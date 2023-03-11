//
//  ViewModel.swift
//  alamofire
//
//  Created by Jonn Alves on 11/03/23.
//

import Foundation
import Combine
class ContentViewModel: ObservableObject {
    
    @Published var chats =  [Amiibo]()
    @Published var chatListLoadingError: String = ""
    @Published var showAlert: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: AmiiboProtocol
    
    init(dataManager: AmiiboProtocol = AmiiboRepository.shared) {
        self.dataManager = dataManager
        getChatList()
    }
    
    func getChatList() {
        dataManager.fetchAmiibos()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.chats = dataResponse.value!.amiibo
                }
            }.store(in: &cancellableSet)
    }
    
    func createAlert( with error: NetworkError ) {
        chatListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}
