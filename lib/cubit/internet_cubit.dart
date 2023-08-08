// cubit exact bloc ki trh hi h bs ise bloc ko emit krne ke liye event ki need ni h

// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Lost, Gained }
// we use enum when the states have no data

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.Initial) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.Gained);
      } else {
        emit(InternetState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
