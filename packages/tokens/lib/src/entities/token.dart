
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';

@freezed
class Token with _$Token {

  const factory Token({
    required String id,
    required String name,
    required String imageUrl,
    required bool isSusspicious,
  }) = _Token;
  const Token._();

}
