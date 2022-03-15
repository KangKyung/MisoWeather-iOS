//
//  SignInWithAppleDelegate.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import SwiftUI
import AuthenticationServices

final class SignInWithAppleDelegate: NSObject {
  
  private let signInSucceeded: (Bool, String) -> Void
  
  init(onSignedIn: @escaping (Bool, String) -> Void) {
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
      self.authenticate(credential: appleIdCredential) { isSuccess, resultString in
        self.signInSucceeded(isSuccess, resultString)
      }
    default:
      let error = "authorization.credential의 타입이 ASAuthorizationAppleIDCredential가 아닙니다."
      self.signInSucceeded(false, error)
    }
  }
  func authorizationController(
    controller: ASAuthorizationController,
    didCompleteWithError error: Error
  ) {}
  private func authenticate(
    credential: ASAuthorizationAppleIDCredential,
    completionHandler: (_ isSuccess: Bool, _ identityTokenString: String) -> Void
  ) {
    guard let token = credential.identityToken,
          let tokenString = String(data: token, encoding: .utf8)
    else {
      completionHandler(false, "token 옵셔널 바인딩에 실패하였습니다.")
      return
    }
    
    completionHandler(true, tokenString)
  }
}

extension SignInWithAppleDelegate: ASAuthorizationControllerPresentationContextProviding {
  
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    UIApplication.shared.windows.last!
  }
}
