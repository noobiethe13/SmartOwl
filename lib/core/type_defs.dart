import 'package:fpdart/fpdart.dart';
import 'package:redditclone/core/errormessage.dart';

typedef FutureEither<T> = Future<Either<ErrorMessage, T>>;
typedef FutureVoid = FutureEither<void>;
