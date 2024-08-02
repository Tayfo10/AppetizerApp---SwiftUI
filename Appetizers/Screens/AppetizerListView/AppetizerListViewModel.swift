//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Tayfun Sener on 1.08.2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContent.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContent.invalidURL
                    case .invalidData:
                        alertItem = AlertContent.invalidData
                    case .unableToComplete:
                        alertItem = AlertContent.unabletoComplete
                    }
                }
            }
        }
    }
}
