import 'package:bloc_tut/login_bloc/logic/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final signinBloc = BlocProvider.of<SigninBloc>(context);

    print('widget rebuild');

    return Scaffold(
      body: BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
        if (state is SigninInitial ||
            state is LoadingState ||
            state is ErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.black, style: BorderStyle.solid)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.blue, style: BorderStyle.solid)),
                    hintText: "Email Id",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.black, style: BorderStyle.solid)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.blue, style: BorderStyle.solid)),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                if (state is ErrorState)
                  SizedBox(
                    height: 20,
                  ),
                if (state is ErrorState) Text('Error Ocured'),
                ElevatedButton(
                  onPressed: () {
                    signinBloc.add(UserSignIn(
                      emailController.text,
                      passController.text,
                    ));
                  },
                  child: state is SigninInitial || state is ErrorState
                      ? Text('Login')
                      : CircularProgressIndicator(),
                ),
              ],
            ),
          );
        } else if (state is LoadedState)
          return Center(
            child: Column(
              children: [
                Text(
                  '${state.dataModel.email}',
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      signinBloc.add(LogoutUser());
                    },
                    child: Text('Logout')),
              ],
            ),
          );
      }),
    );
  }
}
