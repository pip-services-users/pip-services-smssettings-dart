import 'package:pip_services3_commons/pip_services3_commons.dart';

class SmsSettingsV1 implements IStringIdentifiable {
  @override
  /* Recipient information */
  String id;
  String name;
  String phone;
  String language;

  /* SmsSettings management */
  dynamic subscriptions;
  bool verified;
  String ver_code;
  DateTime ver_expire_time;

  /* Custom fields */
  dynamic custom_hdr;
  dynamic custom_dat;

  SmsSettingsV1(
      {String id,
      String name,
      String phone,
      String language,
      dynamic subscriptions,
      bool verified,
      String ver_code,
      DateTime ver_expire_time,
      dynamic custom_hdr,
      dynamic custom_dat})
      : id = id,
        name = name,
        phone = phone,
        language = language,
        subscriptions = subscriptions,
        verified = verified,
        ver_code = ver_code,
        ver_expire_time = ver_expire_time,
        custom_hdr = custom_hdr,
        custom_dat = custom_dat;

  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    language = json['language'];
    subscriptions = json['subscriptions'];
    verified = json['verified'];
    ver_code = json['ver_code'];
    var ver_expire_time_json = json['ver_expire_time'];
    ver_expire_time = ver_expire_time_json != null
        ? DateTime.tryParse(ver_expire_time_json)
        : null;
    custom_hdr = json['custom_hdr'];
    custom_dat = json['custom_dat'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'language': language,
      'subscriptions': subscriptions,
      'verified': verified,
      'ver_code': ver_code,
      'ver_expire_time': ver_expire_time != null
          ? ver_expire_time.toIso8601String()
          : ver_expire_time,
      'custom_hdr': custom_hdr,
      'custom_dat': custom_dat
    };
  }

  factory SmsSettingsV1.fromJson(Map<String, dynamic> json) {
    var ver_expire_time_json = json['ver_expire_time'];
    return SmsSettingsV1(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        language: json['language'],
        subscriptions: json['subscriptions'],
        verified: json['verified'],
        ver_code: json['ver_code'],
        ver_expire_time: ver_expire_time_json != null
            ? DateTime.tryParse(ver_expire_time_json)
            : null,
        custom_hdr: json['custom_hdr'],
        custom_dat: json['custom_dat']);
  }
}
