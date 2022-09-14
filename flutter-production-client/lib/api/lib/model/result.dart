//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RESULT {
  /// Returns a new [RESULT] instance.
  RESULT({
    this.EXITCODE,
    this.EXITTEXT,
    this.PAGE_SIZE,
    this.PAGE,
    this.RECORD_COUNT,
    this.NUMBER_OF_PAGES,
    this.DATA,
  });

  /// Function execution result code
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? EXITCODE;

  /// The text of the execution result
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? EXITTEXT;

  /// Page size
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? PAGE_SIZE;

  /// Current page
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? PAGE;

  /// The total number of entries
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? RECORD_COUNT;

  /// Number of pages
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? NUMBER_OF_PAGES;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RESULTDATA? DATA;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RESULT &&
     other.EXITCODE == EXITCODE &&
     other.EXITTEXT == EXITTEXT &&
     other.PAGE_SIZE == PAGE_SIZE &&
     other.PAGE == PAGE &&
     other.RECORD_COUNT == RECORD_COUNT &&
     other.NUMBER_OF_PAGES == NUMBER_OF_PAGES &&
     other.DATA == DATA;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (EXITCODE == null ? 0 : EXITCODE!.hashCode) +
    (EXITTEXT == null ? 0 : EXITTEXT!.hashCode) +
    (PAGE_SIZE == null ? 0 : PAGE_SIZE!.hashCode) +
    (PAGE == null ? 0 : PAGE!.hashCode) +
    (RECORD_COUNT == null ? 0 : RECORD_COUNT!.hashCode) +
    (NUMBER_OF_PAGES == null ? 0 : NUMBER_OF_PAGES!.hashCode) +
    (DATA == null ? 0 : DATA!.hashCode);

  @override
  String toString() => 'RESULT[EXITCODE=$EXITCODE, EXITTEXT=$EXITTEXT, PAGE_SIZE=$PAGE_SIZE, PAGE=$PAGE, RECORD_COUNT=$RECORD_COUNT, NUMBER_OF_PAGES=$NUMBER_OF_PAGES, DATA=$DATA]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (EXITCODE != null) {
      _json[r'EXITCODE'] = EXITCODE;
    }
    if (EXITTEXT != null) {
      _json[r'EXITTEXT'] = EXITTEXT;
    }
    if (PAGE_SIZE != null) {
      _json[r'PAGE_SIZE'] = PAGE_SIZE;
    }
    if (PAGE != null) {
      _json[r'PAGE'] = PAGE;
    }
    if (RECORD_COUNT != null) {
      _json[r'RECORD_COUNT'] = RECORD_COUNT;
    }
    if (NUMBER_OF_PAGES != null) {
      _json[r'NUMBER_OF_PAGES'] = NUMBER_OF_PAGES;
    }
    if (DATA != null) {
      _json[r'DATA'] = DATA;
    }
    return _json;
  }

  /// Returns a new [RESULT] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RESULT? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RESULT[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RESULT[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RESULT(
        EXITCODE: mapValueOfType<int>(json, r'EXITCODE'),
        EXITTEXT: mapValueOfType<String>(json, r'EXITTEXT'),
        PAGE_SIZE: mapValueOfType<int>(json, r'PAGE_SIZE'),
        PAGE: mapValueOfType<int>(json, r'PAGE'),
        RECORD_COUNT: mapValueOfType<int>(json, r'RECORD_COUNT'),
        NUMBER_OF_PAGES: mapValueOfType<int>(json, r'NUMBER_OF_PAGES'),
        DATA: RESULTDATA.fromJson(json[r'DATA']),
      );
    }
    return null;
  }

  static List<RESULT>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RESULT>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RESULT.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RESULT> mapFromJson(dynamic json) {
    final map = <String, RESULT>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RESULT.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RESULT-objects as value to a dart map
  static Map<String, List<RESULT>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RESULT>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RESULT.listFromJson(entry.value, growable: growable,);
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

