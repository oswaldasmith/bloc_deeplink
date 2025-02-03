part of 'increment_bloc.dart';

@immutable
sealed class IncrementState {
  const IncrementState(this.counter);
  final int counter;

  @override
  List<Object> get props => [counter];
}

final class IncrementInitial extends IncrementState {
  const IncrementInitial(super.counter);
}

final class IncrementValue extends IncrementState {
  const IncrementValue(super.counter);

  @override
  String toString() {
    // TODO: implement toString
    return 'IncrementValue {counter: $counter}';
  }

}
