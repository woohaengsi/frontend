//
//  SignInWithAppleDelegate.swift
//  MyGrowthDiary
//
//  Created by Hyung Seo Han on 2023/07/10.
//

//import UIKit
import AuthenticationServices

class SignInWithAppleDelegate: NSObject, ASAuthorizationControllerDelegate {
    var completion: ((String) -> Void)?
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let _ = appleIDCredential.identityToken!.base64EncodedString()
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            // Create request parameters as JSON
            let parameters: [String: Any] = [
                            "nickname": fullName?.description ?? "",
                            "email": email ?? "",
                            "profileImageUrl": ""
                            ]

            // Convert parameters to JSON data, 실패하면 리턴
            guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
                print("Failed to create JSON data")
                return
            }

            print(jsonData.self.description)
            
            // Create the HTTP request
            let url = URL(string: "http://api.mygrowthdiary.xyz/login/apple")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            // Send the request and handle the response
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            //에러 발생하면 리턴
            if let error = error {
                print("Request error: \(error)")
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                if let completion = self.completion {
                    completion("response Failed")
                }
                return
            }
                
            print(httpResponse)
                
            //성공하면 이걸로 반환
            if let accessToken = httpResponse.value(forHTTPHeaderField: "Access-Token"),
               let refreshToken = httpResponse.value(forHTTPHeaderField: "Refresh-Token") {
                UserDefaults.standard.set(accessToken, forKey: "accessToken")
                UserDefaults.standard.set(refreshToken, forKey: "refreshToken")
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                print("성공 이후 값",UserDefaults.standard.bool(forKey: "isLoggedIn"))
                
                if let completion = self.completion {
                    completion("success")
                }
                
                }
            }
            task.resume()
        }
    }

    //실패했을 때
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle sign-in error
        print("Sign-in with Apple failed: \(error.localizedDescription)")
    }
}

