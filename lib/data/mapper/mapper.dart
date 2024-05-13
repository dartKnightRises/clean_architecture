
// to convert response to non nullable object

import 'package:clean_architecture/app/constants.dart';
import 'package:clean_architecture/app/extensions.dart';
import 'package:clean_architecture/data/responses/responses.dart';
import 'package:clean_architecture/domain/model.dart';


// This extension method converts a nullable CustomerResponse object into a non-nullable Customer domain object.
extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    // Convert the id, name, and projects properties of the CustomerResponse object into non-nullable strings and integer, respectively.
    // If any of these properties are null, they are replaced with default values defined in the Constants class.
    return Customer(
      this?.id?.orEmpty() ?? Constants.empty,
      this?.name?.orEmpty() ?? Constants.empty,
      this?.projects?.orZero() ?? Constants.zero,
    );
  }
}

// This extension method converts a nullable ContactsResponse object into a non-nullable Contacts domain object.
extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    // Convert the emailid and phone properties of the ContactsResponse object into non-nullable strings.
    // If any of these properties are null, they are replaced with default values defined in the Constants class.
    return Contacts(
      this?.emailid?.orEmpty() ?? Constants.empty,
      this?.phone?.orEmpty() ?? Constants.empty,
    );
  }
}

// This extension method converts a nullable AuthenticationResponse object into a non-nullable Authentication domain object.
extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    // Convert the customer and contacts properties of the AuthenticationResponse object into non-nullable Customer and Contacts domain objects, respectively.
    // If any of these properties are null, they are replaced with default values defined in the Constants class.
    return Authentication(
      this?.customer?.toDomain(),
      this?.contacts?.toDomain(),
    );
  }
}
