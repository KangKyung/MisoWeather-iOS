//
//  SocialLoginButton.swift
//  MisoWeather
//
//  Created by 강경 on 2022/03/15.
//

import SwiftUI

struct SocialLoginButton: View {
  
  var type: SignInButtonType
  
  var body: some View {
    // FIXME: 리젝 후 수정요망
    // 애플로그인 UI리젝시 변경요망
    //        SignInWithAppleButton()
    ZStack {
      Text(self.type.textString)
        .font(.system(size: 16, weight: .bold, design: .default))
      
      HStack {
        self.type.logo
        
        Spacer()
      }
    }
    .padding(.vertical, 10)
    .padding(.horizontal, 15)
    .frame(height: 48)
    .background(self.type.backgroundColor)
    .cornerRadius(12)
    .onTapGesture {
      self.type.showLoginUI { isSuccess, resultString in
        // TODO: API개발되면 연결요망
        isSuccess ? print("TokenString: \(resultString)") : print("error: \(resultString)")
      }
    }
  }
}
