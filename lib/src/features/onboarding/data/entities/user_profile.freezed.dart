// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

@JsonKey(name: '_id') String? get id; String? get userId;@JsonKey(name: '__v') int? get v; List<Achievement>? get achievements; List<Award>? get awards; List<Publication>? get publications; String? get createdAt; String? get updatedAt; String? get profileImage; String? get currentCompany; String? get noticePeriod; List<String>? get domainKnowledge; List<String>? get employmentType; List<String>? get experiences; List<String>? get industry; List<String>? get internationalExperience; List<String>? get jobRoles; List<String>? get languagesKnown; List<String>? get leadership; List<String>? get locations; List<String>? get lookingFor; String? get resume; List<String>? get skills; List<String>? get toolsAndPlatforms; String? get about; String? get certifications; String? get cgpa; String? get college; String? get degree; String? get degreeCertificate; String? get email; String? get gender; String? get github; String? get linkedin; String? get name; String? get openToShift; String? get phone; String? get portfolio; String? get profileType; String? get referralSource; String? get semester; bool? get servingNoticePeriod; String? get specialization; String? get yearOfGraduation; String? get currentSalaryAmount; String? get currentSalaryCurrency; String? get dob; String? get ethnicity; String? get expectedSalaryAmount; String? get expectedSalaryCurrency; String? get maritalStatus; String? get visaStatus;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.v, v) || other.v == v)&&const DeepCollectionEquality().equals(other.achievements, achievements)&&const DeepCollectionEquality().equals(other.awards, awards)&&const DeepCollectionEquality().equals(other.publications, publications)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.noticePeriod, noticePeriod) || other.noticePeriod == noticePeriod)&&const DeepCollectionEquality().equals(other.domainKnowledge, domainKnowledge)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.experiences, experiences)&&const DeepCollectionEquality().equals(other.industry, industry)&&const DeepCollectionEquality().equals(other.internationalExperience, internationalExperience)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles)&&const DeepCollectionEquality().equals(other.languagesKnown, languagesKnown)&&const DeepCollectionEquality().equals(other.leadership, leadership)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.lookingFor, lookingFor)&&(identical(other.resume, resume) || other.resume == resume)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.toolsAndPlatforms, toolsAndPlatforms)&&(identical(other.about, about) || other.about == about)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.college, college) || other.college == college)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.degreeCertificate, degreeCertificate) || other.degreeCertificate == degreeCertificate)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedin, linkedin) || other.linkedin == linkedin)&&(identical(other.name, name) || other.name == name)&&(identical(other.openToShift, openToShift) || other.openToShift == openToShift)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.profileType, profileType) || other.profileType == profileType)&&(identical(other.referralSource, referralSource) || other.referralSource == referralSource)&&(identical(other.semester, semester) || other.semester == semester)&&(identical(other.servingNoticePeriod, servingNoticePeriod) || other.servingNoticePeriod == servingNoticePeriod)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.yearOfGraduation, yearOfGraduation) || other.yearOfGraduation == yearOfGraduation)&&(identical(other.currentSalaryAmount, currentSalaryAmount) || other.currentSalaryAmount == currentSalaryAmount)&&(identical(other.currentSalaryCurrency, currentSalaryCurrency) || other.currentSalaryCurrency == currentSalaryCurrency)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.ethnicity, ethnicity) || other.ethnicity == ethnicity)&&(identical(other.expectedSalaryAmount, expectedSalaryAmount) || other.expectedSalaryAmount == expectedSalaryAmount)&&(identical(other.expectedSalaryCurrency, expectedSalaryCurrency) || other.expectedSalaryCurrency == expectedSalaryCurrency)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.visaStatus, visaStatus) || other.visaStatus == visaStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,v,const DeepCollectionEquality().hash(achievements),const DeepCollectionEquality().hash(awards),const DeepCollectionEquality().hash(publications),createdAt,updatedAt,profileImage,currentCompany,noticePeriod,const DeepCollectionEquality().hash(domainKnowledge),const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(experiences),const DeepCollectionEquality().hash(industry),const DeepCollectionEquality().hash(internationalExperience),const DeepCollectionEquality().hash(jobRoles),const DeepCollectionEquality().hash(languagesKnown),const DeepCollectionEquality().hash(leadership),const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(lookingFor),resume,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(toolsAndPlatforms),about,certifications,cgpa,college,degree,degreeCertificate,email,gender,github,linkedin,name,openToShift,phone,portfolio,profileType,referralSource,semester,servingNoticePeriod,specialization,yearOfGraduation,currentSalaryAmount,currentSalaryCurrency,dob,ethnicity,expectedSalaryAmount,expectedSalaryCurrency,maritalStatus,visaStatus]);

@override
String toString() {
  return 'UserProfile(id: $id, userId: $userId, v: $v, achievements: $achievements, awards: $awards, publications: $publications, createdAt: $createdAt, updatedAt: $updatedAt, profileImage: $profileImage, currentCompany: $currentCompany, noticePeriod: $noticePeriod, domainKnowledge: $domainKnowledge, employmentType: $employmentType, experiences: $experiences, industry: $industry, internationalExperience: $internationalExperience, jobRoles: $jobRoles, languagesKnown: $languagesKnown, leadership: $leadership, locations: $locations, lookingFor: $lookingFor, resume: $resume, skills: $skills, toolsAndPlatforms: $toolsAndPlatforms, about: $about, certifications: $certifications, cgpa: $cgpa, college: $college, degree: $degree, degreeCertificate: $degreeCertificate, email: $email, gender: $gender, github: $github, linkedin: $linkedin, name: $name, openToShift: $openToShift, phone: $phone, portfolio: $portfolio, profileType: $profileType, referralSource: $referralSource, semester: $semester, servingNoticePeriod: $servingNoticePeriod, specialization: $specialization, yearOfGraduation: $yearOfGraduation, currentSalaryAmount: $currentSalaryAmount, currentSalaryCurrency: $currentSalaryCurrency, dob: $dob, ethnicity: $ethnicity, expectedSalaryAmount: $expectedSalaryAmount, expectedSalaryCurrency: $expectedSalaryCurrency, maritalStatus: $maritalStatus, visaStatus: $visaStatus)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? userId,@JsonKey(name: '__v') int? v, List<Achievement>? achievements, List<Award>? awards, List<Publication>? publications, String? createdAt, String? updatedAt, String? profileImage, String? currentCompany, String? noticePeriod, List<String>? domainKnowledge, List<String>? employmentType, List<String>? experiences, List<String>? industry, List<String>? internationalExperience, List<String>? jobRoles, List<String>? languagesKnown, List<String>? leadership, List<String>? locations, List<String>? lookingFor, String? resume, List<String>? skills, List<String>? toolsAndPlatforms, String? about, String? certifications, String? cgpa, String? college, String? degree, String? degreeCertificate, String? email, String? gender, String? github, String? linkedin, String? name, String? openToShift, String? phone, String? portfolio, String? profileType, String? referralSource, String? semester, bool? servingNoticePeriod, String? specialization, String? yearOfGraduation, String? currentSalaryAmount, String? currentSalaryCurrency, String? dob, String? ethnicity, String? expectedSalaryAmount, String? expectedSalaryCurrency, String? maritalStatus, String? visaStatus
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? v = freezed,Object? achievements = freezed,Object? awards = freezed,Object? publications = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? profileImage = freezed,Object? currentCompany = freezed,Object? noticePeriod = freezed,Object? domainKnowledge = freezed,Object? employmentType = freezed,Object? experiences = freezed,Object? industry = freezed,Object? internationalExperience = freezed,Object? jobRoles = freezed,Object? languagesKnown = freezed,Object? leadership = freezed,Object? locations = freezed,Object? lookingFor = freezed,Object? resume = freezed,Object? skills = freezed,Object? toolsAndPlatforms = freezed,Object? about = freezed,Object? certifications = freezed,Object? cgpa = freezed,Object? college = freezed,Object? degree = freezed,Object? degreeCertificate = freezed,Object? email = freezed,Object? gender = freezed,Object? github = freezed,Object? linkedin = freezed,Object? name = freezed,Object? openToShift = freezed,Object? phone = freezed,Object? portfolio = freezed,Object? profileType = freezed,Object? referralSource = freezed,Object? semester = freezed,Object? servingNoticePeriod = freezed,Object? specialization = freezed,Object? yearOfGraduation = freezed,Object? currentSalaryAmount = freezed,Object? currentSalaryCurrency = freezed,Object? dob = freezed,Object? ethnicity = freezed,Object? expectedSalaryAmount = freezed,Object? expectedSalaryCurrency = freezed,Object? maritalStatus = freezed,Object? visaStatus = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int?,achievements: freezed == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>?,awards: freezed == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as List<Award>?,publications: freezed == publications ? _self.publications : publications // ignore: cast_nullable_to_non_nullable
as List<Publication>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as String?,noticePeriod: freezed == noticePeriod ? _self.noticePeriod : noticePeriod // ignore: cast_nullable_to_non_nullable
as String?,domainKnowledge: freezed == domainKnowledge ? _self.domainKnowledge : domainKnowledge // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,experiences: freezed == experiences ? _self.experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<String>?,industry: freezed == industry ? _self.industry : industry // ignore: cast_nullable_to_non_nullable
as List<String>?,internationalExperience: freezed == internationalExperience ? _self.internationalExperience : internationalExperience // ignore: cast_nullable_to_non_nullable
as List<String>?,jobRoles: freezed == jobRoles ? _self.jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,languagesKnown: freezed == languagesKnown ? _self.languagesKnown : languagesKnown // ignore: cast_nullable_to_non_nullable
as List<String>?,leadership: freezed == leadership ? _self.leadership : leadership // ignore: cast_nullable_to_non_nullable
as List<String>?,locations: freezed == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<String>?,lookingFor: freezed == lookingFor ? _self.lookingFor : lookingFor // ignore: cast_nullable_to_non_nullable
as List<String>?,resume: freezed == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self.toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<String>?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,college: freezed == college ? _self.college : college // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,degreeCertificate: freezed == degreeCertificate ? _self.degreeCertificate : degreeCertificate // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,linkedin: freezed == linkedin ? _self.linkedin : linkedin // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,openToShift: freezed == openToShift ? _self.openToShift : openToShift // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String?,profileType: freezed == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String?,referralSource: freezed == referralSource ? _self.referralSource : referralSource // ignore: cast_nullable_to_non_nullable
as String?,semester: freezed == semester ? _self.semester : semester // ignore: cast_nullable_to_non_nullable
as String?,servingNoticePeriod: freezed == servingNoticePeriod ? _self.servingNoticePeriod : servingNoticePeriod // ignore: cast_nullable_to_non_nullable
as bool?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,yearOfGraduation: freezed == yearOfGraduation ? _self.yearOfGraduation : yearOfGraduation // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryAmount: freezed == currentSalaryAmount ? _self.currentSalaryAmount : currentSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryCurrency: freezed == currentSalaryCurrency ? _self.currentSalaryCurrency : currentSalaryCurrency // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,ethnicity: freezed == ethnicity ? _self.ethnicity : ethnicity // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryAmount: freezed == expectedSalaryAmount ? _self.expectedSalaryAmount : expectedSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryCurrency: freezed == expectedSalaryCurrency ? _self.expectedSalaryCurrency : expectedSalaryCurrency // ignore: cast_nullable_to_non_nullable
as String?,maritalStatus: freezed == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as String?,visaStatus: freezed == visaStatus ? _self.visaStatus : visaStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? userId, @JsonKey(name: '__v')  int? v,  List<Achievement>? achievements,  List<Award>? awards,  List<Publication>? publications,  String? createdAt,  String? updatedAt,  String? profileImage,  String? currentCompany,  String? noticePeriod,  List<String>? domainKnowledge,  List<String>? employmentType,  List<String>? experiences,  List<String>? industry,  List<String>? internationalExperience,  List<String>? jobRoles,  List<String>? languagesKnown,  List<String>? leadership,  List<String>? locations,  List<String>? lookingFor,  String? resume,  List<String>? skills,  List<String>? toolsAndPlatforms,  String? about,  String? certifications,  String? cgpa,  String? college,  String? degree,  String? degreeCertificate,  String? email,  String? gender,  String? github,  String? linkedin,  String? name,  String? openToShift,  String? phone,  String? portfolio,  String? profileType,  String? referralSource,  String? semester,  bool? servingNoticePeriod,  String? specialization,  String? yearOfGraduation,  String? currentSalaryAmount,  String? currentSalaryCurrency,  String? dob,  String? ethnicity,  String? expectedSalaryAmount,  String? expectedSalaryCurrency,  String? maritalStatus,  String? visaStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.userId,_that.v,_that.achievements,_that.awards,_that.publications,_that.createdAt,_that.updatedAt,_that.profileImage,_that.currentCompany,_that.noticePeriod,_that.domainKnowledge,_that.employmentType,_that.experiences,_that.industry,_that.internationalExperience,_that.jobRoles,_that.languagesKnown,_that.leadership,_that.locations,_that.lookingFor,_that.resume,_that.skills,_that.toolsAndPlatforms,_that.about,_that.certifications,_that.cgpa,_that.college,_that.degree,_that.degreeCertificate,_that.email,_that.gender,_that.github,_that.linkedin,_that.name,_that.openToShift,_that.phone,_that.portfolio,_that.profileType,_that.referralSource,_that.semester,_that.servingNoticePeriod,_that.specialization,_that.yearOfGraduation,_that.currentSalaryAmount,_that.currentSalaryCurrency,_that.dob,_that.ethnicity,_that.expectedSalaryAmount,_that.expectedSalaryCurrency,_that.maritalStatus,_that.visaStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? userId, @JsonKey(name: '__v')  int? v,  List<Achievement>? achievements,  List<Award>? awards,  List<Publication>? publications,  String? createdAt,  String? updatedAt,  String? profileImage,  String? currentCompany,  String? noticePeriod,  List<String>? domainKnowledge,  List<String>? employmentType,  List<String>? experiences,  List<String>? industry,  List<String>? internationalExperience,  List<String>? jobRoles,  List<String>? languagesKnown,  List<String>? leadership,  List<String>? locations,  List<String>? lookingFor,  String? resume,  List<String>? skills,  List<String>? toolsAndPlatforms,  String? about,  String? certifications,  String? cgpa,  String? college,  String? degree,  String? degreeCertificate,  String? email,  String? gender,  String? github,  String? linkedin,  String? name,  String? openToShift,  String? phone,  String? portfolio,  String? profileType,  String? referralSource,  String? semester,  bool? servingNoticePeriod,  String? specialization,  String? yearOfGraduation,  String? currentSalaryAmount,  String? currentSalaryCurrency,  String? dob,  String? ethnicity,  String? expectedSalaryAmount,  String? expectedSalaryCurrency,  String? maritalStatus,  String? visaStatus)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.userId,_that.v,_that.achievements,_that.awards,_that.publications,_that.createdAt,_that.updatedAt,_that.profileImage,_that.currentCompany,_that.noticePeriod,_that.domainKnowledge,_that.employmentType,_that.experiences,_that.industry,_that.internationalExperience,_that.jobRoles,_that.languagesKnown,_that.leadership,_that.locations,_that.lookingFor,_that.resume,_that.skills,_that.toolsAndPlatforms,_that.about,_that.certifications,_that.cgpa,_that.college,_that.degree,_that.degreeCertificate,_that.email,_that.gender,_that.github,_that.linkedin,_that.name,_that.openToShift,_that.phone,_that.portfolio,_that.profileType,_that.referralSource,_that.semester,_that.servingNoticePeriod,_that.specialization,_that.yearOfGraduation,_that.currentSalaryAmount,_that.currentSalaryCurrency,_that.dob,_that.ethnicity,_that.expectedSalaryAmount,_that.expectedSalaryCurrency,_that.maritalStatus,_that.visaStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? userId, @JsonKey(name: '__v')  int? v,  List<Achievement>? achievements,  List<Award>? awards,  List<Publication>? publications,  String? createdAt,  String? updatedAt,  String? profileImage,  String? currentCompany,  String? noticePeriod,  List<String>? domainKnowledge,  List<String>? employmentType,  List<String>? experiences,  List<String>? industry,  List<String>? internationalExperience,  List<String>? jobRoles,  List<String>? languagesKnown,  List<String>? leadership,  List<String>? locations,  List<String>? lookingFor,  String? resume,  List<String>? skills,  List<String>? toolsAndPlatforms,  String? about,  String? certifications,  String? cgpa,  String? college,  String? degree,  String? degreeCertificate,  String? email,  String? gender,  String? github,  String? linkedin,  String? name,  String? openToShift,  String? phone,  String? portfolio,  String? profileType,  String? referralSource,  String? semester,  bool? servingNoticePeriod,  String? specialization,  String? yearOfGraduation,  String? currentSalaryAmount,  String? currentSalaryCurrency,  String? dob,  String? ethnicity,  String? expectedSalaryAmount,  String? expectedSalaryCurrency,  String? maritalStatus,  String? visaStatus)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.userId,_that.v,_that.achievements,_that.awards,_that.publications,_that.createdAt,_that.updatedAt,_that.profileImage,_that.currentCompany,_that.noticePeriod,_that.domainKnowledge,_that.employmentType,_that.experiences,_that.industry,_that.internationalExperience,_that.jobRoles,_that.languagesKnown,_that.leadership,_that.locations,_that.lookingFor,_that.resume,_that.skills,_that.toolsAndPlatforms,_that.about,_that.certifications,_that.cgpa,_that.college,_that.degree,_that.degreeCertificate,_that.email,_that.gender,_that.github,_that.linkedin,_that.name,_that.openToShift,_that.phone,_that.portfolio,_that.profileType,_that.referralSource,_that.semester,_that.servingNoticePeriod,_that.specialization,_that.yearOfGraduation,_that.currentSalaryAmount,_that.currentSalaryCurrency,_that.dob,_that.ethnicity,_that.expectedSalaryAmount,_that.expectedSalaryCurrency,_that.maritalStatus,_that.visaStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({@JsonKey(name: '_id') this.id, this.userId, @JsonKey(name: '__v') this.v, final  List<Achievement>? achievements, final  List<Award>? awards, final  List<Publication>? publications, this.createdAt, this.updatedAt, this.profileImage, this.currentCompany, this.noticePeriod, final  List<String>? domainKnowledge, final  List<String>? employmentType, final  List<String>? experiences, final  List<String>? industry, final  List<String>? internationalExperience, final  List<String>? jobRoles, final  List<String>? languagesKnown, final  List<String>? leadership, final  List<String>? locations, final  List<String>? lookingFor, this.resume, final  List<String>? skills, final  List<String>? toolsAndPlatforms, this.about, this.certifications, this.cgpa, this.college, this.degree, this.degreeCertificate, this.email, this.gender, this.github, this.linkedin, this.name, this.openToShift, this.phone, this.portfolio, this.profileType, this.referralSource, this.semester, this.servingNoticePeriod, this.specialization, this.yearOfGraduation, this.currentSalaryAmount, this.currentSalaryCurrency, this.dob, this.ethnicity, this.expectedSalaryAmount, this.expectedSalaryCurrency, this.maritalStatus, this.visaStatus}): _achievements = achievements,_awards = awards,_publications = publications,_domainKnowledge = domainKnowledge,_employmentType = employmentType,_experiences = experiences,_industry = industry,_internationalExperience = internationalExperience,_jobRoles = jobRoles,_languagesKnown = languagesKnown,_leadership = leadership,_locations = locations,_lookingFor = lookingFor,_skills = skills,_toolsAndPlatforms = toolsAndPlatforms;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? userId;
@override@JsonKey(name: '__v') final  int? v;
 final  List<Achievement>? _achievements;
@override List<Achievement>? get achievements {
  final value = _achievements;
  if (value == null) return null;
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Award>? _awards;
@override List<Award>? get awards {
  final value = _awards;
  if (value == null) return null;
  if (_awards is EqualUnmodifiableListView) return _awards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Publication>? _publications;
@override List<Publication>? get publications {
  final value = _publications;
  if (value == null) return null;
  if (_publications is EqualUnmodifiableListView) return _publications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? profileImage;
@override final  String? currentCompany;
@override final  String? noticePeriod;
 final  List<String>? _domainKnowledge;
@override List<String>? get domainKnowledge {
  final value = _domainKnowledge;
  if (value == null) return null;
  if (_domainKnowledge is EqualUnmodifiableListView) return _domainKnowledge;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _employmentType;
@override List<String>? get employmentType {
  final value = _employmentType;
  if (value == null) return null;
  if (_employmentType is EqualUnmodifiableListView) return _employmentType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _experiences;
@override List<String>? get experiences {
  final value = _experiences;
  if (value == null) return null;
  if (_experiences is EqualUnmodifiableListView) return _experiences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _industry;
@override List<String>? get industry {
  final value = _industry;
  if (value == null) return null;
  if (_industry is EqualUnmodifiableListView) return _industry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _internationalExperience;
@override List<String>? get internationalExperience {
  final value = _internationalExperience;
  if (value == null) return null;
  if (_internationalExperience is EqualUnmodifiableListView) return _internationalExperience;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _jobRoles;
@override List<String>? get jobRoles {
  final value = _jobRoles;
  if (value == null) return null;
  if (_jobRoles is EqualUnmodifiableListView) return _jobRoles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _languagesKnown;
@override List<String>? get languagesKnown {
  final value = _languagesKnown;
  if (value == null) return null;
  if (_languagesKnown is EqualUnmodifiableListView) return _languagesKnown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _leadership;
@override List<String>? get leadership {
  final value = _leadership;
  if (value == null) return null;
  if (_leadership is EqualUnmodifiableListView) return _leadership;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _locations;
@override List<String>? get locations {
  final value = _locations;
  if (value == null) return null;
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _lookingFor;
@override List<String>? get lookingFor {
  final value = _lookingFor;
  if (value == null) return null;
  if (_lookingFor is EqualUnmodifiableListView) return _lookingFor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? resume;
 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _toolsAndPlatforms;
@override List<String>? get toolsAndPlatforms {
  final value = _toolsAndPlatforms;
  if (value == null) return null;
  if (_toolsAndPlatforms is EqualUnmodifiableListView) return _toolsAndPlatforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? about;
@override final  String? certifications;
@override final  String? cgpa;
@override final  String? college;
@override final  String? degree;
@override final  String? degreeCertificate;
@override final  String? email;
@override final  String? gender;
@override final  String? github;
@override final  String? linkedin;
@override final  String? name;
@override final  String? openToShift;
@override final  String? phone;
@override final  String? portfolio;
@override final  String? profileType;
@override final  String? referralSource;
@override final  String? semester;
@override final  bool? servingNoticePeriod;
@override final  String? specialization;
@override final  String? yearOfGraduation;
@override final  String? currentSalaryAmount;
@override final  String? currentSalaryCurrency;
@override final  String? dob;
@override final  String? ethnicity;
@override final  String? expectedSalaryAmount;
@override final  String? expectedSalaryCurrency;
@override final  String? maritalStatus;
@override final  String? visaStatus;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.v, v) || other.v == v)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&const DeepCollectionEquality().equals(other._awards, _awards)&&const DeepCollectionEquality().equals(other._publications, _publications)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.noticePeriod, noticePeriod) || other.noticePeriod == noticePeriod)&&const DeepCollectionEquality().equals(other._domainKnowledge, _domainKnowledge)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._experiences, _experiences)&&const DeepCollectionEquality().equals(other._industry, _industry)&&const DeepCollectionEquality().equals(other._internationalExperience, _internationalExperience)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles)&&const DeepCollectionEquality().equals(other._languagesKnown, _languagesKnown)&&const DeepCollectionEquality().equals(other._leadership, _leadership)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._lookingFor, _lookingFor)&&(identical(other.resume, resume) || other.resume == resume)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._toolsAndPlatforms, _toolsAndPlatforms)&&(identical(other.about, about) || other.about == about)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.college, college) || other.college == college)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.degreeCertificate, degreeCertificate) || other.degreeCertificate == degreeCertificate)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedin, linkedin) || other.linkedin == linkedin)&&(identical(other.name, name) || other.name == name)&&(identical(other.openToShift, openToShift) || other.openToShift == openToShift)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.profileType, profileType) || other.profileType == profileType)&&(identical(other.referralSource, referralSource) || other.referralSource == referralSource)&&(identical(other.semester, semester) || other.semester == semester)&&(identical(other.servingNoticePeriod, servingNoticePeriod) || other.servingNoticePeriod == servingNoticePeriod)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.yearOfGraduation, yearOfGraduation) || other.yearOfGraduation == yearOfGraduation)&&(identical(other.currentSalaryAmount, currentSalaryAmount) || other.currentSalaryAmount == currentSalaryAmount)&&(identical(other.currentSalaryCurrency, currentSalaryCurrency) || other.currentSalaryCurrency == currentSalaryCurrency)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.ethnicity, ethnicity) || other.ethnicity == ethnicity)&&(identical(other.expectedSalaryAmount, expectedSalaryAmount) || other.expectedSalaryAmount == expectedSalaryAmount)&&(identical(other.expectedSalaryCurrency, expectedSalaryCurrency) || other.expectedSalaryCurrency == expectedSalaryCurrency)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.visaStatus, visaStatus) || other.visaStatus == visaStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,v,const DeepCollectionEquality().hash(_achievements),const DeepCollectionEquality().hash(_awards),const DeepCollectionEquality().hash(_publications),createdAt,updatedAt,profileImage,currentCompany,noticePeriod,const DeepCollectionEquality().hash(_domainKnowledge),const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_experiences),const DeepCollectionEquality().hash(_industry),const DeepCollectionEquality().hash(_internationalExperience),const DeepCollectionEquality().hash(_jobRoles),const DeepCollectionEquality().hash(_languagesKnown),const DeepCollectionEquality().hash(_leadership),const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_lookingFor),resume,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_toolsAndPlatforms),about,certifications,cgpa,college,degree,degreeCertificate,email,gender,github,linkedin,name,openToShift,phone,portfolio,profileType,referralSource,semester,servingNoticePeriod,specialization,yearOfGraduation,currentSalaryAmount,currentSalaryCurrency,dob,ethnicity,expectedSalaryAmount,expectedSalaryCurrency,maritalStatus,visaStatus]);

@override
String toString() {
  return 'UserProfile(id: $id, userId: $userId, v: $v, achievements: $achievements, awards: $awards, publications: $publications, createdAt: $createdAt, updatedAt: $updatedAt, profileImage: $profileImage, currentCompany: $currentCompany, noticePeriod: $noticePeriod, domainKnowledge: $domainKnowledge, employmentType: $employmentType, experiences: $experiences, industry: $industry, internationalExperience: $internationalExperience, jobRoles: $jobRoles, languagesKnown: $languagesKnown, leadership: $leadership, locations: $locations, lookingFor: $lookingFor, resume: $resume, skills: $skills, toolsAndPlatforms: $toolsAndPlatforms, about: $about, certifications: $certifications, cgpa: $cgpa, college: $college, degree: $degree, degreeCertificate: $degreeCertificate, email: $email, gender: $gender, github: $github, linkedin: $linkedin, name: $name, openToShift: $openToShift, phone: $phone, portfolio: $portfolio, profileType: $profileType, referralSource: $referralSource, semester: $semester, servingNoticePeriod: $servingNoticePeriod, specialization: $specialization, yearOfGraduation: $yearOfGraduation, currentSalaryAmount: $currentSalaryAmount, currentSalaryCurrency: $currentSalaryCurrency, dob: $dob, ethnicity: $ethnicity, expectedSalaryAmount: $expectedSalaryAmount, expectedSalaryCurrency: $expectedSalaryCurrency, maritalStatus: $maritalStatus, visaStatus: $visaStatus)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? userId,@JsonKey(name: '__v') int? v, List<Achievement>? achievements, List<Award>? awards, List<Publication>? publications, String? createdAt, String? updatedAt, String? profileImage, String? currentCompany, String? noticePeriod, List<String>? domainKnowledge, List<String>? employmentType, List<String>? experiences, List<String>? industry, List<String>? internationalExperience, List<String>? jobRoles, List<String>? languagesKnown, List<String>? leadership, List<String>? locations, List<String>? lookingFor, String? resume, List<String>? skills, List<String>? toolsAndPlatforms, String? about, String? certifications, String? cgpa, String? college, String? degree, String? degreeCertificate, String? email, String? gender, String? github, String? linkedin, String? name, String? openToShift, String? phone, String? portfolio, String? profileType, String? referralSource, String? semester, bool? servingNoticePeriod, String? specialization, String? yearOfGraduation, String? currentSalaryAmount, String? currentSalaryCurrency, String? dob, String? ethnicity, String? expectedSalaryAmount, String? expectedSalaryCurrency, String? maritalStatus, String? visaStatus
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? v = freezed,Object? achievements = freezed,Object? awards = freezed,Object? publications = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? profileImage = freezed,Object? currentCompany = freezed,Object? noticePeriod = freezed,Object? domainKnowledge = freezed,Object? employmentType = freezed,Object? experiences = freezed,Object? industry = freezed,Object? internationalExperience = freezed,Object? jobRoles = freezed,Object? languagesKnown = freezed,Object? leadership = freezed,Object? locations = freezed,Object? lookingFor = freezed,Object? resume = freezed,Object? skills = freezed,Object? toolsAndPlatforms = freezed,Object? about = freezed,Object? certifications = freezed,Object? cgpa = freezed,Object? college = freezed,Object? degree = freezed,Object? degreeCertificate = freezed,Object? email = freezed,Object? gender = freezed,Object? github = freezed,Object? linkedin = freezed,Object? name = freezed,Object? openToShift = freezed,Object? phone = freezed,Object? portfolio = freezed,Object? profileType = freezed,Object? referralSource = freezed,Object? semester = freezed,Object? servingNoticePeriod = freezed,Object? specialization = freezed,Object? yearOfGraduation = freezed,Object? currentSalaryAmount = freezed,Object? currentSalaryCurrency = freezed,Object? dob = freezed,Object? ethnicity = freezed,Object? expectedSalaryAmount = freezed,Object? expectedSalaryCurrency = freezed,Object? maritalStatus = freezed,Object? visaStatus = freezed,}) {
  return _then(_UserProfile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int?,achievements: freezed == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>?,awards: freezed == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<Award>?,publications: freezed == publications ? _self._publications : publications // ignore: cast_nullable_to_non_nullable
as List<Publication>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as String?,noticePeriod: freezed == noticePeriod ? _self.noticePeriod : noticePeriod // ignore: cast_nullable_to_non_nullable
as String?,domainKnowledge: freezed == domainKnowledge ? _self._domainKnowledge : domainKnowledge // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,experiences: freezed == experiences ? _self._experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<String>?,industry: freezed == industry ? _self._industry : industry // ignore: cast_nullable_to_non_nullable
as List<String>?,internationalExperience: freezed == internationalExperience ? _self._internationalExperience : internationalExperience // ignore: cast_nullable_to_non_nullable
as List<String>?,jobRoles: freezed == jobRoles ? _self._jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,languagesKnown: freezed == languagesKnown ? _self._languagesKnown : languagesKnown // ignore: cast_nullable_to_non_nullable
as List<String>?,leadership: freezed == leadership ? _self._leadership : leadership // ignore: cast_nullable_to_non_nullable
as List<String>?,locations: freezed == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<String>?,lookingFor: freezed == lookingFor ? _self._lookingFor : lookingFor // ignore: cast_nullable_to_non_nullable
as List<String>?,resume: freezed == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self._toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<String>?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,college: freezed == college ? _self.college : college // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,degreeCertificate: freezed == degreeCertificate ? _self.degreeCertificate : degreeCertificate // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,linkedin: freezed == linkedin ? _self.linkedin : linkedin // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,openToShift: freezed == openToShift ? _self.openToShift : openToShift // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String?,profileType: freezed == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String?,referralSource: freezed == referralSource ? _self.referralSource : referralSource // ignore: cast_nullable_to_non_nullable
as String?,semester: freezed == semester ? _self.semester : semester // ignore: cast_nullable_to_non_nullable
as String?,servingNoticePeriod: freezed == servingNoticePeriod ? _self.servingNoticePeriod : servingNoticePeriod // ignore: cast_nullable_to_non_nullable
as bool?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,yearOfGraduation: freezed == yearOfGraduation ? _self.yearOfGraduation : yearOfGraduation // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryAmount: freezed == currentSalaryAmount ? _self.currentSalaryAmount : currentSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryCurrency: freezed == currentSalaryCurrency ? _self.currentSalaryCurrency : currentSalaryCurrency // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,ethnicity: freezed == ethnicity ? _self.ethnicity : ethnicity // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryAmount: freezed == expectedSalaryAmount ? _self.expectedSalaryAmount : expectedSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryCurrency: freezed == expectedSalaryCurrency ? _self.expectedSalaryCurrency : expectedSalaryCurrency // ignore: cast_nullable_to_non_nullable
as String?,maritalStatus: freezed == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as String?,visaStatus: freezed == visaStatus ? _self.visaStatus : visaStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
