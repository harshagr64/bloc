import 'package:bloc_tut/login_bloc/logic/bloc/signin_bloc.dart';
import 'package:bloc_tut/login_bloc/presentation/login_screen.dart';
import 'package:bloc_tut/login_bloc/repo/login_repo.dart';
import 'package:bloc_tut/responsive_ui/presentation/styling.dart';
import 'package:bloc_tut/responsive_ui/presentation/welcome_screen.dart';
import 'package:bloc_tut/responsive_ui/size_config.dart';
import 'package:bloc_tut/weather_app/blocs/bloc/weather_bloc.dart';
import 'package:bloc_tut/weather_app/models/data_model.dart';
import 'package:bloc_tut/weather_app/repository/weather_repo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final SinginRepo singinRepo = SinginRepo();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninBloc(singinRepo),
      child: MaterialApp(
        title: 'Login Page',
        home: LoginScreen(),
      ),
    );
    // return LayoutBuilder(
    //   builder: (BuildContext context, BoxConstraints constraints) {
    //     return OrientationBuilder(
    //       builder: (BuildContext context, Orientation orientation) {
    //         SizeConfig().init(constraints, orientation);
    //         return MaterialApp(
    //           title: 'Flutter Demo',
    //           theme: AppTheme.lightTheme,
    //           home: WelcomeScreen(),
    //           // home: Scaffold(
    //           //   resizeToAvoidBottomInset: false,
    //           //   backgroundColor: Colors.grey[900],
    //           //   body: SearchPage(),
    //           // ),
    //         );
    //       },
    //     );
    //   },
    // );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial)
              return Container(
                padding: EdgeInsets.only(
                  left: 32,
                  right: 32,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Search Weather",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70),
                    ),
                    Text(
                      "Instanly",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Colors.white70),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.white70,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid)),
                        hintText: "City Name",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onPressed: () {
                          weatherBloc.add(FetchWeather(cityController.text));
                        },
                        color: Colors.lightBlue,
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              );
            else if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              return ShowWeather(
                fetchedData: state.dataModel,
                city: '${cityController.text}',
              );
            }
            return Text('Error');
          },
        ),
      ],
    );
  }
}

class ShowWeather extends StatelessWidget {
  final DataModel fetchedData;
  final city;

  const ShowWeather({Key key, this.fetchedData, this.city}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(
          children: <Widget>[
            Text(
              "$city",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${fetchedData.humidity}",
              style: TextStyle(color: Colors.white70, fontSize: 50),
            ),
            Text(
              "Temprature",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "weather",
                      style: TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    Text(
                      "Min Temprature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "weather",
                      style: TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    Text(
                      "Max Temprature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {},
                color: Colors.lightBlue,
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            )
          ],
        ));
  }
}
