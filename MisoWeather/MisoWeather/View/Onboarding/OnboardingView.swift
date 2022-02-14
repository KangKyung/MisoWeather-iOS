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
            
            self.contentView
        }
    }
    
    private var contentView: some View {
        VStack(alignment: .leading) {
            Image.logo
                .padding(.leading, 43)
                .padding(.top, 48)
                .padding(.bottom, 50)
            
            self.slideListView
                .padding(.bottom, 70)
            
            self.loginButtonListView
                .padding(.horizontal, 28)
        }
    }
    
    private var slideListView: some View {
        VStack(spacing: 0) {
            SlideView(
                spacing: 16,
                trailingSpace: 32,
                index: self.$currentOnboardingIndex,
                items: self.onboardingDatas,
                itemLimit: self.onboardingDatas.count
            ) { onboardingData in
                self.onboardingGuideView(of: onboardingData)
            }
            .padding(.bottom, 10)
            
            self.dotsOfIndexingView
        }
    }
    private func onboardingGuideView(of data: OnboardingSlideType) -> some View {
        VStack(alignment: .leading) {
            Text(data.titleString)
                .foregroundColor(.white)
                .font(.custom("SpoqaHanSansNeo-Bold", size: 36))
                .padding(.horizontal, 27)
                .padding(.bottom, 10)
            
            Text(data.subTitleString)
                .foregroundColor(.white)
                .font(.custom("SpoqaHanSansNeo-Regular", size: 20))
                .padding(.horizontal, 27)
                .padding(.bottom, 15)
            
            Image(data.imageString)
        }
    }
    private var dotsOfIndexingView: some View {
        HStack(spacing: 5) {
            ForEach(0..<self.onboardingDatas.count) { index in
                index == self.currentOnboardingIndex ? Image.onboardingEllipse :
                Image.onboardingEllipseOutline
            }
        }
    }
    private var loginButtonListView: some View {
        VStack(spacing: 10) {
            self.signInButton(with: .kakao)
            
            // TODO: Capability 추가
            // 애플 개발자등록 계정으로 변경 후, Sign in with Apple 항목 추가요망
            self.signInButton(with: .apple)
        }
    }
    private func signInButton(with button: SignInButtonType) -> some View {
        // FIXME: 리젝 후 수정요망
        // 애플로그인 UI리젝시 변경요망
//        SignInWithAppleButton()
        ZStack {
            Text(button.textString)
                .font(.system(size: 16, weight: .bold, design: .default))
            
            HStack {
                button.logo
                
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .frame(height: 48)
        .background(button.backgroundColor)
        .cornerRadius(12)
        .onTapGesture {
            button.showLoginUI { isSuccess, resultString in
                isSuccess ? print("TokenString: \(resultString)") : print("error: \(resultString)")
            }
        }
    }
}

struct OnboardingView_PreView: PreviewProvider {
    
    static var previews: some View {
        OnboardingView()
    }
}
