import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_code_state.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  SendCodeCubit() : super(SendCodeInitial());
}
