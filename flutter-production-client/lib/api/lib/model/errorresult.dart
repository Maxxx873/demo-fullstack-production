//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ERRORRESULT {
  /// Returns a new [ERRORRESULT] instance.
  ERRORRESULT({
    this.EXITCODE,
    this.EXITTEXT,
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

  @override
  bool operator ==(Object other) => identical(this, other) || other is ERRORRESULT &&
     other.EXITCODE == EXITCODE &&
     other.EXITTEXT == EXITTEXT;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (EXITCODE == null ? 0 : EXITCODE!.hashCode) +
    (EXITTEXT == null ? 0 : EXITTEXT!.hashCode);

  @override
  String toString() => 'ERRORRESULT[EXITCODE=$EXITCODE, EXITTEXT=$EXITTEXT]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (EXITCODE != null) {
      _json[r'EXITCODE'] = EXITCODE;
    }
    if (EXITTEXT != null) {
      _json[r'EXITTEXT'] = EXITTEXT;
    }
    return _json;
  }

  /// Returns a new [ERRORRESULT] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ERRORRESULT? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ERRORRESULT[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ERRORRESULT[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ERRORRESULT(
        EXITCODE: mapValueOfType<int>(json, r'EXITCODE'),
        EXITTEXT: mapValueOfType<String>(json, r'EXITTEXT'),
      );
    }
    return null;
  }

  static List<ERRORRESULT>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ERRORRESULT>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ERRORRESULT.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ERRORRESULT> mapFromJson(dynamic json) {
    final map = <String, ERRORRESULT>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ERRORRESULT.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ERRORRESULT-objects as value to a dart map
  static Map<String, List<ERRORRESULT>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ERRORRESULT>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ERRORRESULT.listFromJson(entry.value, growable: growable,);
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

