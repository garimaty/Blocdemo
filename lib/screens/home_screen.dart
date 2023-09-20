
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/internet_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child:
            //----> bloc
          // BlocConsumer<InternetBloc,InternetState>(
          //     builder: (context, state) {
          //     //if(state==)
          //       //to check value
          //       //is to check data type
          //       if(state is InternetGainedState){
          //         return const Text("Connected!",
          //         style: TextStyle(
          //           color: Colors.green
          //         ),
          //         );
          //       }
          //       else if(state is InternetLostState){
          //         return const Text("Not Connected!",
          //         style: TextStyle(
          //           color: Colors.red
          //         ),
          //         );
          //       }
          //       else {
          //         return const Text("Loading..",
          //         style: TextStyle(
          //           color: Colors.blue
          //         ),
          //         );
          //       }
          //     }, listener: (BuildContext context, InternetState state) {
          //       if(state is InternetGainedState){
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //               content:Text("Internet Connected"),
          //             backgroundColor: Colors.green,
          //           )
          //         );
          //       } else if(state is InternetLostState){
          //         ScaffoldMessenger.of(context).showSnackBar(
          //             const SnackBar(
          //               content:Text("Internet Not Connected"),
          //               backgroundColor: Colors.red,
          //             )
          //         );
          //       }
          // },
          // )
        BlocConsumer<InternetCubit,InternetState>(//cubit
            builder: (context, state) {
            //if(state==)
              //to check value
              //is to check data type
              if(state == InternetState.gained){
                return const Text("Connected!",
                style: TextStyle(
                  color: Colors.green
                ),
                );
              }
              else if(state == InternetState.lost){
                return const Text("Not Connected!",
                style: TextStyle(
                  color: Colors.red
                ),
                );
              }
              else {
                return const Text("Loading..",
                style: TextStyle(
                  color: Colors.blue
                ),
                );
              }
            }, listener: (BuildContext context, InternetState state) {
              if(state == InternetState.gained){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:Text("Internet Connected"),
                    backgroundColor: Colors.green,
                  )
                );
              } else if(state == InternetState.lost){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:Text("Internet Not Connected"),
                      backgroundColor: Colors.red,
                    )
                );
              }
        },
        )
        ),
      ),
    );
  }
}
