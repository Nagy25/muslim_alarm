// Mocks generated by Mockito 5.4.4 from annotations
// in muslim_alarm/test/prayer_times/cache/check_cache_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:muslim_alarm/core/failures/failure.dart' as _i5;
import 'package:muslim_alarm/features/prayer_alarm/domain/repositories/check_cache_repository.dart'
    as _i2;

import 'check_cache_provider_test.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCheckCacheRepository_0 extends _i1.SmartFake
    implements _i2.CheckCacheRepository {
  _FakeCheckCacheRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockCheckCache].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockCheckCache extends _i1.Mock implements _i4.MockCheckCache {
  MockMockCheckCache() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CheckCacheRepository get checkCacheRepository => (super.noSuchMethod(
        Invocation.getter(#checkCacheRepository),
        returnValue: _FakeCheckCacheRepository_0(
          this,
          Invocation.getter(#checkCacheRepository),
        ),
      ) as _i2.CheckCacheRepository);

  @override
  _i3.Either<_i5.Failure, bool> check() => (super.noSuchMethod(
        Invocation.method(
          #check,
          [],
        ),
        returnValue: _FakeEither_1<_i5.Failure, bool>(
          this,
          Invocation.method(
            #check,
            [],
          ),
        ),
      ) as _i3.Either<_i5.Failure, bool>);
}
