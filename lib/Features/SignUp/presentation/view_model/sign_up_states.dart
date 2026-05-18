

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_states.freezed.dart';
@Freezed()
class SignUpStates<T> with _$SignUpStates{

  const factory SignUpStates.initial() = _Initial;
  const factory SignUpStates.loading() = SignUpLoading;
  const factory SignUpStates.success(T data) = SignUpSuccess<T>;
  const factory SignUpStates.error({required String error}) = SignUpError;

}