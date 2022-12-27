abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{}
class SignUpErrorState extends SignUpStates{}
class SocialSignUpChangePasswordVisibilityState extends SignUpStates{}
////////create user states ///////
class CreateUserLoadingState extends SignUpStates{}
class CreateUserSuccessState extends SignUpStates{}
class CreateUserErrorState extends SignUpStates{}