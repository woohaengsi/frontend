//
//  LoginView.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/06.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @EnvironmentObject var opData: OperationData
    let signInWithAppleDelegate = SignInWithAppleDelegate()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                //상단 Logo 구성
                VStack {
                    Image("LoginLogo")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 176, height: 157)
                .padding()
                
                //소셜 로그인 버튼 구성
                VStack {
                    Group {
                        Button(action: {
                            performSignInWithApple()
                        }, label: {
                            Text("Apple")
                                .frame(width: 300, height: 44)
                                .border(.black)
                        })
                        
                        Button(action: {
                            print("Kakao")
                        }, label: {
                            Text("Kakao")
                                .frame(width: 300, height: 44)
                        })
                        .border(.black)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.4)
                .padding(.top)
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
    private func performSignInWithApple(){
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = signInWithAppleDelegate
        controller.performRequests()
        signInWithAppleDelegate.completion = { result in
            if (result == "success") {
                DispatchQueue.main.async {
                    opData.checkLoginStatus()
                }
            } else {
               print("안됨")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

