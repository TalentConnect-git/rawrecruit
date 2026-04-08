// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageDetail {

 String? get currency; int? get totalCTC; int? get fixedPay; int? get joiningBonus;
/// Create a copy of PackageDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageDetailCopyWith<PackageDetail> get copyWith => _$PackageDetailCopyWithImpl<PackageDetail>(this as PackageDetail, _$identity);

  /// Serializes this PackageDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageDetail&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC)&&(identical(other.fixedPay, fixedPay) || other.fixedPay == fixedPay)&&(identical(other.joiningBonus, joiningBonus) || other.joiningBonus == joiningBonus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,totalCTC,fixedPay,joiningBonus);

@override
String toString() {
  return 'PackageDetail(currency: $currency, totalCTC: $totalCTC, fixedPay: $fixedPay, joiningBonus: $joiningBonus)';
}


}

/// @nodoc
abstract mixin class $PackageDetailCopyWith<$Res>  {
  factory $PackageDetailCopyWith(PackageDetail value, $Res Function(PackageDetail) _then) = _$PackageDetailCopyWithImpl;
@useResult
$Res call({
 String? currency, int? totalCTC, int? fixedPay, int? joiningBonus
});




}
/// @nodoc
class _$PackageDetailCopyWithImpl<$Res>
    implements $PackageDetailCopyWith<$Res> {
  _$PackageDetailCopyWithImpl(this._self, this._then);

  final PackageDetail _self;
  final $Res Function(PackageDetail) _then;

/// Create a copy of PackageDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = freezed,Object? totalCTC = freezed,Object? fixedPay = freezed,Object? joiningBonus = freezed,}) {
  return _then(_self.copyWith(
currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int?,fixedPay: freezed == fixedPay ? _self.fixedPay : fixedPay // ignore: cast_nullable_to_non_nullable
as int?,joiningBonus: freezed == joiningBonus ? _self.joiningBonus : joiningBonus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageDetail].
extension PackageDetailPatterns on PackageDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageDetail value)  $default,){
final _that = this;
switch (_that) {
case _PackageDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PackageDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? currency,  int? totalCTC,  int? fixedPay,  int? joiningBonus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageDetail() when $default != null:
return $default(_that.currency,_that.totalCTC,_that.fixedPay,_that.joiningBonus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? currency,  int? totalCTC,  int? fixedPay,  int? joiningBonus)  $default,) {final _that = this;
switch (_that) {
case _PackageDetail():
return $default(_that.currency,_that.totalCTC,_that.fixedPay,_that.joiningBonus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? currency,  int? totalCTC,  int? fixedPay,  int? joiningBonus)?  $default,) {final _that = this;
switch (_that) {
case _PackageDetail() when $default != null:
return $default(_that.currency,_that.totalCTC,_that.fixedPay,_that.joiningBonus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageDetail implements PackageDetail {
  const _PackageDetail({this.currency, this.totalCTC, this.fixedPay, this.joiningBonus});
  factory _PackageDetail.fromJson(Map<String, dynamic> json) => _$PackageDetailFromJson(json);

@override final  String? currency;
@override final  int? totalCTC;
@override final  int? fixedPay;
@override final  int? joiningBonus;

/// Create a copy of PackageDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageDetailCopyWith<_PackageDetail> get copyWith => __$PackageDetailCopyWithImpl<_PackageDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageDetail&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC)&&(identical(other.fixedPay, fixedPay) || other.fixedPay == fixedPay)&&(identical(other.joiningBonus, joiningBonus) || other.joiningBonus == joiningBonus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,totalCTC,fixedPay,joiningBonus);

@override
String toString() {
  return 'PackageDetail(currency: $currency, totalCTC: $totalCTC, fixedPay: $fixedPay, joiningBonus: $joiningBonus)';
}


}

/// @nodoc
abstract mixin class _$PackageDetailCopyWith<$Res> implements $PackageDetailCopyWith<$Res> {
  factory _$PackageDetailCopyWith(_PackageDetail value, $Res Function(_PackageDetail) _then) = __$PackageDetailCopyWithImpl;
@override @useResult
$Res call({
 String? currency, int? totalCTC, int? fixedPay, int? joiningBonus
});




}
/// @nodoc
class __$PackageDetailCopyWithImpl<$Res>
    implements _$PackageDetailCopyWith<$Res> {
  __$PackageDetailCopyWithImpl(this._self, this._then);

  final _PackageDetail _self;
  final $Res Function(_PackageDetail) _then;

/// Create a copy of PackageDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = freezed,Object? totalCTC = freezed,Object? fixedPay = freezed,Object? joiningBonus = freezed,}) {
  return _then(_PackageDetail(
currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int?,fixedPay: freezed == fixedPay ? _self.fixedPay : fixedPay // ignore: cast_nullable_to_non_nullable
as int?,joiningBonus: freezed == joiningBonus ? _self.joiningBonus : joiningBonus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
