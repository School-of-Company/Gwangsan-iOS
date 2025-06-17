import SwiftUI

struct SignUpPasswordView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var confirmPassword: String = ""
    @State private var showPasswordError: Bool = false
    @State private var showConfirmError: Bool = false

    func isValid() -> Bool {
        return !viewModel.password.isEmpty
            && viewModel.password == confirmPassword
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
                            errorMessage: "비밀번호를 입력해주세요",
                            onSubmit: {
                                // 엔터 시 빈 값 검증
                                showPasswordError = viewModel.password.isEmpty
                            }
                        )
                        // 빈 값일 때도 실시간으로 에러 상태 업데이트
                        .onChange(of: viewModel.password) { newValue in
                            showPasswordError = newValue.isEmpty
                            // 재입력 필드도 다시 검증
                            showConfirmError = !confirmPassword.isEmpty && confirmPassword != newValue
                        }

                        GwangsanTextField(
                            "비밀번호를 다시 입력해주세요",
                            text: $confirmPassword,
                            title: "비밀번호 재입력",
                            horizontalPadding: 24,
                            isError: $showConfirmError,
                            errorMessage: "비밀번호가 일치하지 않습니다",
                            onSubmit: {
                                showConfirmError = confirmPassword != viewModel.password
                            }
                        )
                        // 재입력 값이 바뀔 때마다 실시간 비교
                        .onChange(of: confirmPassword) { newValue in
                            showConfirmError = newValue != viewModel.password
                        }
                    }
                }
                .padding(.top, 16)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: isValid(),
                    horizontalPadding: 24,
                    height: 52,
                    style: .filled,
                    destination: PhoneVerificationView(viewModel: viewModel)
                )
                .padding(.bottom, 30)
            }
            .modifier(BackButtonModifier())
        }
    }
}

#Preview {
    SignUpPasswordView(viewModel: SignUpViewModel())
}

