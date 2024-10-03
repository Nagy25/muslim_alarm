import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muslim_alarm/core/failures/failure.dart';
import 'package:muslim_alarm/features/prayer_alarm/domain/entities/timings.dart';

part 'times_state.freezed.dart';

extension TimingsSateExt on TimesState {
  bool get isLoading => this is _Loading;
  bool get isSuccess => this is _Success;
  bool get isFailure => this is _Failure;
  Timings? get timings => isSuccess ? (this as _Success).timings : null;
  Failure? get failure => isFailure ? (this as _Failure).failure : null;
}

@freezed
class TimesState with _$TimesState {
  const factory TimesState.initial() = _Initial;
  const factory TimesState.loading() = _Loading;
  const factory TimesState.success(Timings timings) = _Success;
  const factory TimesState.failure(Failure failure) = _Failure;
}
