import 'package:flutter/material.dart';
import 'package:temis/User/model/case.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/widgets/loading.dart';

class StarGame extends StatefulWidget {
  @override
  _StarGameState createState() => _StarGameState();
}

class _StarGameState extends State<StarGame> {
  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            width: double.infinity,
            child: StreamBuilder<CaseModel>(
              stream: DatabaseService().dataCase(game.idCase),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                game.caseGame = snapshot.data;
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          //width: double.infinity,
                          child: Text(
                            game.caseGame.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Antecedentes del Caso",
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          game.caseGame.description,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.subtitle,
                            children: [
                              TextSpan(
                                text: "Numero de finales posibles: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryVariant),
                              ),
                              TextSpan(
                                text: game.caseGame.numberPossibleEndings
                                    .toString(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 40),
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed('chat',
                                  arguments: game);
                            },
                            child: Text("Comenzar"),
                            //color: Color(0xff7ec7d0),
                            shape: RoundedRectangleBorder(),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Loading();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}