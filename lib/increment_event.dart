part of 'increment_bloc.dart';

@immutable
sealed class IncrementEvent {}

final class Increment extends IncrementEvent {
  @override
  String toString() {
    return 'IncrementEvent {}';
  }
}
