import 'package:equatable/equatable.dart';

const String DATA_STORAGE_FAILURE_MESSAGE = 'Data Storage Failure';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];

  Failure([properties]);

  @override
  List<Object> get props => properties;
}

class DataStorageFailure extends Failure {}
