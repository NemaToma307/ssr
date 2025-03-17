
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssr_project/features/place_recommendation/logic/form_state.dart';


class FormCubit extends Cubit<FormStates> {


  FormCubit() : super(InitialState());

  static FormCubit get(context) => BlocProvider.of(context);

  void form(
      String businessName,
      var budget ,
      String? dropDownValue,
      dynamic list1,
      dynamic list2,
      String? statusValue,

      )
  {
    emit(FormSuccessFillState());
    // print('here1');
    // if (businessName.isEmpty || statusValue == null || dropDownValue == null || maxValueRange == 0) {
    //   print('here2');
    //   emit(FormErrorState("Please fill all fields"));
    // } else {
    //   print('here3');
    //   emit(FormSuccessFillState());
    // }
  }
}