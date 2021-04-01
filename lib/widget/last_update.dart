import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/bloc/weather_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        var incomingDate = (state as WeatherLoadedState).weather.time.toLocal();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Last Update ' +
                TimeOfDay.fromDateTime(incomingDate).format(context),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
