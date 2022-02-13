//
//  OnboardingSlideType.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import Foundation

enum OnboardingSlideType: CaseIterable {
    
    case first, second, third, fourth, fifth
}

extension OnboardingSlideType: Identifiable {
    
    var id: String {
        UUID().uuidString
    }
}

extension OnboardingSlideType {
    
    var titleString: String {
        switch self {
        case .first:
            return "오늘 날씨,\n미소웨더에 물어봐"
        case .second:
            return "오늘 뭐 입지?"
        case .third:
            return "이따 뭐 먹지?"
        case .fourth:
            return "내일 어디 가지?"
        case .fifth:
            return "날씨로 얘기하자!"
        }
    }
    var subTitleString: String {
        switch self {
        case .first:
            return ""
        case .second:
            return "좀 꾸미고 싶은데,\n코트 입으면 추울까?"
        case .third:
            return "오늘 날씨에 딱 어울리는\n음식은 뭘까?"
        case .fourth:
            return "여기 보다는 따뜻하면 좋겠는데,\n그 지역 사람들한테 물어볼까?"
        case .fifth:
            return "지금 바로 오늘 날씨에 대한\n생각을 나누러 가볼까요?"
        }
    }
    var imageString: String {
        switch self {
        case .first:
            return "onboardingImage1"
        case .second:
            return "onboardingImage2"
        case .third:
            return "onboardingImage3"
        case .fourth:
            return "onboardingImage4"
        case .fifth:
            return "onboardingImage5"
        }
    }
}
