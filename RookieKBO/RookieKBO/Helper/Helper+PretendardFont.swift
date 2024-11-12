//
//  Helper+PretendardFont.swift
//  RookieKBO
//
//  Created by crownjoe on 10/7/24.
//

import SwiftUI

extension Font {
    enum CustomTitle {
        static let customTitle1: Font = .custom("Pretendard-Bold", size: 40)
        static let customTitle2: Font = .custom("Pretendard-Bold", size: 32)
    }
    
    enum Head {
        static let head1: Font = .custom("Pretendard-Medium", size: 32)
        static let head2: Font = .custom("Pretendard-Medium", size: 24)
        static let head2b: Font = .custom("Pretendard-Bold", size: 24)
        static let head3: Font = .custom("Pretendard-Medium", size: 22)
        static let head4: Font = .custom("Pretendard-Medium", size: 20)
        static let head4b: Font = .custom("Pretendard-Bold", size: 20)
        static let head5: Font = .custom("Pretendard-SemiBold", size: 18)
    }
    
    enum Body {
        static let body1: Font = .custom("Pretendard-Bold", size: 16)
        static let body2: Font = .custom("Pretendard-Medium", size: 16)
        static let body3: Font = .custom("Pretendard-Regular", size: 16)
        static let body4: Font = .custom("Pretendard-SemiBold", size: 14)
        static let body5: Font = .custom("Pretendard-Regular", size: 14)
    }
    
    enum Caption {
        static let caption1: Font = .custom("Pretendard-Bold", size: 12)
        static let caption2: Font = .custom("Pretendard-Medium", size: 10)
        static let caption3: Font = .custom("Pretendard-Medium", size: 8)
        static let caption3b: Font = .custom("Pretendard-Bold", size: 8)
    }
}
