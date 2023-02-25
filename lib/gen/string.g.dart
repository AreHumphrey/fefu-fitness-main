/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 24 (12 per locale)
///
/// Built on 2023-02-21 at 19:46 UTC
// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
  en(languageCode: 'en', build: _StringsEn.build),
  ru(languageCode: 'ru', build: _StringsRu.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, _StringsEn> build;

  /// Gets current instance managed by [LocaleSettings].
  _StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
  Translations._(); // no constructor

  static _StringsEn of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, _StringsEn> {
  TranslationProvider({required super.child})
      : super(
          initLocale: LocaleSettings.instance.currentLocale,
          initTranslations: LocaleSettings.instance.currentTranslations,
        );

  static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  _StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
  static AppLocale setLocaleRaw(String rawLocale) =>
      instance.setLocaleRaw(rawLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsEn.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, _StringsEn> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final _StringsEn _root = this; // ignore: unused_field

  // Translations
  late final _StringsMenuEn menu = _StringsMenuEn._(_root);
  String get pass => 'Pass';
  String get authorization => 'Authorization';
  String get login => 'Login';
  String get password => 'Password';
  String get no_accont => 'No account?';
  String get sign_up => 'Sing Up';
  String get sign_in => 'Sign In';
  String get foggot_password => 'Foggot Password?';
}

// Path: menu
class _StringsMenuEn {
  _StringsMenuEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get home => 'Home';
  String get services => 'Services';
  String get schedule => 'Schedule';
  String get profile => 'Profile';
}

// Path: <root>
class _StringsRu implements _StringsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsRu.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ru,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ru>.
  @override
  final TranslationMetadata<AppLocale, _StringsEn> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsRu _root = this; // ignore: unused_field

  // Translations
  @override
  late final _StringsMenuRu menu = _StringsMenuRu._(_root);
  @override
  String get pass => 'Ваш пропуск';
  @override
  String get authorization => 'Авторизация';
  @override
  String get login => 'Логин';
  @override
  String get password => 'Пароль';
  @override
  String get no_accont => 'Нет аккаунта?';
  @override
  String get sign_up => 'Регистрация';
  @override
  String get sign_in => 'Войти';
  @override
  String get foggot_password => 'Забыли пароль?';
}

// Path: menu
class _StringsMenuRu implements _StringsMenuEn {
  _StringsMenuRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get home => 'Главная';
  @override
  String get services => 'Услуги';
  @override
  String get schedule => 'Расписание';
  @override
  String get profile => 'Профиль';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on _StringsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'menu.home':
        return 'Home';
      case 'menu.services':
        return 'Services';
      case 'menu.schedule':
        return 'Schedule';
      case 'menu.profile':
        return 'Profile';
      case 'pass':
        return 'Pass';
      case 'authorization':
        return 'Authorization';
      case 'login':
        return 'Login';
      case 'password':
        return 'Password';
      case 'no_accont':
        return 'No account?';
      case 'sign_up':
        return 'Sing Up';
      case 'sign_in':
        return 'Sign In';
      case 'foggot_password':
        return 'Foggot Password?';
      default:
        return null;
    }
  }
}

extension on _StringsRu {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'menu.home':
        return 'Главная';
      case 'menu.services':
        return 'Услуги';
      case 'menu.schedule':
        return 'Расписание';
      case 'menu.profile':
        return 'Профиль';
      case 'pass':
        return 'Ваш пропуск';
      case 'authorization':
        return 'Авторизация';
      case 'login':
        return 'Логин';
      case 'password':
        return 'Пароль';
      case 'no_accont':
        return 'Нет аккаунта?';
      case 'sign_up':
        return 'Регистрация';
      case 'sign_in':
        return 'Войти';
      case 'foggot_password':
        return 'Забыли пароль?';
      default:
        return null;
    }
  }
}