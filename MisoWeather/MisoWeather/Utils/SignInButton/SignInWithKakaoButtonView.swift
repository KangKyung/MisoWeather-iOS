//
//  SignInWithKakaoButtonView.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/14.
//

import SwiftUI
import KakaoSDKUser

struct SignInWithKakaoButtonView: View {
 
    var body: some View {
        self.loginButton
            .onTapGesture {
                self.showKakaoLoginUI()
            }
    }
    
    private var loginButton: some View {
        ZStack {
            Text("카카오 로그인")
                .font(.system(size: 16, weight: .bold, design: .default))
            
            HStack {
                Image.kakaoLogo
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .frame(height: 48)
        .background(Color.kakaoYellow)
        .cornerRadius(12)
    }
    
    private func showKakaoLoginUI() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                guard let accessToken = oauthToken?.accessToken
                else {
                    return
                }
                
                print("accessToken: \(accessToken)")
            }
        }
    }
}
