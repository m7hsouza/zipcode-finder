import 'package:zipcodefinder/app/features/zipcode/models/addressmodel.dart';

abstract class SearchZipCodeState {}

class SearchZipCodeIdle implements SearchZipCodeState {}

class SearchZipCodeLoading implements SearchZipCodeState {}

class SearchZipCodeError implements SearchZipCodeState {}

class SearchZipCodeSuccess implements SearchZipCodeState {
  final AddressModel address;

  SearchZipCodeSuccess({
    required this.address,
  });
}
