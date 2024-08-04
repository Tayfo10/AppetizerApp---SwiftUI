//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Tayfun Sener on 2.08.2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContent.userSaveSuccess
            
        } catch {
            alertItem = AlertContent.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContent.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContent.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContent.invalidEmail
            return false
        }
        
            return true
    }
        
        
    }

