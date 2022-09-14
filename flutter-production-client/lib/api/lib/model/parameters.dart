//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Parameters {
  /// Returns a new [Parameters] instance.
  Parameters({
    this.user,
    this.pswd,
    this.idLang,
    this.year,
    this.month,
    this.izd,
    this.pageSize,
    this.page,
  });

  /// User login
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? user;

  /// Hash sum of the password
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pswd;

  /// Language ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? idLang;

  /// Release year
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? year;

  /// Release month
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? month;

  /// Product
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? izd;

  /// Page size
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pageSize;

  /// Page
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? page;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Parameters &&
     other.user == user &&
     other.pswd == pswd &&
     other.idLang == idLang &&
     other.year == year &&
     other.month == month &&
     other.izd == izd &&
     other.pageSize == pageSize &&
     other.page == page;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (user == null ? 0 : user!.hashCode) +
    (pswd == null ? 0 : pswd!.hashCode) +
    (idLang == null ? 0 : idLang!.hashCode) +
    (year == null ? 0 : year!.hashCode) +
    (month == null ? 0 : month!.hashCode) +
    (izd == null ? 0 : izd!.hashCode) +
    (pageSize == null ? 0 : pageSize!.hashCode) +
    (page == null ? 0 : page!.hashCode);

  @override
  String toString() => 'Parameters[user=$user, pswd=$pswd, idLang=$idLang, year=$year, month=$month, izd=$izd, pageSize=$pageSize, page=$page]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (user != null) {
      _json[r'user'] = user;
    }
    if (pswd != null) {
      _json[r'pswd'] = pswd;
    }
    if (idLang != null) {
      _json[r'id_lang'] = idLang;
    }
    if (year != null) {
      _json[r'year'] = year;
    }
    if (month != null) {
      _json[r'month'] = month;
    }
    if (izd != null) {
      _json[r'izd'] = izd;
    }
    if (pageSize != null) {
      _json[r'page_size'] = pageSize;
    }
    if (page != null) {
      _json[r'page'] = page;
    }
    return _json;
  }

  /// Returns a new [Parameters] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Parameters? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Parameters[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Parameters[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Parameters(
        user: mapValueOfType<String>(json, r'user'),
        pswd: mapValueOfType<String>(json, r'pswd'),
        idLang: mapValueOfType<String>(json, r'id_lang'),
        year: mapValueOfType<String>(json, r'year'),
        month: mapValueOfType<String>(json, r'month'),
        izd: mapValueOfType<String>(json, r'izd'),
        pageSize: mapValueOfType<String>(json, r'page_size'),
        page: mapValueOfType<String>(json, r'page'),
      );
    }
    return null;
  }

  static List<Parameters>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Parameters>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Parameters.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Parameters> mapFromJson(dynamic json) {
    final map = <String, Parameters>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Parameters.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Parameters-objects as value to a dart map
  static Map<String, List<Parameters>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Parameters>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Parameters.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

