//
//  ContentView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 01/10/2022.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestoreSwift

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

struct LoginView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    
    @State var shouldShowImagePicker = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack(spacing: 16){
                    
                    Picker(selection: $isLoginMode, label: Text("picker here")) {
                        Text("Log in").tag(true)
                        Text("Create Account").tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if !isLoginMode {
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            
                            VStack{
                                if let image = self.image{
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width:78, height:78)
                                        .cornerRadius(32)
                                } else{
                                    Image(systemName: "x.squareroot").foregroundColor(Color.black).padding().font(.system(size:78)).foregroundColor(Color(.label))
                                }
                            }
                        }
                    } else{
                        Button {
                        } label: {
                            Image(systemName: "sum").foregroundColor(Color.black).padding().font(.system(size:78))
                        }
                    }
                    
                    Group{
                        TextField("Email", text:$email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text:$password)
                    }.padding(8).background(Color.white)

                    
                    Button {
                        handleAction()
                    } label: {
                        HStack{
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account").foregroundColor(.white).padding(.vertical, 8)
                            Spacer()
                        }.background(Color.black)
                    }
                    
                    Text(self.loginStatusMessage).foregroundColor(.red)
                    
                }.padding()

                
            }.navigationTitle(isLoginMode ? "Log In" : "Create Account")
                .background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
        }.fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
            ImagePicker(image: $image)
        }
    }
    
    @State var image: UIImage?
    
    private func handleAction() {
        if isLoginMode{
            loginAccount()
        } else{
            createNewAccount()
        }
    }
    
    private func loginAccount() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if let err = error {
                print("Failed to Sign in: ", err)
                self.loginStatusMessage = "Failed to Sign in: \(err)"
                return
            }
            
            print("Successfully Signed in \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully Signed in \(result?.user.uid ?? "")"
        }
    }
    
    @State var loginStatusMessage = ""
    
    private func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if let err = error {
                print("Failed to create user: ", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                return
            }
            
            print("Successfully created user \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully created user \(result?.user.uid ?? "")"
        }
    }
}

struct ContentView_Previews_1: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
