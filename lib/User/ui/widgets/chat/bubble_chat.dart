import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  final bool isMe;
  final String message;
  String role;
  // final String myRole;

  // BubbleChat({this.message, this.isMe, this.role, this.myRole});
  BubbleChat({this.isMe, this.message, this.role});

  Widget build(BuildContext context) {
    return Container(
      padding: isMe ? EdgeInsets.only(left: 20) : EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Column(children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: <Widget>[
                        // isMe
                        //     ? Container(
                        //         width: 10,
                        //       )
                        //     : Container(
                        //         child: Padding(
                        //           padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        //           child: _avatar(
                        //             this.role,
                        //           ),
                        //         ),
                        //       ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  isMe ? Color(0xFFFFF7E4) : Color(0xFFE5F4F9),
                              borderRadius: isMe
                                  ? BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(15),
                                    )
                                  : BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(0),
                                    ),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(16, 8, 12, 8),
                              child: Text(
                                message,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  // color: IndevColors.black,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                  Container(), //hora y fecha
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _avatar(String role) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: _selectColor(role),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(6),
      // child: _selectAvatar(role,
      //     height: 30,
      //     width: SizeConfig.blockSizeHorizontal * 100),
    );
  }

  // SvgPicture _selectAvatar(String iconRol,
  //     {Color color, double height, double width}) {
  //   var icon;
  //   print("avatar: $iconRol");
  //   switch (iconRol.toLowerCase()) {
  //     case "juez":
  //       icon = SvgPicture.asset(
  //         "assets/img/juez_color.svg",
  //       );
  //       break;
  //     case "fiscalia":
  //       icon = SvgPicture.asset(
  //         "assets/img/fiscalia_color.svg",
  //       );
  //       break;
  //     case "defensa":
  //       icon = SvgPicture.asset(
  //         "assets/img/abogado_color.svg",
  //       );
  //       break;
  //     case "secretario":
  //       icon = SvgPicture.asset(
  //         "assets/img/mujer.svg",
  //       );
  //       break;
  //   }
  //   return icon;
  // }

  Color _selectColor(String role) {
    var color;
    print("Color: $role");
    switch (role.toLowerCase()) {
      case "fiscalia":
        color = Color(0xFF7DB1FD);
        break;
      case "juez":
        color = Color(0xFF7FF100);
        break;
      case "secretario":
        color = Color(0xFF8D88CE);
        break;
      case "defensa":
        color = Color(0xFFEACACA);
        break;
    }
    return color;
  }
}