// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Factory Management`
  String get factory_management_system {
    return Intl.message(
      'Factory Management',
      name: 'factory_management_system',
      desc: '',
      args: [],
    );
  }

  /// `Measure`
  String get measure {
    return Intl.message(
      'Measure',
      name: 'measure',
      desc: '',
      args: [],
    );
  }

  /// `👥 Customers Count`
  String get customers_number {
    return Intl.message(
      '👥 Customers Count',
      name: 'customers_number',
      desc: '',
      args: [],
    );
  }

  /// `👥 Customers`
  String get customers {
    return Intl.message(
      '👥 Customers',
      name: 'customers',
      desc: '',
      args: [],
    );
  }

  /// `Machines`
  String get machines {
    return Intl.message(
      'Machines',
      name: 'machines',
      desc: '',
      args: [],
    );
  }

  /// `+ Add Customer`
  String get add_customer {
    return Intl.message(
      '+ Add Customer',
      name: 'add_customer',
      desc: '',
      args: [],
    );
  }

  /// `Quantity:`
  String get quantity {
    return Intl.message(
      'Quantity:',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Printed`
  String get printed {
    return Intl.message(
      'Printed',
      name: 'printed',
      desc: '',
      args: [],
    );
  }

  /// `Working`
  String get working {
    return Intl.message(
      'Working',
      name: 'working',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `The list is empty, add a new item`
  String get empty_list {
    return Intl.message(
      'The list is empty, add a new item',
      name: 'empty_list',
      desc: '',
      args: [],
    );
  }

  /// `No customers`
  String get empty_customer {
    return Intl.message(
      'No customers',
      name: 'empty_customer',
      desc: '',
      args: [],
    );
  }

  /// `No machines`
  String get empty_machine {
    return Intl.message(
      'No machines',
      name: 'empty_machine',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Add New Machine`
  String get add_machine_title {
    return Intl.message(
      'Add New Machine',
      name: 'add_machine_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the name of the machine you want to add`
  String get add_machine_sub_title {
    return Intl.message(
      'Enter the name of the machine you want to add',
      name: 'add_machine_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Machine Name`
  String get machine_name {
    return Intl.message(
      'Machine Name',
      name: 'machine_name',
      desc: '',
      args: [],
    );
  }

  /// `e.g.: Size 30 Machine`
  String get machine_hint {
    return Intl.message(
      'e.g.: Size 30 Machine',
      name: 'machine_hint',
      desc: '',
      args: [],
    );
  }

  /// `Add New Customer`
  String get add_customer_title {
    return Intl.message(
      'Add New Customer',
      name: 'add_customer_title',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get customer_name {
    return Intl.message(
      'Customer Name',
      name: 'customer_name',
      desc: '',
      args: [],
    );
  }

  /// `Customer name`
  String get customer_name_hint {
    return Intl.message(
      'Customer name',
      name: 'customer_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `📦 Quantity`
  String get customer_quantity {
    return Intl.message(
      '📦 Quantity',
      name: 'customer_quantity',
      desc: '',
      args: [],
    );
  }

  /// `0`
  String get customer_quantity_hint {
    return Intl.message(
      '0',
      name: 'customer_quantity_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Deletion`
  String get delete_dialog_title {
    return Intl.message(
      'Confirm Deletion',
      name: 'delete_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete?`
  String get delete_dialog_content {
    return Intl.message(
      'Are you sure you want to delete?',
      name: 'delete_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Operation completed successfully`
  String get operation_success {
    return Intl.message(
      'Operation completed successfully',
      name: 'operation_success',
      desc: '',
      args: [],
    );
  }

  /// `Search for machine or customer...`
  String get searchHint {
    return Intl.message(
      'Search for machine or customer...',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Search for machine...`
  String get machine_search_hint {
    return Intl.message(
      'Search for machine...',
      name: 'machine_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Search for customer...`
  String get customer_search_hint {
    return Intl.message(
      'Search for customer...',
      name: 'customer_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_view {
    return Intl.message(
      'Search',
      name: 'search_view',
      desc: '',
      args: [],
    );
  }

  /// `Customer copied`
  String get copied_customer {
    return Intl.message(
      'Customer copied',
      name: 'copied_customer',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
