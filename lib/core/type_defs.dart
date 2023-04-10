import 'package:fpdart/fpdart.dart';
import 'package:qoute_app/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
