// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secTraining.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

secTraining _$secTrainingFromJson(Map<String, dynamic> json) => secTraining(
      json['trainingAtd'] == null
          ? null
          : SecTrainingAtdModel.fromJson(
              json['trainingAtd'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$secTrainingToJson(secTraining instance) =>
    <String, dynamic>{
      'trainingAtd': instance.trainingAtd,
    };
