//
//  SignInWithAppleButton.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import SwiftUI
import AuthenticationServices

final class SignInWithAppleButton: UIViewRepresentable {
  
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    ASAuthorizationAppleIDButton(type: .signIn, style: .white)
  }
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}
