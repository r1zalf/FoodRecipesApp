// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: annotate_overrides

part of 'meal_model.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Meal extends DataClass implements Insertable<Meal> {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strCategory;
  Meal(
      {required this.idMeal,
      required this.strMeal,
      required this.strMealThumb,
      required this.strCategory});
  factory Meal.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Meal(
      idMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal'])!,
      strMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal'])!,
      strMealThumb: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal_thumb'])!,
      strCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_category'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    map['str_meal'] = Variable<String>(strMeal);
    map['str_meal_thumb'] = Variable<String>(strMealThumb);
    map['str_category'] = Variable<String>(strCategory);
    return map;
  }

  MealMoorCompanion toCompanion(bool nullToAbsent) {
    return MealMoorCompanion(
      idMeal: Value(idMeal),
      strMeal: Value(strMeal),
      strMealThumb: Value(strMealThumb),
      strCategory: Value(strCategory),
    );
  }

  factory Meal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Meal(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strMealThumb: serializer.fromJson<String>(json['strMealThumb']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strMealThumb': serializer.toJson<String>(strMealThumb),
      'strCategory': serializer.toJson<String>(strCategory),
    };
  }

  Meal copyWith(
          {String? idMeal,
          String? strMeal,
          String? strMealThumb,
          String? strCategory}) =>
      Meal(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strMealThumb: strMealThumb ?? this.strMealThumb,
        strCategory: strCategory ?? this.strCategory,
      );
  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strCategory: $strCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMeal, strMeal, strMealThumb, strCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strMealThumb == this.strMealThumb &&
          other.strCategory == this.strCategory);
}

class MealMoorCompanion extends UpdateCompanion<Meal> {
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String> strMealThumb;
  final Value<String> strCategory;
  const MealMoorCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
    this.strCategory = const Value.absent(),
  });
  MealMoorCompanion.insert({
    required String idMeal,
    required String strMeal,
    required String strMealThumb,
    required String strCategory,
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal),
        strMealThumb = Value(strMealThumb),
        strCategory = Value(strCategory);
  static Insertable<Meal> custom({
    Expression<String>? idMeal,
    Expression<String>? strMeal,
    Expression<String>? strMealThumb,
    Expression<String>? strCategory,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
      if (strCategory != null) 'str_category': strCategory,
    });
  }

  MealMoorCompanion copyWith(
      {Value<String>? idMeal,
      Value<String>? strMeal,
      Value<String>? strMealThumb,
      Value<String>? strCategory}) {
    return MealMoorCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strCategory: strCategory ?? this.strCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealMoorCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strCategory: $strCategory')
          ..write(')'))
        .toString();
  }
}

class $MealMoorTable extends MealMoor with TableInfo<$MealMoorTable, Meal> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MealMoorTable(this._db, [this._alias]);
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  late final GeneratedColumn<String?> idMeal = GeneratedColumn<String?>(
      'id_meal', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strMealMeta = const VerificationMeta('strMeal');
  late final GeneratedColumn<String?> strMeal = GeneratedColumn<String?>(
      'str_meal', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  late final GeneratedColumn<String?> strMealThumb = GeneratedColumn<String?>(
      'str_meal_thumb', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  late final GeneratedColumn<String?> strCategory = GeneratedColumn<String?>(
      'str_category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idMeal, strMeal, strMealThumb, strCategory];
  @override
  String get aliasedName => _alias ?? 'meal_moor';
  @override
  String get actualTableName => 'meal_moor';
  @override
  VerificationContext validateIntegrity(Insertable<Meal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    } else if (isInserting) {
      context.missing(_strMealThumbMeta);
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMeal};
  @override
  Meal map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Meal.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MealMoorTable createAlias(String alias) {
    return $MealMoorTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MealMoorTable mealMoor = $MealMoorTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [mealMoor];
}
