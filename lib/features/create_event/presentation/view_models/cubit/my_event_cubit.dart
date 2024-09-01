import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventos/features/create_event/data/models/my_event.dart';
import 'package:eventos/features/create_event/data/repos/create_event_repo.dart';

part 'my_event_state.dart';

class MyEventCubit extends Cubit<MyEventState> {
  MyEventCubit(this.createEventRepo) : super(MyEventInitial());
  final CreateEventRepo createEventRepo;

  Future<void> fetchMyEvents() async {
    emit(MyEventLoading());
    var response = await createEventRepo.myEvent();
    response.fold((fail) => emit(MyEventFailure(errMessage: fail.errMessage)),
        (suc) => emit(MyEventLoaded(myEventsModel: suc)));
  }
}
