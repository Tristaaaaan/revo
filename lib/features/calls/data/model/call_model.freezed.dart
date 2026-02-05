// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallModel {

 String get id; String get callerName; String get callerNumber; String? get callerAvatarUrl; CallType get callType; int get callTime; String get description; int? get callTimeOut; int? get callDuration;
/// Create a copy of CallModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallModelCopyWith<CallModel> get copyWith => _$CallModelCopyWithImpl<CallModel>(this as CallModel, _$identity);

  /// Serializes this CallModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallModel&&(identical(other.id, id) || other.id == id)&&(identical(other.callerName, callerName) || other.callerName == callerName)&&(identical(other.callerNumber, callerNumber) || other.callerNumber == callerNumber)&&(identical(other.callerAvatarUrl, callerAvatarUrl) || other.callerAvatarUrl == callerAvatarUrl)&&(identical(other.callType, callType) || other.callType == callType)&&(identical(other.callTime, callTime) || other.callTime == callTime)&&(identical(other.description, description) || other.description == description)&&(identical(other.callTimeOut, callTimeOut) || other.callTimeOut == callTimeOut)&&(identical(other.callDuration, callDuration) || other.callDuration == callDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,callerName,callerNumber,callerAvatarUrl,callType,callTime,description,callTimeOut,callDuration);

@override
String toString() {
  return 'CallModel(id: $id, callerName: $callerName, callerNumber: $callerNumber, callerAvatarUrl: $callerAvatarUrl, callType: $callType, callTime: $callTime, description: $description, callTimeOut: $callTimeOut, callDuration: $callDuration)';
}


}

/// @nodoc
abstract mixin class $CallModelCopyWith<$Res>  {
  factory $CallModelCopyWith(CallModel value, $Res Function(CallModel) _then) = _$CallModelCopyWithImpl;
@useResult
$Res call({
 String id, String callerName, String callerNumber, String? callerAvatarUrl, CallType callType, int callTime, String description, int? callTimeOut, int? callDuration
});




}
/// @nodoc
class _$CallModelCopyWithImpl<$Res>
    implements $CallModelCopyWith<$Res> {
  _$CallModelCopyWithImpl(this._self, this._then);

  final CallModel _self;
  final $Res Function(CallModel) _then;

/// Create a copy of CallModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? callerName = null,Object? callerNumber = null,Object? callerAvatarUrl = freezed,Object? callType = null,Object? callTime = null,Object? description = null,Object? callTimeOut = freezed,Object? callDuration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,callerName: null == callerName ? _self.callerName : callerName // ignore: cast_nullable_to_non_nullable
as String,callerNumber: null == callerNumber ? _self.callerNumber : callerNumber // ignore: cast_nullable_to_non_nullable
as String,callerAvatarUrl: freezed == callerAvatarUrl ? _self.callerAvatarUrl : callerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,callType: null == callType ? _self.callType : callType // ignore: cast_nullable_to_non_nullable
as CallType,callTime: null == callTime ? _self.callTime : callTime // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,callTimeOut: freezed == callTimeOut ? _self.callTimeOut : callTimeOut // ignore: cast_nullable_to_non_nullable
as int?,callDuration: freezed == callDuration ? _self.callDuration : callDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CallModel].
extension CallModelPatterns on CallModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallModel value)  $default,){
final _that = this;
switch (_that) {
case _CallModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallModel value)?  $default,){
final _that = this;
switch (_that) {
case _CallModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String callerName,  String callerNumber,  String? callerAvatarUrl,  CallType callType,  int callTime,  String description,  int? callTimeOut,  int? callDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallModel() when $default != null:
return $default(_that.id,_that.callerName,_that.callerNumber,_that.callerAvatarUrl,_that.callType,_that.callTime,_that.description,_that.callTimeOut,_that.callDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String callerName,  String callerNumber,  String? callerAvatarUrl,  CallType callType,  int callTime,  String description,  int? callTimeOut,  int? callDuration)  $default,) {final _that = this;
switch (_that) {
case _CallModel():
return $default(_that.id,_that.callerName,_that.callerNumber,_that.callerAvatarUrl,_that.callType,_that.callTime,_that.description,_that.callTimeOut,_that.callDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String callerName,  String callerNumber,  String? callerAvatarUrl,  CallType callType,  int callTime,  String description,  int? callTimeOut,  int? callDuration)?  $default,) {final _that = this;
switch (_that) {
case _CallModel() when $default != null:
return $default(_that.id,_that.callerName,_that.callerNumber,_that.callerAvatarUrl,_that.callType,_that.callTime,_that.description,_that.callTimeOut,_that.callDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallModel extends CallModel {
  const _CallModel({required this.id, required this.callerName, required this.callerNumber, this.callerAvatarUrl, required this.callType, required this.callTime, required this.description, this.callTimeOut, this.callDuration}): super._();
  factory _CallModel.fromJson(Map<String, dynamic> json) => _$CallModelFromJson(json);

@override final  String id;
@override final  String callerName;
@override final  String callerNumber;
@override final  String? callerAvatarUrl;
@override final  CallType callType;
@override final  int callTime;
@override final  String description;
@override final  int? callTimeOut;
@override final  int? callDuration;

/// Create a copy of CallModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallModelCopyWith<_CallModel> get copyWith => __$CallModelCopyWithImpl<_CallModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallModel&&(identical(other.id, id) || other.id == id)&&(identical(other.callerName, callerName) || other.callerName == callerName)&&(identical(other.callerNumber, callerNumber) || other.callerNumber == callerNumber)&&(identical(other.callerAvatarUrl, callerAvatarUrl) || other.callerAvatarUrl == callerAvatarUrl)&&(identical(other.callType, callType) || other.callType == callType)&&(identical(other.callTime, callTime) || other.callTime == callTime)&&(identical(other.description, description) || other.description == description)&&(identical(other.callTimeOut, callTimeOut) || other.callTimeOut == callTimeOut)&&(identical(other.callDuration, callDuration) || other.callDuration == callDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,callerName,callerNumber,callerAvatarUrl,callType,callTime,description,callTimeOut,callDuration);

@override
String toString() {
  return 'CallModel(id: $id, callerName: $callerName, callerNumber: $callerNumber, callerAvatarUrl: $callerAvatarUrl, callType: $callType, callTime: $callTime, description: $description, callTimeOut: $callTimeOut, callDuration: $callDuration)';
}


}

/// @nodoc
abstract mixin class _$CallModelCopyWith<$Res> implements $CallModelCopyWith<$Res> {
  factory _$CallModelCopyWith(_CallModel value, $Res Function(_CallModel) _then) = __$CallModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String callerName, String callerNumber, String? callerAvatarUrl, CallType callType, int callTime, String description, int? callTimeOut, int? callDuration
});




}
/// @nodoc
class __$CallModelCopyWithImpl<$Res>
    implements _$CallModelCopyWith<$Res> {
  __$CallModelCopyWithImpl(this._self, this._then);

  final _CallModel _self;
  final $Res Function(_CallModel) _then;

/// Create a copy of CallModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? callerName = null,Object? callerNumber = null,Object? callerAvatarUrl = freezed,Object? callType = null,Object? callTime = null,Object? description = null,Object? callTimeOut = freezed,Object? callDuration = freezed,}) {
  return _then(_CallModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,callerName: null == callerName ? _self.callerName : callerName // ignore: cast_nullable_to_non_nullable
as String,callerNumber: null == callerNumber ? _self.callerNumber : callerNumber // ignore: cast_nullable_to_non_nullable
as String,callerAvatarUrl: freezed == callerAvatarUrl ? _self.callerAvatarUrl : callerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,callType: null == callType ? _self.callType : callType // ignore: cast_nullable_to_non_nullable
as CallType,callTime: null == callTime ? _self.callTime : callTime // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,callTimeOut: freezed == callTimeOut ? _self.callTimeOut : callTimeOut // ignore: cast_nullable_to_non_nullable
as int?,callDuration: freezed == callDuration ? _self.callDuration : callDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
