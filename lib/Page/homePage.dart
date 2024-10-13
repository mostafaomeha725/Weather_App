import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/WeatherCubit.dart';
import 'package:weatherapp/Cubit/WeatherState.dart';
import 'package:weatherapp/Page/SearchPage.dart';
import 'package:weatherapp/model/weatherModel.dart';

class homePage extends StatelessWidget {
  WeatherModel? Data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: BlocProvider.of<WeatherCubit>(context).Dataa == null
        //     ? Colors.orange
        //     : BlocProvider.of<WeatherCubit>(context).Dataa!.getColor(),
        backgroundColor: Colors.orange,
        //     ? Colors.orange
        title: const Text("Weather"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            Data = BlocProvider.of<WeatherCubit>(context).Dataa;
            return Container(
              decoration: BoxDecoration(
                color: Data?.getColor(),
                gradient: LinearGradient(
                  colors: [
                    Data!.getColor(),
                    Data!.getColor()[100]!,
                    Data!.getColor()[400]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 4,
                  ),
                  Text(
                    "${city}",
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${Data?.data}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("${Data?.getImage()}"),
                      Text(
                        "${Data?.Temp?.toInt()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Column(
                        children: [
                          Text("maxTemp = ${Data?.maxTemp?.toInt()}"),
                          Text("minTemp = ${Data?.minTemp?.toInt()}"),
                        ],
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    "${Data?.Condition}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 8,
                  ),
                ],
              ),
            );
          } else if (state is WeatherFailure) {
            return Center(child: Text(state.errMessage.toString()));
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("there is no weather 😔 start",
                      style: TextStyle(
                        fontSize: 30,
                      )),
                ),
                Text(
                  "searching now 🔎",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
