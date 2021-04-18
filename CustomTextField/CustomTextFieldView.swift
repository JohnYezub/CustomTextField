//
//  CustomTextFieldView.swift
//  CustomTextField
//
//  Created by Evgeny on 17.04.2021.
//

import SwiftUI

struct CustomTextFieldView: View {
    ///add placeholder text if needed, default - no text
    var placeholderText: String = ""
    ///use it for password text
    var isSecuredField = false

    @Binding var text: String
    //The selection state
    @Binding var isActive: Bool

    @State private var hidePass: Bool = true

    var body: some View {
        HStack {
            ZStack {
                TextField(placeholderText, text: $text)
                    .opacity((isSecuredField && hidePass) ? 0 : 1)

                SecureField(placeholderText, text: $text)
                    .opacity((isSecuredField && hidePass) ? 1 : 0)
            }
            .disableAutocorrection(true)
            //Text color
            .foregroundColor(Color.white)
            .padding(.horizontal)

            Spacer()

            //Eye icon button
            if isSecuredField {
                Button (action: {
                    hidePass.toggle()
                }) {
                    Image(systemName: hidePass ? "eye.slash" : "eye")
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .padding(.trailing)
                }
            }
        }
        //Height, background view, foreground color and border
        .frame(height: 40)
        .background(RoundedRectangle(cornerRadius: 40))
        .foregroundColor(Color.white.opacity(0.2))
        .overlay(RoundedRectangle(cornerRadius: 40).stroke(isActive ? Color.white : Color.clear, lineWidth: 2))
    }
}

