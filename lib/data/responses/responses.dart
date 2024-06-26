
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';


/// flutter packages pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name:"message")
  String? message;
}

@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"projects")
  int? projects;

  CustomerResponse(this.id,this.name,this.projects);


// from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse{
  @JsonKey(name:"phone")
  String? phone;
  @JsonKey(name:"emailid")
  String? emailid;

  ContactsResponse(this.phone,this.emailid);
  // from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);

}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name:"customer")
  CustomerResponse? customer;
  @JsonKey(name:"contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);

// from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

}
