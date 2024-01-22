class User {
  final int id;
  final String stripeId;
  final String name;
  final String lastName;
  final String email;
  final int phoneCode;
  final String phone;
  final String birthdate;
  final String idCountry;
  final String? street;
  final String? city;
  final String? state;
  final String? zipCode;
  final String avatar;
  final String os;
  final String socialAuth;
  final String language;
  final String fcmToken;
  final String type;
  final String completedProfile;
  final String verifiedAsBroker;
  final String verifiedAsHost;
  final String verifiedAsAffiliate;
  final String? additionalData;
  final String verifiedIdentity;
  final String? rejectionReason;
  final String status;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.stripeId,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneCode,
    required this.phone,
    required this.birthdate,
    required this.idCountry,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.avatar,
    required this.os,
    required this.socialAuth,
    required this.language,
    required this.fcmToken,
    required this.type,
    required this.completedProfile,
    required this.verifiedAsBroker,
    required this.verifiedAsHost,
    required this.verifiedAsAffiliate,
    required this.additionalData,
    required this.verifiedIdentity,
    required this.rejectionReason,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      stripeId: json['stripe_id'] ?? '',
      name: json['name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phoneCode: json['phone_code'] ?? 0,
      phone: json['phone'] ?? '',
      birthdate: json['birthdate'] ?? '',
      idCountry: json['id_country'] ?? '',
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
      avatar: json['avatar'] ?? '',
      os: json['os'] ?? '',
      socialAuth: json['social_auth'] ?? '',
      language: json['language'] ?? '',
      fcmToken: json['fcm_token'] ?? '',
      type: json['type'] ?? '',
      completedProfile: json['completed_profile'] ?? '',
      verifiedAsBroker: json['verified_as_broker'] ?? '',
      verifiedAsHost: json['verified_as_host'] ?? '',
      verifiedAsAffiliate: json['verified_as_affiliate'] ?? '',
      additionalData: json['additional_data'],
      verifiedIdentity: json['verified_identity'] ?? '',
      rejectionReason: json['rejection_reason'],
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
