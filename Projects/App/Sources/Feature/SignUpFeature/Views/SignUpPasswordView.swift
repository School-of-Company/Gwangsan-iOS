import SwiftUI

struct SignUpPasswordView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var confirmPassword: String = ""
    @State private var showPasswordError: Bool = false
    @State private var showConfirmError: Bool = false
    @State private var shouldNavigate: Bool = false

    private var isReadyForNavigation: Bool {
        !viewModel.password.isEmpty && !confirmPassword.isEmpty
    }

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 54) {
                    VStack(alignment: .leading) {
                        Text("회원가입")
                            .gwangsanFont(style: .titleMedium)
                        Text("비밀번호를 입력해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    
                    VStack(spacing: 32) {
                        GwangsanTextField(
                            "비밀번호를 입력해주세요",
                            text: $viewModel.password,
                            title: "비밀번호",
                            horizontalPadding: 24,
                            isError: $showPasswordError,
                            errorMessage: "비밀번호를 입력해주세요"
                        ) {
                            showPasswordError = viewModel.password.isEmpty
                        }

                        GwangsanTextField(
                            "비밀번호를 다시 입력해주세요",
                            text: $confirmPassword,
                            title: "비밀번호 재입력",
                            horizontalPadding: 24,
                            isError: $showConfirmError,
                            errorMessage: "비밀번호가 일치하지 않습니다"
                        ) {
                            showConfirmError = confirmPassword != viewModel.password
                        }
                    }
                }
                .padding(.top, 16)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: isReadyForNavigation,
                    horizontalPadding: 24,
                    height: 52,
                    style: .filled
                ) {
                    if viewModel.password.isEmpty {
                        showPasswordError = true
                        return
                    }
                    if confirmPassword.isEmpty {
                        showConfirmError = true
                        return
                    }
                    if viewModel.password == confirmPassword {
                        showPasswordError = false
                        showConfirmError = false
                        shouldNavigate = true
                    } else {
                        showConfirmError = true
                    }
                }
                .padding(.bottom, 30)
            }
            .modifier(BackButtonModifier())
            .navigationDestination(isPresented: $shouldNavigate) {
                PhoneVerificationView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    SignUpPasswordView(viewModel: SignUpViewModel())
}
