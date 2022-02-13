//
//  SignInWithAppleDelegate.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import SwiftUI
import AuthenticationServices

final class SignInWithAppleDelegate: NSObject {
    
    private let signInSucceeded: (Bool) -> Void
    
    init(onSignedIn: @escaping (Bool) -> Void) {
        self.signInSucceeded = onSignedIn
    }
}

extension SignInWithAppleDelegate: ASAuthorizationControllerDelegate {
    
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            self.authenticate(credential: appleIdCredential)
            self.signInSucceeded(true)
        default:
            break
        }
    }
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {}
    private func authenticate(credential: ASAuthorizationAppleIDCredential) {
        guard let authCode = credential.authorizationCode,
              let authCodeString = String(data: authCode, encoding: .utf8),
              let token = credential.identityToken,
              let tokenString = String(data: token, encoding: .utf8)
//              let url = URL(string: "")
        else {
            return
        }
        
        let userEmail: String? = credential.email ?? nil
        let parameters = [
            "appleUserId": credential.user,
            "authorizationToken": authCodeString,
            "email": userEmail as Any,
            "identityToken": tokenString
        ] as [String: Any]
        print("parameters: \(parameters)")
        
        let logString = """
        identityToken: \(String(describing: credential.identityToken))
        authorizationCode: \(credential.authorizationCode!)
        user: \(credential.user)
        email: \(String(describing: credential.email))
        credential: \(credential)
        """
        print(logString)
    }
}

extension SignInWithAppleDelegate: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        UIApplication.shared.windows.last!
    }
}
