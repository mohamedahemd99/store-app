//to convert the response into a non nullable object (model)

import 'package:store/app/extension.dart';
import 'package:store/data/responses/resposes.dart';
import 'package:store/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain(){
    return Customer(this?.numOfNotifications?.orZero() ?? 0,
        this?.id?.orEmpty() ?? EMPTY, this?.name?.orEmpty() ?? EMPTY);
  }
}
extension ContactResponseMapper on ContactResponse?{
  Contact toDomain() {
    return Contact(this?.link?.orEmpty()??EMPTY,this?.email?.orEmpty()??EMPTY,this?.phone?.orEmpty()??EMPTY);
  }
}
extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer?.toDomain(),this?.contact?.toDomain());
  }
}
