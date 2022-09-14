//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Products {
  /// Returns a new [Products] instance.
  Products({
    this.ITEM = const [],
  });

  List<Product> ITEM;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Products &&
     other.ITEM == ITEM;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ITEM.hashCode);

  @override
  String toString() => 'Products[ITEM=$ITEM]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'ITEM'] = ITEM;
    return _json;
  }

  /// Returns a new [Products] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Products? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Products[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Products[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Products(
        ITEM: Product.listFromJson(json[r'ITEM']) ?? const [],
      );
    }
    return null;
  }

  static List<Products>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Products>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Products.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Products> mapFromJson(dynamic json) {
    final map = <String, Products>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Products.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Products-objects as value to a dart map
  static Map<String, List<Products>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Products>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Products.listFromJson(entry.value, growable: growable,);
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

