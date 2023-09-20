
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState{initial , lost , gained} //if data is not present then we write this in one line or not need to make one file separately like this

class InternetCubit extends Cubit<InternetState>{
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

 InternetCubit() : super(InternetState.initial){
   connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
     if(result == ConnectivityResult.mobile||result == ConnectivityResult.wifi){
       emit(InternetState.gained);
     }else{
       emit(InternetState.lost);
     }
   });
 }

 @override
  Future<void> close() {
    // TODO: implement close
   connectivitySubscription?.cancel();
    return super.close();
  }

}