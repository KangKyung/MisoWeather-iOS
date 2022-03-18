//
//  OnboardingView.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import SwiftUI

struct OnboardingView: View {
  
  @State private var currentOnboardingIndex: Int = 0
  private let onboardingDatas: [OnboardingSlideType] = OnboardingSlideType.allCases

  // MARK: View
  
  var body: some View {
    ZStack(alignment: .top) {
      Color.accent
        .ignoresSafeArea(.all)
      
      VStack(alignment: .leading) {
        Image.logo
          .padding(.leading, 43)
          .padding(.top, 50)
        
        OnboardingSlideListView()
          .padding(.bottom, 40)
        
        VStack(spacing: 10) {
          SocialLoginButton(type: .kakao)
          
          // TODO: Capability 추가
          // 애플 개발자등록 계정으로 변경 후, Sign in with Apple 항목 추가요망
          SocialLoginButton(type: .apple)
        }
        .padding(.horizontal, 28)
      }
    }
  }
}

struct OnboardingView_PreView: PreviewProvider {
  
  static var previews: some View {
    OnboardingView()
  }
}
