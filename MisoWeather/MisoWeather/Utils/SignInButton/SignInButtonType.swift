//
//  SignInButtonType.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/14.
//

import SwiftUI
import KakaoSDKUser
import AuthenticationServices

enum SignInButtonType {
    
    case apple, kakao
}

extension SignInButtonType {
    
    static var appleSignInDelegate: SignInWithAppleDelegate?
    
    var logo: some View {
        VStack {
            switch self {
            case .apple:
                Text("")
                    .font(.system(size: 24, weight: .bold, design: .default))
            case .kakao:
                Image.kakaoLogo
                    .resizable()
                    .frame(width: 18, height: 18)
            }
        }
    }
    var textString: String {
        switch self {
        case .apple:
            return "Apple로 로그인"
        case .kakao:
            return "카카오 로그인"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .apple:
            return .white
        case .kakao:
            return .kakaoYellow
        }
    }
    
    func showLoginUI(
        completionHandler: @escaping (_ isSuccess: Bool, _ identityTokenString: String) -> Void
    ) {
        switch self {
        case .apple:
            self.showAppleLoginUI { isSuccess, resultString in
                completionHandler(isSuccess, resultString)
            }
        case .kakao:
            self.showKakaoLoginUI { isSuccess, resultString in
                completionHandler(isSuccess, resultString)
            }
        }
    }
    private func showKakaoLoginUI(
        completionHandler: @escaping (_ isSuccess: Bool, _ identityTokenString: String) -> Void
    ) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { optionalOauthToken, optionalError in
                if let error = optionalError {
                    // TODO: 에러처러(throw)
                    completionHandler(false, error.localizedDescription)
                }
                guard let accessToken = optionalOauthToken?.accessToken
                else {
                    completionHandler(false, "accessToken 옵셔널 바인딩에 실패하였습니다.")
                    return
                }
                
                completionHandler(true, accessToken)
            }
        }
    }
    private func showAppleLoginUI(
        completionHandler: @escaping (_ isSuccess: Bool, _ identityTokenString: String) -> Void
    ) {
        SignInButtonType.appleSignInDelegate = SignInWithAppleDelegate { isSuccess, resultString in
            completionHandler(isSuccess, resultString)
        }
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = []
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = SignInButtonType.appleSignInDelegate
        controller.presentationContextProvider = SignInButtonType.appleSignInDelegate
        controller.performRequests()
    }
}
