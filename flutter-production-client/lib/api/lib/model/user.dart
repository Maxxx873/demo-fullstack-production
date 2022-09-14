//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class User {
  /// Returns a new [User] instance.
  User({
    this.ID,
    this.ID_GUIDE_CEH,
    this.LASTNAME,
    this.FIRSTNAME,
    this.SURNAME,
    this.ID_GUIDE_CONCERN,
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

  @override
  bool operator ==(Object other) => identical(this, other) || other is User &&
     other.ID == ID &&
     other.ID_GUIDE_CEH == ID_GUIDE_CEH &&
     other.LASTNAME == LASTNAME &&
     other.FIRSTNAME == FIRSTNAME &&
     other.SURNAME == SURNAME &&
     other.ID_GUIDE_CONCERN == ID_GUIDE_CONCERN;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ID == null ? 0 : ID!.hashCode) +
    (ID_GUIDE_CEH == null ? 0 : ID_GUIDE_CEH!.hashCode) +
    (LASTNAME == null ? 0 : LASTNAME!.hashCode) +
    (FIRSTNAME == null ? 0 : FIRSTNAME!.hashCode) +
    (SURNAME == null ? 0 : SURNAME!.hashCode) +
    (ID_GUIDE_CONCERN == null ? 0 : ID_GUIDE_CONCERN!.hashCode);

  @override
  String toString() => 'User[ID=$ID, ID_GUIDE_CEH=$ID_GUIDE_CEH, LASTNAME=$LASTNAME, FIRSTNAME=$FIRSTNAME, SURNAME=$SURNAME, ID_GUIDE_CONCERN=$ID_GUIDE_CONCERN]';

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
    return _json;
  }

  /// Returns a new [User] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static User? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "User[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "User[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return User(
        ID: mapValueOfType<String>(json, r'ID'),
        ID_GUIDE_CEH: mapValueOfType<String>(json, r'ID_GUIDE_CEH'),
        LASTNAME: mapValueOfType<String>(json, r'LASTNAME'),
        FIRSTNAME: mapValueOfType<String>(json, r'FIRSTNAME'),
        SURNAME: mapValueOfType<String>(json, r'SURNAME'),
        ID_GUIDE_CONCERN: mapValueOfType<String>(json, r'ID_GUIDE_CONCERN'),
      );
    }
    return null;
  }

  static List<User>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <User>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = User.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, User> mapFromJson(dynamic json) {
    final map = <String, User>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of User-objects as value to a dart map
  static Map<String, List<User>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<User>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.listFromJson(entry.value, growable: growable,);
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

