import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/WeatherCubit.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: TextField(
              onSubmitted: (data) {
                city = data;

                BlocProvider.of<WeatherCubit>(context, listen: false)
                    .getWeather(CityName: city!);

                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: "Search",
                hintText: "Enter City Name",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String? city;
