//
//  ContentView.swift
//  CustomTextField
//
//  Created by Evgeny on 17.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isUserSelected: Bool = false
    @State private var isPasswordSelected: Bool = false
    
    var body: some View {
        ZStack {
            //The background
            Color.blue
                .ignoresSafeArea()

            VStack(spacing: 8) {
                CustomTextFieldView(placeholderText: "username", text: $username, isActive: $isUserSelected)
                    .onTapGesture {
                        isUserSelected = true
                        isPasswordSelected = false
                    }

                CustomTextFieldView(placeholderText: "password", isSecuredField: true, text: $password, isActive: $isPasswordSelected)
                    .onTapGesture {
                        isUserSelected = false
                        isPasswordSelected = true
                    }
            }
            .padding()
        }
        //Hides keyboard and remove selections
        .onTapGesture {
            UIResponder.currentFirstResponder?.resignFirstResponder()
            isUserSelected = false
            isPasswordSelected = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
