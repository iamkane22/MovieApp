//
//  FireBase.swift
//  MovieApp
//
//  Created by Kenan on 15.01.25.
//

import FirebaseAuth

class FirebaseAuthService {
    static let shared = FirebaseAuthService()

    private init() {}

    // İstifadəçi qeydiyyatı (Email və Şifrə ilə)
    func registerUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }

    // İstifadəçi giriş (Email və Şifrə ilə)
    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }

    // İstifadəçi çıxış
    func logoutUser(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            completion(false)
        }
    }

    // Hal-hazırda daxil olmuş istifadəçini almaq
    func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
}
