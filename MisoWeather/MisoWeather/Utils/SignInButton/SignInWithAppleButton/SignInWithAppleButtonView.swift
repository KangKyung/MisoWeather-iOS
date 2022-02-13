//
//  SignInWithAppleButtonView.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonView: View {
    
    @State var appleSignInDelegate: SignInWithAppleDelegate?
    
    var body: some View {
        self.loginButton
            .onTapGesture {
                self.showAppleLoginUI()
            }
    }
    
    private var loginButton: some View {
        // FIXME: 리젝 후 수정요망
        // 애플로그인 UI리젝시 변경요망
//        SignInWithAppleButton()
        ZStack {
            Text("Apple로 로그인")
                .font(.system(size: 16, weight: .bold, design: .default))
            
            HStack {
                Text("")
                    .font(.system(size: 24, weight: .bold, design: .default))
                
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .frame(height: 48)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.black, lineWidth: 1)
        )
    }
    
    private func showAppleLoginUI() {
        self.appleSignInDelegate = SignInWithAppleDelegate { isSuccess in
            print("로그인 성공?: \(isSuccess)")
        }
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self.appleSignInDelegate
        controller.presentationContextProvider = self.appleSignInDelegate
        controller.performRequests()
    }
}
