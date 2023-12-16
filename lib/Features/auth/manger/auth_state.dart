abstract class Auth{}
class AuthInitial extends Auth {}

//Login
class LoginSuccess extends Auth{}
class LoginLoading extends Auth{}
class LoginError extends Auth{
  final String error;
  LoginError({required this.error});
}
//Register
class RegisterSuccess extends Auth{}
class RegisterLoading extends Auth{}
class RegisterError extends Auth{}

// CreateRegister

class CreateRegisterSuccessstate extends Auth{}
class CreateRegisterError extends Auth{
  final String error;
  CreateRegisterError({required this.error});
}