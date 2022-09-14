//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RESULTDATA {
  /// Returns a new [RESULTDATA] instance.
  RESULTDATA({
    this.ID,
    this.ID_GUIDE_CEH,
    this.LASTNAME,
    this.FIRSTNAME,
    this.SURNAME,
    this.ID_GUIDE_CONCERN,
    this.ITEM = const [],
  });

  /// User ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ID;

  /// ID of the user's department
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ID_GUIDE_CEH;

  /// User`s lastname
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? LASTNAME;

  /// User`s firstname
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? FIRSTNAME;

  /// User`s surname
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? SURNAME;

  /// The user's enterprise ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ID_GUIDE_CONCERN;

  List<Product> ITEM;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RESULTDATA &&
     other.ID == ID &&
     other.ID_GUIDE_CEH == ID_GUIDE_CEH &&
     other.LASTNAME == LASTNAME &&
     other.FIRSTNAME == FIRSTNAME &&
     other.SURNAME == SURNAME &&
     other.ID_GUIDE_CONCERN == ID_GUIDE_CONCERN &&
     other.ITEM == ITEM;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ID == null ? 0 : ID!.hashCode) +
    (ID_GUIDE_CEH == null ? 0 : ID_GUIDE_CEH!.hashCode) +
    (LASTNAME == null ? 0 : LASTNAME!.hashCode) +
    (FIRSTNAME == null ? 0 : FIRSTNAME!.hashCode) +
    (SURNAME == null ? 0 : SURNAME!.hashCode) +
    (ID_GUIDE_CONCERN == null ? 0 : ID_GUIDE_CONCERN!.hashCode) +
    (ITEM.hashCode);

  @override
  String toString() => 'RESULTDATA[ID=$ID, ID_GUIDE_CEH=$ID_GUIDE_CEH, LASTNAME=$LASTNAME, FIRSTNAME=$FIRSTNAME, SURNAME=$SURNAME, ID_GUIDE_CONCERN=$ID_GUIDE_CONCERN, ITEM=$ITEM]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (ID != null) {
      _json[r'ID'] = ID;
    }
    if (ID_GUIDE_CEH != null) {
      _json[r'ID_GUIDE_CEH'] = ID_GUIDE_CEH;
    }
    if (LASTNAME != null) {
      _json[r'LASTNAME'] = LASTNAME;
    }
    if (FIRSTNAME != null) {
      _json[r'FIRSTNAME'] = FIRSTNAME;
    }
    if (SURNAME != null) {
      _json[r'SURNAME'] = SURNAME;
    }
    if (ID_GUIDE_CONCERN != null) {
      _json[r'ID_GUIDE_CONCERN'] = ID_GUIDE_CONCERN;
    }
      _json[r'ITEM'] = ITEM;
    return _json;
  }

  /// Returns a new [RESULTDATA] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RESULTDATA? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RESULTDATA[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RESULTDATA[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RESULTDATA(
        ID: mapValueOfType<String>(json, r'ID'),
        ID_GUIDE_CEH: mapValueOfType<String>(json, r'ID_GUIDE_CEH'),
        LASTNAME: mapValueOfType<String>(json, r'LASTNAME'),
        FIRSTNAME: mapValueOfType<String>(json, r'FIRSTNAME'),
        SURNAME: mapValueOfType<String>(json, r'SURNAME'),
        ID_GUIDE_CONCERN: mapValueOfType<String>(json, r'ID_GUIDE_CONCERN'),
        ITEM: Product.listFromJson(json[r'ITEM']) ?? const [],
      );
    }
    return null;
  }

  static List<RESULTDATA>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RESULTDATA>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RESULTDATA.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RESULTDATA> mapFromJson(dynamic json) {
    final map = <String, RESULTDATA>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RESULTDATA.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RESULTDATA-objects as value to a dart map
  static Map<String, List<RESULTDATA>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RESULTDATA>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RESULTDATA.listFromJson(entry.value, growable: growable,);
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

