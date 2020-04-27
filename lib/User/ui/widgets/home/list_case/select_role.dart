import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/role.dart';
import 'package:temis/User/ui/widgets/home/list_case/role_widget.dart';

class SelectRole extends StatefulWidget {
  String idCase;

  SelectRole({@required this.idCase});

  @override
  _SelectRoleState createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff292A2D),
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 45.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Selecciona el rol a jugar",
            style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          Row(
            children: <Widget>[
              RoleWidget(
                icon: "face",
                text: "Juez",
                game: Game(
                  idCase: widget.idCase,
                  role: Role().juez,
                ),
              ),
              Spacer(),
              RoleWidget(
                icon: "face",
                text: "Fiscalia",
                game: Game(
                  idCase: widget.idCase,
                  role: Role().fiscalia,
                ),
              ),
              Spacer(),
              RoleWidget(
                icon: "face",
                text: "Defensa",
                game: Game(
                  idCase: widget.idCase,
                  role: Role().defensa,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
