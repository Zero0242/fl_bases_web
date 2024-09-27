// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$landingPageHash() => r'66b1d05a5ddafe04ef79dc5c2057f5460b26f495';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LandingPage
    extends BuildlessAutoDisposeNotifier<PageController> {
  late final String routeName;

  PageController build(
    String routeName,
  );
}

/// See also [LandingPage].
@ProviderFor(LandingPage)
const landingPageProvider = LandingPageFamily();

/// See also [LandingPage].
class LandingPageFamily extends Family<PageController> {
  /// See also [LandingPage].
  const LandingPageFamily();

  /// See also [LandingPage].
  LandingPageProvider call(
    String routeName,
  ) {
    return LandingPageProvider(
      routeName,
    );
  }

  @override
  LandingPageProvider getProviderOverride(
    covariant LandingPageProvider provider,
  ) {
    return call(
      provider.routeName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'landingPageProvider';
}

/// See also [LandingPage].
class LandingPageProvider
    extends AutoDisposeNotifierProviderImpl<LandingPage, PageController> {
  /// See also [LandingPage].
  LandingPageProvider(
    String routeName,
  ) : this._internal(
          () => LandingPage()..routeName = routeName,
          from: landingPageProvider,
          name: r'landingPageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$landingPageHash,
          dependencies: LandingPageFamily._dependencies,
          allTransitiveDependencies:
              LandingPageFamily._allTransitiveDependencies,
          routeName: routeName,
        );

  LandingPageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.routeName,
  }) : super.internal();

  final String routeName;

  @override
  PageController runNotifierBuild(
    covariant LandingPage notifier,
  ) {
    return notifier.build(
      routeName,
    );
  }

  @override
  Override overrideWith(LandingPage Function() create) {
    return ProviderOverride(
      origin: this,
      override: LandingPageProvider._internal(
        () => create()..routeName = routeName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        routeName: routeName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<LandingPage, PageController>
      createElement() {
    return _LandingPageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LandingPageProvider && other.routeName == routeName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, routeName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LandingPageRef on AutoDisposeNotifierProviderRef<PageController> {
  /// The parameter `routeName` of this provider.
  String get routeName;
}

class _LandingPageProviderElement
    extends AutoDisposeNotifierProviderElement<LandingPage, PageController>
    with LandingPageRef {
  _LandingPageProviderElement(super.provider);

  @override
  String get routeName => (origin as LandingPageProvider).routeName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
