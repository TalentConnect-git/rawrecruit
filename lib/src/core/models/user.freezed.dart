// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

@JsonKey(name: '_id') String? get id; String? get userId;@JsonKey(name: '__v') int? get v; String? get companyEmail; List<Achievement>? get achievements; List<Award>? get awards; List<Publication>? get publications;@JsonKey(name: 'last_message') String? get lastMessage; String? get createdAt; String? get updatedAt; List<String>? get colleges; String? get profileImage; String? get currentCompany; int? get responseRate;@JsonKey(name: 'totalYearsOfExperience') String? get totalYearsOfExperience; String? get noticePeriod; String? get noticePeriodStartDate; bool? get servingNoticePeriod; List<String>? get domainKnowledge; List<String>? get employmentType; List<Experience>? get experiences; List<String>? get industry;@JsonKey(name: 'leadership') List<LeadershipExperience>? get leadershipExperiences;@JsonKey(name: 'internationalExperience') List<InternationalExperience>? get internationalExperiences; List<Education>? get educations; List<String>? get jobRoles; List<String>? get languagesKnown; List<String>? get locations; List<String>? get lookingFor; String? get resume; List<String>? get skills; List<String>? get toolsAndPlatforms; String? get about; String? get certifications; Status? get status; String? get degreeCertificate; String? get email; bool? get emailVerified; String? get mobile; String? get designation; String? get gender; String? get github; String? get linkedin; String? get name; String? get openToShift; String? get phone; String? get portfolio; String? get profileType; bool? get onboardingCompleted; String? get referralSource; String? get currentSalaryAmount; String? get currentSalaryCurrency; String? get dob; String? get ethnicity; String? get expectedSalaryAmount; String? get expectedSalaryCurrency; String? get maritalStatus; String? get visaStatus; List<Job>? get referralJobs;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.v, v) || other.v == v)&&(identical(other.companyEmail, companyEmail) || other.companyEmail == companyEmail)&&const DeepCollectionEquality().equals(other.achievements, achievements)&&const DeepCollectionEquality().equals(other.awards, awards)&&const DeepCollectionEquality().equals(other.publications, publications)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.colleges, colleges)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.responseRate, responseRate) || other.responseRate == responseRate)&&(identical(other.totalYearsOfExperience, totalYearsOfExperience) || other.totalYearsOfExperience == totalYearsOfExperience)&&(identical(other.noticePeriod, noticePeriod) || other.noticePeriod == noticePeriod)&&(identical(other.noticePeriodStartDate, noticePeriodStartDate) || other.noticePeriodStartDate == noticePeriodStartDate)&&(identical(other.servingNoticePeriod, servingNoticePeriod) || other.servingNoticePeriod == servingNoticePeriod)&&const DeepCollectionEquality().equals(other.domainKnowledge, domainKnowledge)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.experiences, experiences)&&const DeepCollectionEquality().equals(other.industry, industry)&&const DeepCollectionEquality().equals(other.leadershipExperiences, leadershipExperiences)&&const DeepCollectionEquality().equals(other.internationalExperiences, internationalExperiences)&&const DeepCollectionEquality().equals(other.educations, educations)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles)&&const DeepCollectionEquality().equals(other.languagesKnown, languagesKnown)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.lookingFor, lookingFor)&&(identical(other.resume, resume) || other.resume == resume)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.toolsAndPlatforms, toolsAndPlatforms)&&(identical(other.about, about) || other.about == about)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.status, status) || other.status == status)&&(identical(other.degreeCertificate, degreeCertificate) || other.degreeCertificate == degreeCertificate)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedin, linkedin) || other.linkedin == linkedin)&&(identical(other.name, name) || other.name == name)&&(identical(other.openToShift, openToShift) || other.openToShift == openToShift)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.profileType, profileType) || other.profileType == profileType)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted)&&(identical(other.referralSource, referralSource) || other.referralSource == referralSource)&&(identical(other.currentSalaryAmount, currentSalaryAmount) || other.currentSalaryAmount == currentSalaryAmount)&&(identical(other.currentSalaryCurrency, currentSalaryCurrency) || other.currentSalaryCurrency == currentSalaryCurrency)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.ethnicity, ethnicity) || other.ethnicity == ethnicity)&&(identical(other.expectedSalaryAmount, expectedSalaryAmount) || other.expectedSalaryAmount == expectedSalaryAmount)&&(identical(other.expectedSalaryCurrency, expectedSalaryCurrency) || other.expectedSalaryCurrency == expectedSalaryCurrency)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.visaStatus, visaStatus) || other.visaStatus == visaStatus)&&const DeepCollectionEquality().equals(other.referralJobs, referralJobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,v,companyEmail,const DeepCollectionEquality().hash(achievements),const DeepCollectionEquality().hash(awards),const DeepCollectionEquality().hash(publications),lastMessage,createdAt,updatedAt,const DeepCollectionEquality().hash(colleges),profileImage,currentCompany,responseRate,totalYearsOfExperience,noticePeriod,noticePeriodStartDate,servingNoticePeriod,const DeepCollectionEquality().hash(domainKnowledge),const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(experiences),const DeepCollectionEquality().hash(industry),const DeepCollectionEquality().hash(leadershipExperiences),const DeepCollectionEquality().hash(internationalExperiences),const DeepCollectionEquality().hash(educations),const DeepCollectionEquality().hash(jobRoles),const DeepCollectionEquality().hash(languagesKnown),const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(lookingFor),resume,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(toolsAndPlatforms),about,certifications,status,degreeCertificate,email,emailVerified,mobile,designation,gender,github,linkedin,name,openToShift,phone,portfolio,profileType,onboardingCompleted,referralSource,currentSalaryAmount,currentSalaryCurrency,dob,ethnicity,expectedSalaryAmount,expectedSalaryCurrency,maritalStatus,visaStatus,const DeepCollectionEquality().hash(referralJobs)]);

@override
String toString() {
  return 'User(id: $id, userId: $userId, v: $v, companyEmail: $companyEmail, achievements: $achievements, awards: $awards, publications: $publications, lastMessage: $lastMessage, createdAt: $createdAt, updatedAt: $updatedAt, colleges: $colleges, profileImage: $profileImage, currentCompany: $currentCompany, responseRate: $responseRate, totalYearsOfExperience: $totalYearsOfExperience, noticePeriod: $noticePeriod, noticePeriodStartDate: $noticePeriodStartDate, servingNoticePeriod: $servingNoticePeriod, domainKnowledge: $domainKnowledge, employmentType: $employmentType, experiences: $experiences, industry: $industry, leadershipExperiences: $leadershipExperiences, internationalExperiences: $internationalExperiences, educations: $educations, jobRoles: $jobRoles, languagesKnown: $languagesKnown, locations: $locations, lookingFor: $lookingFor, resume: $resume, skills: $skills, toolsAndPlatforms: $toolsAndPlatforms, about: $about, certifications: $certifications, status: $status, degreeCertificate: $degreeCertificate, email: $email, emailVerified: $emailVerified, mobile: $mobile, designation: $designation, gender: $gender, github: $github, linkedin: $linkedin, name: $name, openToShift: $openToShift, phone: $phone, portfolio: $portfolio, profileType: $profileType, onboardingCompleted: $onboardingCompleted, referralSource: $referralSource, currentSalaryAmount: $currentSalaryAmount, currentSalaryCurrency: $currentSalaryCurrency, dob: $dob, ethnicity: $ethnicity, expectedSalaryAmount: $expectedSalaryAmount, expectedSalaryCurrency: $expectedSalaryCurrency, maritalStatus: $maritalStatus, visaStatus: $visaStatus, referralJobs: $referralJobs)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? userId,@JsonKey(name: '__v') int? v, String? companyEmail, List<Achievement>? achievements, List<Award>? awards, List<Publication>? publications,@JsonKey(name: 'last_message') String? lastMessage, String? createdAt, String? updatedAt, List<String>? colleges, String? profileImage, String? currentCompany, int? responseRate,@JsonKey(name: 'totalYearsOfExperience') String? totalYearsOfExperience, String? noticePeriod, String? noticePeriodStartDate, bool? servingNoticePeriod, List<String>? domainKnowledge, List<String>? employmentType, List<Experience>? experiences, List<String>? industry,@JsonKey(name: 'leadership') List<LeadershipExperience>? leadershipExperiences,@JsonKey(name: 'internationalExperience') List<InternationalExperience>? internationalExperiences, List<Education>? educations, List<String>? jobRoles, List<String>? languagesKnown, List<String>? locations, List<String>? lookingFor, String? resume, List<String>? skills, List<String>? toolsAndPlatforms, String? about, String? certifications, Status? status, String? degreeCertificate, String? email, bool? emailVerified, String? mobile, String? designation, String? gender, String? github, String? linkedin, String? name, String? openToShift, String? phone, String? portfolio, String? profileType, bool? onboardingCompleted, String? referralSource, String? currentSalaryAmount, String? currentSalaryCurrency, String? dob, String? ethnicity, String? expectedSalaryAmount, String? expectedSalaryCurrency, String? maritalStatus, String? visaStatus, List<Job>? referralJobs
});


$StatusCopyWith<$Res>? get status;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? v = freezed,Object? companyEmail = freezed,Object? achievements = freezed,Object? awards = freezed,Object? publications = freezed,Object? lastMessage = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? colleges = freezed,Object? profileImage = freezed,Object? currentCompany = freezed,Object? responseRate = freezed,Object? totalYearsOfExperience = freezed,Object? noticePeriod = freezed,Object? noticePeriodStartDate = freezed,Object? servingNoticePeriod = freezed,Object? domainKnowledge = freezed,Object? employmentType = freezed,Object? experiences = freezed,Object? industry = freezed,Object? leadershipExperiences = freezed,Object? internationalExperiences = freezed,Object? educations = freezed,Object? jobRoles = freezed,Object? languagesKnown = freezed,Object? locations = freezed,Object? lookingFor = freezed,Object? resume = freezed,Object? skills = freezed,Object? toolsAndPlatforms = freezed,Object? about = freezed,Object? certifications = freezed,Object? status = freezed,Object? degreeCertificate = freezed,Object? email = freezed,Object? emailVerified = freezed,Object? mobile = freezed,Object? designation = freezed,Object? gender = freezed,Object? github = freezed,Object? linkedin = freezed,Object? name = freezed,Object? openToShift = freezed,Object? phone = freezed,Object? portfolio = freezed,Object? profileType = freezed,Object? onboardingCompleted = freezed,Object? referralSource = freezed,Object? currentSalaryAmount = freezed,Object? currentSalaryCurrency = freezed,Object? dob = freezed,Object? ethnicity = freezed,Object? expectedSalaryAmount = freezed,Object? expectedSalaryCurrency = freezed,Object? maritalStatus = freezed,Object? visaStatus = freezed,Object? referralJobs = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int?,companyEmail: freezed == companyEmail ? _self.companyEmail : companyEmail // ignore: cast_nullable_to_non_nullable
as String?,achievements: freezed == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>?,awards: freezed == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as List<Award>?,publications: freezed == publications ? _self.publications : publications // ignore: cast_nullable_to_non_nullable
as List<Publication>?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,colleges: freezed == colleges ? _self.colleges : colleges // ignore: cast_nullable_to_non_nullable
as List<String>?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as String?,responseRate: freezed == responseRate ? _self.responseRate : responseRate // ignore: cast_nullable_to_non_nullable
as int?,totalYearsOfExperience: freezed == totalYearsOfExperience ? _self.totalYearsOfExperience : totalYearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,noticePeriod: freezed == noticePeriod ? _self.noticePeriod : noticePeriod // ignore: cast_nullable_to_non_nullable
as String?,noticePeriodStartDate: freezed == noticePeriodStartDate ? _self.noticePeriodStartDate : noticePeriodStartDate // ignore: cast_nullable_to_non_nullable
as String?,servingNoticePeriod: freezed == servingNoticePeriod ? _self.servingNoticePeriod : servingNoticePeriod // ignore: cast_nullable_to_non_nullable
as bool?,domainKnowledge: freezed == domainKnowledge ? _self.domainKnowledge : domainKnowledge // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,experiences: freezed == experiences ? _self.experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<Experience>?,industry: freezed == industry ? _self.industry : industry // ignore: cast_nullable_to_non_nullable
as List<String>?,leadershipExperiences: freezed == leadershipExperiences ? _self.leadershipExperiences : leadershipExperiences // ignore: cast_nullable_to_non_nullable
as List<LeadershipExperience>?,internationalExperiences: freezed == internationalExperiences ? _self.internationalExperiences : internationalExperiences // ignore: cast_nullable_to_non_nullable
as List<InternationalExperience>?,educations: freezed == educations ? _self.educations : educations // ignore: cast_nullable_to_non_nullable
as List<Education>?,jobRoles: freezed == jobRoles ? _self.jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,languagesKnown: freezed == languagesKnown ? _self.languagesKnown : languagesKnown // ignore: cast_nullable_to_non_nullable
as List<String>?,locations: freezed == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<String>?,lookingFor: freezed == lookingFor ? _self.lookingFor : lookingFor // ignore: cast_nullable_to_non_nullable
as List<String>?,resume: freezed == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self.toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<String>?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status?,degreeCertificate: freezed == degreeCertificate ? _self.degreeCertificate : degreeCertificate // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: freezed == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,linkedin: freezed == linkedin ? _self.linkedin : linkedin // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,openToShift: freezed == openToShift ? _self.openToShift : openToShift // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String?,profileType: freezed == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String?,onboardingCompleted: freezed == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool?,referralSource: freezed == referralSource ? _self.referralSource : referralSource // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryAmount: freezed == currentSalaryAmount ? _self.currentSalaryAmount : currentSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryCurrency: freezed == currentSalaryCurrency ? _self.currentSalaryCurrency : currentSalaryCurrency // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,ethnicity: freezed == ethnicity ? _self.ethnicity : ethnicity // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryAmount: freezed == expectedSalaryAmount ? _self.expectedSalaryAmount : expectedSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryCurrency: freezed == expectedSalaryCurrency ? _self.expectedSalaryCurrency : expectedSalaryCurrency // ignore: cast_nullable_to_non_nullable
as String?,maritalStatus: freezed == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as String?,visaStatus: freezed == visaStatus ? _self.visaStatus : visaStatus // ignore: cast_nullable_to_non_nullable
as String?,referralJobs: freezed == referralJobs ? _self.referralJobs : referralJobs // ignore: cast_nullable_to_non_nullable
as List<Job>?,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $StatusCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? userId, @JsonKey(name: '__v')  int? v,  String? companyEmail,  List<Achievement>? achievements,  List<Award>? awards,  List<Publication>? publications, @JsonKey(name: 'last_message')  String? lastMessage,  String? createdAt,  String? updatedAt,  List<String>? colleges,  String? profileImage,  String? currentCompany,  int? responseRate, @JsonKey(name: 'totalYearsOfExperience')  String? totalYearsOfExperience,  String? noticePeriod,  String? noticePeriodStartDate,  bool? servingNoticePeriod,  List<String>? domainKnowledge,  List<String>? employmentType,  List<Experience>? experiences,  List<String>? industry, @JsonKey(name: 'leadership')  List<LeadershipExperience>? leadershipExperiences, @JsonKey(name: 'internationalExperience')  List<InternationalExperience>? internationalExperiences,  List<Education>? educations,  List<String>? jobRoles,  List<String>? languagesKnown,  List<String>? locations,  List<String>? lookingFor,  String? resume,  List<String>? skills,  List<String>? toolsAndPlatforms,  String? about,  String? certifications,  Status? status,  String? degreeCertificate,  String? email,  bool? emailVerified,  String? mobile,  String? designation,  String? gender,  String? github,  String? linkedin,  String? name,  String? openToShift,  String? phone,  String? portfolio,  String? profileType,  bool? onboardingCompleted,  String? referralSource,  String? currentSalaryAmount,  String? currentSalaryCurrency,  String? dob,  String? ethnicity,  String? expectedSalaryAmount,  String? expectedSalaryCurrency,  String? maritalStatus,  String? visaStatus,  List<Job>? referralJobs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.userId,_that.v,_that.companyEmail,_that.achievements,_that.awards,_that.publications,_that.lastMessage,_that.createdAt,_that.updatedAt,_that.colleges,_that.profileImage,_that.currentCompany,_that.responseRate,_that.totalYearsOfExperience,_that.noticePeriod,_that.noticePeriodStartDate,_that.servingNoticePeriod,_that.domainKnowledge,_that.employmentType,_that.experiences,_that.industry,_that.leadershipExperiences,_that.internationalExperiences,_that.educations,_that.jobRoles,_that.languagesKnown,_that.locations,_that.lookingFor,_that.resume,_that.skills,_that.toolsAndPlatforms,_that.about,_that.certifications,_that.status,_that.degreeCertificate,_that.email,_that.emailVerified,_that.mobile,_that.designation,_that.gender,_that.github,_that.linkedin,_that.name,_that.openToShift,_that.phone,_that.portfolio,_that.profileType,_that.onboardingCompleted,_that.referralSource,_that.currentSalaryAmount,_that.currentSalaryCurrency,_that.dob,_that.ethnicity,_that.expectedSalaryAmount,_that.expectedSalaryCurrency,_that.maritalStatus,_that.visaStatus,_that.referralJobs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? userId, @JsonKey(name: '__v')  int? v,  String? companyEmail,  List<Achievement>? achievements,  List<Award>? awards,  List<Publication>? publications, @JsonKey(name: 'last_message')  String? lastMessage,  String? createdAt,  String? updatedAt,  List<String>? colleges,  String? profileImage,  String? currentCompany,  int? responseRate, @JsonKey(name: 'totalYearsOfExperience')  String? totalYearsOfExperience,  String? noticePeriod,  String? noticePeriodStartDate,  bool? servingNoticePeriod,  List<String>? domainKnowledge,  List<String>? employmentType,  List<Experience>? experiences,  List<String>? industry, @JsonKey(name: 'leadership')  List<LeadershipExperience>? leadershipExperiences, @JsonKey(name: 'internationalExperience')  List<InternationalExperience>? internationalExperiences,  List<Education>? educations,  List<String>? jobRoles,  List<String>? languagesKnown,  List<String>? locations,  List<String>? lookingFor,  String? resume,  List<String>? skills,  List<String>? toolsAndPlatforms,  String? about,  String? certifications,  Status? status,  String? degreeCertificate,  String? email,  bool? emailVerified,  String? mobile,  String? designation,  String? gender,  String? github,  String? linkedin,  String? name,  String? openToShift,  String? phone,  String? portfolio,  String? profileType,  bool? onboardingCompleted,  String? referralSource,  String? currentSalaryAmount,  String? currentSalaryCurrency,  String? dob,  String? ethnicity,  String? expectedSalaryAmount,  String? expectedSalaryCurrency,  String? maritalStatus,  String? visaStatus,  List<Job>? referralJobs)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.userId,_that.v,_that.companyEmail,_that.achievements,_that.awards,_that.publications,_that.lastMessage,_that.createdAt,_that.updatedAt,_that.colleges,_that.profileImage,_that.currentCompany,_that.responseRate,_that.totalYearsOfExperience,_that.noticePeriod,_that.noticePeriodStartDate,_that.servingNoticePeriod,_that.domainKnowledge,_that.employmentType,_that.experiences,_that.industry,_that.leadershipExperiences,_that.internationalExperiences,_that.educations,_that.jobRoles,_that.languagesKnown,_that.locations,_that.lookingFor,_that.resume,_that.skills,_that.toolsAndPlatforms,_that.about,_that.certifications,_that.status,_that.degreeCertificate,_that.email,_that.emailVerified,_that.mobile,_that.designation,_that.gender,_that.github,_that.linkedin,_that.name,_that.openToShift,_that.phone,_that.portfolio,_that.profileType,_that.onboardingCompleted,_that.referralSource,_that.currentSalaryAmount,_that.currentSalaryCurrency,_that.dob,_that.ethnicity,_that.expectedSalaryAmount,_that.expectedSalaryCurrency,_that.maritalStatus,_that.visaStatus,_that.referralJobs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? userId, @JsonKey(name: '__v')  int? v,  String? companyEmail,  List<Achievement>? achievements,  List<Award>? awards,  List<Publication>? publications, @JsonKey(name: 'last_message')  String? lastMessage,  String? createdAt,  String? updatedAt,  List<String>? colleges,  String? profileImage,  String? currentCompany,  int? responseRate, @JsonKey(name: 'totalYearsOfExperience')  String? totalYearsOfExperience,  String? noticePeriod,  String? noticePeriodStartDate,  bool? servingNoticePeriod,  List<String>? domainKnowledge,  List<String>? employmentType,  List<Experience>? experiences,  List<String>? industry, @JsonKey(name: 'leadership')  List<LeadershipExperience>? leadershipExperiences, @JsonKey(name: 'internationalExperience')  List<InternationalExperience>? internationalExperiences,  List<Education>? educations,  List<String>? jobRoles,  List<String>? languagesKnown,  List<String>? locations,  List<String>? lookingFor,  String? resume,  List<String>? skills,  List<String>? toolsAndPlatforms,  String? about,  String? certifications,  Status? status,  String? degreeCertificate,  String? email,  bool? emailVerified,  String? mobile,  String? designation,  String? gender,  String? github,  String? linkedin,  String? name,  String? openToShift,  String? phone,  String? portfolio,  String? profileType,  bool? onboardingCompleted,  String? referralSource,  String? currentSalaryAmount,  String? currentSalaryCurrency,  String? dob,  String? ethnicity,  String? expectedSalaryAmount,  String? expectedSalaryCurrency,  String? maritalStatus,  String? visaStatus,  List<Job>? referralJobs)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.userId,_that.v,_that.companyEmail,_that.achievements,_that.awards,_that.publications,_that.lastMessage,_that.createdAt,_that.updatedAt,_that.colleges,_that.profileImage,_that.currentCompany,_that.responseRate,_that.totalYearsOfExperience,_that.noticePeriod,_that.noticePeriodStartDate,_that.servingNoticePeriod,_that.domainKnowledge,_that.employmentType,_that.experiences,_that.industry,_that.leadershipExperiences,_that.internationalExperiences,_that.educations,_that.jobRoles,_that.languagesKnown,_that.locations,_that.lookingFor,_that.resume,_that.skills,_that.toolsAndPlatforms,_that.about,_that.certifications,_that.status,_that.degreeCertificate,_that.email,_that.emailVerified,_that.mobile,_that.designation,_that.gender,_that.github,_that.linkedin,_that.name,_that.openToShift,_that.phone,_that.portfolio,_that.profileType,_that.onboardingCompleted,_that.referralSource,_that.currentSalaryAmount,_that.currentSalaryCurrency,_that.dob,_that.ethnicity,_that.expectedSalaryAmount,_that.expectedSalaryCurrency,_that.maritalStatus,_that.visaStatus,_that.referralJobs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({@JsonKey(name: '_id') this.id, this.userId, @JsonKey(name: '__v') this.v, this.companyEmail, final  List<Achievement>? achievements, final  List<Award>? awards, final  List<Publication>? publications, @JsonKey(name: 'last_message') this.lastMessage, this.createdAt, this.updatedAt, final  List<String>? colleges, this.profileImage, this.currentCompany, this.responseRate, @JsonKey(name: 'totalYearsOfExperience') this.totalYearsOfExperience, this.noticePeriod, this.noticePeriodStartDate, this.servingNoticePeriod, final  List<String>? domainKnowledge, final  List<String>? employmentType, final  List<Experience>? experiences, final  List<String>? industry, @JsonKey(name: 'leadership') final  List<LeadershipExperience>? leadershipExperiences, @JsonKey(name: 'internationalExperience') final  List<InternationalExperience>? internationalExperiences, final  List<Education>? educations, final  List<String>? jobRoles, final  List<String>? languagesKnown, final  List<String>? locations, final  List<String>? lookingFor, this.resume, final  List<String>? skills, final  List<String>? toolsAndPlatforms, this.about, this.certifications, this.status, this.degreeCertificate, this.email, this.emailVerified, this.mobile, this.designation, this.gender, this.github, this.linkedin, this.name, this.openToShift, this.phone, this.portfolio, this.profileType, this.onboardingCompleted, this.referralSource, this.currentSalaryAmount, this.currentSalaryCurrency, this.dob, this.ethnicity, this.expectedSalaryAmount, this.expectedSalaryCurrency, this.maritalStatus, this.visaStatus, final  List<Job>? referralJobs}): _achievements = achievements,_awards = awards,_publications = publications,_colleges = colleges,_domainKnowledge = domainKnowledge,_employmentType = employmentType,_experiences = experiences,_industry = industry,_leadershipExperiences = leadershipExperiences,_internationalExperiences = internationalExperiences,_educations = educations,_jobRoles = jobRoles,_languagesKnown = languagesKnown,_locations = locations,_lookingFor = lookingFor,_skills = skills,_toolsAndPlatforms = toolsAndPlatforms,_referralJobs = referralJobs;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? userId;
@override@JsonKey(name: '__v') final  int? v;
@override final  String? companyEmail;
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

@override@JsonKey(name: 'last_message') final  String? lastMessage;
@override final  String? createdAt;
@override final  String? updatedAt;
 final  List<String>? _colleges;
@override List<String>? get colleges {
  final value = _colleges;
  if (value == null) return null;
  if (_colleges is EqualUnmodifiableListView) return _colleges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? profileImage;
@override final  String? currentCompany;
@override final  int? responseRate;
@override@JsonKey(name: 'totalYearsOfExperience') final  String? totalYearsOfExperience;
@override final  String? noticePeriod;
@override final  String? noticePeriodStartDate;
@override final  bool? servingNoticePeriod;
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

 final  List<Experience>? _experiences;
@override List<Experience>? get experiences {
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

 final  List<LeadershipExperience>? _leadershipExperiences;
@override@JsonKey(name: 'leadership') List<LeadershipExperience>? get leadershipExperiences {
  final value = _leadershipExperiences;
  if (value == null) return null;
  if (_leadershipExperiences is EqualUnmodifiableListView) return _leadershipExperiences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<InternationalExperience>? _internationalExperiences;
@override@JsonKey(name: 'internationalExperience') List<InternationalExperience>? get internationalExperiences {
  final value = _internationalExperiences;
  if (value == null) return null;
  if (_internationalExperiences is EqualUnmodifiableListView) return _internationalExperiences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Education>? _educations;
@override List<Education>? get educations {
  final value = _educations;
  if (value == null) return null;
  if (_educations is EqualUnmodifiableListView) return _educations;
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
@override final  Status? status;
@override final  String? degreeCertificate;
@override final  String? email;
@override final  bool? emailVerified;
@override final  String? mobile;
@override final  String? designation;
@override final  String? gender;
@override final  String? github;
@override final  String? linkedin;
@override final  String? name;
@override final  String? openToShift;
@override final  String? phone;
@override final  String? portfolio;
@override final  String? profileType;
@override final  bool? onboardingCompleted;
@override final  String? referralSource;
@override final  String? currentSalaryAmount;
@override final  String? currentSalaryCurrency;
@override final  String? dob;
@override final  String? ethnicity;
@override final  String? expectedSalaryAmount;
@override final  String? expectedSalaryCurrency;
@override final  String? maritalStatus;
@override final  String? visaStatus;
 final  List<Job>? _referralJobs;
@override List<Job>? get referralJobs {
  final value = _referralJobs;
  if (value == null) return null;
  if (_referralJobs is EqualUnmodifiableListView) return _referralJobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.v, v) || other.v == v)&&(identical(other.companyEmail, companyEmail) || other.companyEmail == companyEmail)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&const DeepCollectionEquality().equals(other._awards, _awards)&&const DeepCollectionEquality().equals(other._publications, _publications)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._colleges, _colleges)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.responseRate, responseRate) || other.responseRate == responseRate)&&(identical(other.totalYearsOfExperience, totalYearsOfExperience) || other.totalYearsOfExperience == totalYearsOfExperience)&&(identical(other.noticePeriod, noticePeriod) || other.noticePeriod == noticePeriod)&&(identical(other.noticePeriodStartDate, noticePeriodStartDate) || other.noticePeriodStartDate == noticePeriodStartDate)&&(identical(other.servingNoticePeriod, servingNoticePeriod) || other.servingNoticePeriod == servingNoticePeriod)&&const DeepCollectionEquality().equals(other._domainKnowledge, _domainKnowledge)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._experiences, _experiences)&&const DeepCollectionEquality().equals(other._industry, _industry)&&const DeepCollectionEquality().equals(other._leadershipExperiences, _leadershipExperiences)&&const DeepCollectionEquality().equals(other._internationalExperiences, _internationalExperiences)&&const DeepCollectionEquality().equals(other._educations, _educations)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles)&&const DeepCollectionEquality().equals(other._languagesKnown, _languagesKnown)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._lookingFor, _lookingFor)&&(identical(other.resume, resume) || other.resume == resume)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._toolsAndPlatforms, _toolsAndPlatforms)&&(identical(other.about, about) || other.about == about)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.status, status) || other.status == status)&&(identical(other.degreeCertificate, degreeCertificate) || other.degreeCertificate == degreeCertificate)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedin, linkedin) || other.linkedin == linkedin)&&(identical(other.name, name) || other.name == name)&&(identical(other.openToShift, openToShift) || other.openToShift == openToShift)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.profileType, profileType) || other.profileType == profileType)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted)&&(identical(other.referralSource, referralSource) || other.referralSource == referralSource)&&(identical(other.currentSalaryAmount, currentSalaryAmount) || other.currentSalaryAmount == currentSalaryAmount)&&(identical(other.currentSalaryCurrency, currentSalaryCurrency) || other.currentSalaryCurrency == currentSalaryCurrency)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.ethnicity, ethnicity) || other.ethnicity == ethnicity)&&(identical(other.expectedSalaryAmount, expectedSalaryAmount) || other.expectedSalaryAmount == expectedSalaryAmount)&&(identical(other.expectedSalaryCurrency, expectedSalaryCurrency) || other.expectedSalaryCurrency == expectedSalaryCurrency)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.visaStatus, visaStatus) || other.visaStatus == visaStatus)&&const DeepCollectionEquality().equals(other._referralJobs, _referralJobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,v,companyEmail,const DeepCollectionEquality().hash(_achievements),const DeepCollectionEquality().hash(_awards),const DeepCollectionEquality().hash(_publications),lastMessage,createdAt,updatedAt,const DeepCollectionEquality().hash(_colleges),profileImage,currentCompany,responseRate,totalYearsOfExperience,noticePeriod,noticePeriodStartDate,servingNoticePeriod,const DeepCollectionEquality().hash(_domainKnowledge),const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_experiences),const DeepCollectionEquality().hash(_industry),const DeepCollectionEquality().hash(_leadershipExperiences),const DeepCollectionEquality().hash(_internationalExperiences),const DeepCollectionEquality().hash(_educations),const DeepCollectionEquality().hash(_jobRoles),const DeepCollectionEquality().hash(_languagesKnown),const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_lookingFor),resume,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_toolsAndPlatforms),about,certifications,status,degreeCertificate,email,emailVerified,mobile,designation,gender,github,linkedin,name,openToShift,phone,portfolio,profileType,onboardingCompleted,referralSource,currentSalaryAmount,currentSalaryCurrency,dob,ethnicity,expectedSalaryAmount,expectedSalaryCurrency,maritalStatus,visaStatus,const DeepCollectionEquality().hash(_referralJobs)]);

@override
String toString() {
  return 'User(id: $id, userId: $userId, v: $v, companyEmail: $companyEmail, achievements: $achievements, awards: $awards, publications: $publications, lastMessage: $lastMessage, createdAt: $createdAt, updatedAt: $updatedAt, colleges: $colleges, profileImage: $profileImage, currentCompany: $currentCompany, responseRate: $responseRate, totalYearsOfExperience: $totalYearsOfExperience, noticePeriod: $noticePeriod, noticePeriodStartDate: $noticePeriodStartDate, servingNoticePeriod: $servingNoticePeriod, domainKnowledge: $domainKnowledge, employmentType: $employmentType, experiences: $experiences, industry: $industry, leadershipExperiences: $leadershipExperiences, internationalExperiences: $internationalExperiences, educations: $educations, jobRoles: $jobRoles, languagesKnown: $languagesKnown, locations: $locations, lookingFor: $lookingFor, resume: $resume, skills: $skills, toolsAndPlatforms: $toolsAndPlatforms, about: $about, certifications: $certifications, status: $status, degreeCertificate: $degreeCertificate, email: $email, emailVerified: $emailVerified, mobile: $mobile, designation: $designation, gender: $gender, github: $github, linkedin: $linkedin, name: $name, openToShift: $openToShift, phone: $phone, portfolio: $portfolio, profileType: $profileType, onboardingCompleted: $onboardingCompleted, referralSource: $referralSource, currentSalaryAmount: $currentSalaryAmount, currentSalaryCurrency: $currentSalaryCurrency, dob: $dob, ethnicity: $ethnicity, expectedSalaryAmount: $expectedSalaryAmount, expectedSalaryCurrency: $expectedSalaryCurrency, maritalStatus: $maritalStatus, visaStatus: $visaStatus, referralJobs: $referralJobs)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? userId,@JsonKey(name: '__v') int? v, String? companyEmail, List<Achievement>? achievements, List<Award>? awards, List<Publication>? publications,@JsonKey(name: 'last_message') String? lastMessage, String? createdAt, String? updatedAt, List<String>? colleges, String? profileImage, String? currentCompany, int? responseRate,@JsonKey(name: 'totalYearsOfExperience') String? totalYearsOfExperience, String? noticePeriod, String? noticePeriodStartDate, bool? servingNoticePeriod, List<String>? domainKnowledge, List<String>? employmentType, List<Experience>? experiences, List<String>? industry,@JsonKey(name: 'leadership') List<LeadershipExperience>? leadershipExperiences,@JsonKey(name: 'internationalExperience') List<InternationalExperience>? internationalExperiences, List<Education>? educations, List<String>? jobRoles, List<String>? languagesKnown, List<String>? locations, List<String>? lookingFor, String? resume, List<String>? skills, List<String>? toolsAndPlatforms, String? about, String? certifications, Status? status, String? degreeCertificate, String? email, bool? emailVerified, String? mobile, String? designation, String? gender, String? github, String? linkedin, String? name, String? openToShift, String? phone, String? portfolio, String? profileType, bool? onboardingCompleted, String? referralSource, String? currentSalaryAmount, String? currentSalaryCurrency, String? dob, String? ethnicity, String? expectedSalaryAmount, String? expectedSalaryCurrency, String? maritalStatus, String? visaStatus, List<Job>? referralJobs
});


@override $StatusCopyWith<$Res>? get status;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? v = freezed,Object? companyEmail = freezed,Object? achievements = freezed,Object? awards = freezed,Object? publications = freezed,Object? lastMessage = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? colleges = freezed,Object? profileImage = freezed,Object? currentCompany = freezed,Object? responseRate = freezed,Object? totalYearsOfExperience = freezed,Object? noticePeriod = freezed,Object? noticePeriodStartDate = freezed,Object? servingNoticePeriod = freezed,Object? domainKnowledge = freezed,Object? employmentType = freezed,Object? experiences = freezed,Object? industry = freezed,Object? leadershipExperiences = freezed,Object? internationalExperiences = freezed,Object? educations = freezed,Object? jobRoles = freezed,Object? languagesKnown = freezed,Object? locations = freezed,Object? lookingFor = freezed,Object? resume = freezed,Object? skills = freezed,Object? toolsAndPlatforms = freezed,Object? about = freezed,Object? certifications = freezed,Object? status = freezed,Object? degreeCertificate = freezed,Object? email = freezed,Object? emailVerified = freezed,Object? mobile = freezed,Object? designation = freezed,Object? gender = freezed,Object? github = freezed,Object? linkedin = freezed,Object? name = freezed,Object? openToShift = freezed,Object? phone = freezed,Object? portfolio = freezed,Object? profileType = freezed,Object? onboardingCompleted = freezed,Object? referralSource = freezed,Object? currentSalaryAmount = freezed,Object? currentSalaryCurrency = freezed,Object? dob = freezed,Object? ethnicity = freezed,Object? expectedSalaryAmount = freezed,Object? expectedSalaryCurrency = freezed,Object? maritalStatus = freezed,Object? visaStatus = freezed,Object? referralJobs = freezed,}) {
  return _then(_User(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int?,companyEmail: freezed == companyEmail ? _self.companyEmail : companyEmail // ignore: cast_nullable_to_non_nullable
as String?,achievements: freezed == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>?,awards: freezed == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<Award>?,publications: freezed == publications ? _self._publications : publications // ignore: cast_nullable_to_non_nullable
as List<Publication>?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,colleges: freezed == colleges ? _self._colleges : colleges // ignore: cast_nullable_to_non_nullable
as List<String>?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as String?,responseRate: freezed == responseRate ? _self.responseRate : responseRate // ignore: cast_nullable_to_non_nullable
as int?,totalYearsOfExperience: freezed == totalYearsOfExperience ? _self.totalYearsOfExperience : totalYearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,noticePeriod: freezed == noticePeriod ? _self.noticePeriod : noticePeriod // ignore: cast_nullable_to_non_nullable
as String?,noticePeriodStartDate: freezed == noticePeriodStartDate ? _self.noticePeriodStartDate : noticePeriodStartDate // ignore: cast_nullable_to_non_nullable
as String?,servingNoticePeriod: freezed == servingNoticePeriod ? _self.servingNoticePeriod : servingNoticePeriod // ignore: cast_nullable_to_non_nullable
as bool?,domainKnowledge: freezed == domainKnowledge ? _self._domainKnowledge : domainKnowledge // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,experiences: freezed == experiences ? _self._experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<Experience>?,industry: freezed == industry ? _self._industry : industry // ignore: cast_nullable_to_non_nullable
as List<String>?,leadershipExperiences: freezed == leadershipExperiences ? _self._leadershipExperiences : leadershipExperiences // ignore: cast_nullable_to_non_nullable
as List<LeadershipExperience>?,internationalExperiences: freezed == internationalExperiences ? _self._internationalExperiences : internationalExperiences // ignore: cast_nullable_to_non_nullable
as List<InternationalExperience>?,educations: freezed == educations ? _self._educations : educations // ignore: cast_nullable_to_non_nullable
as List<Education>?,jobRoles: freezed == jobRoles ? _self._jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,languagesKnown: freezed == languagesKnown ? _self._languagesKnown : languagesKnown // ignore: cast_nullable_to_non_nullable
as List<String>?,locations: freezed == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<String>?,lookingFor: freezed == lookingFor ? _self._lookingFor : lookingFor // ignore: cast_nullable_to_non_nullable
as List<String>?,resume: freezed == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self._toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<String>?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status?,degreeCertificate: freezed == degreeCertificate ? _self.degreeCertificate : degreeCertificate // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: freezed == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,linkedin: freezed == linkedin ? _self.linkedin : linkedin // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,openToShift: freezed == openToShift ? _self.openToShift : openToShift // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String?,profileType: freezed == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String?,onboardingCompleted: freezed == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool?,referralSource: freezed == referralSource ? _self.referralSource : referralSource // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryAmount: freezed == currentSalaryAmount ? _self.currentSalaryAmount : currentSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryCurrency: freezed == currentSalaryCurrency ? _self.currentSalaryCurrency : currentSalaryCurrency // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,ethnicity: freezed == ethnicity ? _self.ethnicity : ethnicity // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryAmount: freezed == expectedSalaryAmount ? _self.expectedSalaryAmount : expectedSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryCurrency: freezed == expectedSalaryCurrency ? _self.expectedSalaryCurrency : expectedSalaryCurrency // ignore: cast_nullable_to_non_nullable
as String?,maritalStatus: freezed == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as String?,visaStatus: freezed == visaStatus ? _self.visaStatus : visaStatus // ignore: cast_nullable_to_non_nullable
as String?,referralJobs: freezed == referralJobs ? _self._referralJobs : referralJobs // ignore: cast_nullable_to_non_nullable
as List<Job>?,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $StatusCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
