//make connection between event and state

import 'dart:async';

import 'package:bloc_demo/blocs/internet_bloc/internet_event.dart';
import 'package:bloc_demo/blocs/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// we make abstract class because its take only one type of class for both state and event
class InternetBloc extends Bloc<InternetEvent,InternetState>{
 final Connectivity _connectivity = Connectivity();
 StreamSubscription? connectivitySubscription; // for manage performance

  //super initialize bloc(initialize extended class like stateless widget example in that we use super)
 InternetBloc() : super(InternetInitialState()){
   on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
   on<InternetGainedEvent>((event,emit)=>emit(InternetGainedState()));


  connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
 if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
  add(InternetGainedEvent());
  }else{
  add(InternetLostEvent());
   }
   });

  @override
   Future<void> close(){
   connectivitySubscription?.cancel();
   return super.close();
  }
  }






}