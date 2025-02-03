import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  int currentValue ;
  //int startAt;
  IncrementBloc(this.currentValue)
  : super(IncrementInitial(currentValue)) {
    on<Increment>((IncrementEvent event, Emitter<IncrementState> emit) {
      print(event);
      print(currentValue);
      //var newValue = IncrementValue(currentValue);
      emit(IncrementValue(currentValue++));

    });
  }
}
