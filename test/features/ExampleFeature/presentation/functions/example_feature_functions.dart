import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:../core/error/failures.dart';
import 'package:../core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:../featchers/example_feature/domain/useCase/example_feature_use_case.dart';
import 'package:../featchers/example_feature/presentation/bloc/example_feature_cubit.dart';

import '../../domain/model/example_feature_model.dart';

class ExampleFeatureFunctions {
  ExampleFeatureModel? ExampleFeatureModel;

  Future<Either<Failure, ExampleFeatureModel>> getExampleFeatures(
      ExampleFeatureUseCase? ExampleFeatureUseCase,
      void Function(ExampleFeatureState state) emit) async {
    print("getExampleFeatures");

    emit(ExampleFeatureLoading());
    return ExampleFeatureUseCase!.call(GetExampleFeatureParms()).then((value) {
      if (value.isRight()) {
        AppApiResponse? _data = value.getOrElse(() => AppApiResponse());
        ExampleFeatureModel _ExampleFeatureModel =
            ExampleFeatureModel.fromJson(jsonDecode(_data.body!));
        //emit(ExampleFeatureLoaded(ExampleFeatureModel: _ExampleFeatureModel));

        ExampleFeatureModel = _ExampleFeatureModel;
        return Right(_ExampleFeatureModel);
      } else {
        //emit(ExampleFeatureError(message: value.fold((l) => l.toString(), (r) => "")));
        return Left(value.fold((l) => l, (r) => UnImplement()));
      }
    });
  }
}
