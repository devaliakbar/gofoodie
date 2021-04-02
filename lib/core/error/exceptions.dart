class DataStorageException implements Exception {}

class UnExpectedException implements Exception {}

class NetworkNotAvaliableException implements Exception {}

class IncorrectCredentialsException implements Exception {}

class AuthenticationException implements Exception {}

class RequiredFieldException implements Exception {
  final String cause;
  RequiredFieldException(this.cause);
}
