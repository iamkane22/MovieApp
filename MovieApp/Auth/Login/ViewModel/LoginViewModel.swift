//
//  LoginViewModel.swift
//  MovieApp
//
//  Created by Kenan on 08.01.25.
//

import Foundation

final class LoginViewModel {
    enum ViewState {
    case loading
    case loaded
    case succes
    case error
    }

    private weak var navigation: AuthNavigation?
    var requestcallback: ((ViewState) -> Void)?
    init(navigation: AuthNavigation) {
        self.navigation = navigation
        
    }
    
 func showRegister() {
     navigation?.showRegister()
    }
}
