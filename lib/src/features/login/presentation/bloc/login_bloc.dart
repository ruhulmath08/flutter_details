import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 2));
      if (event.email == 'abc' && event.password == '123456') {
        emit(SuccessState());
      } else {
        emit(ErrorState());
      }
    });
  }
}
