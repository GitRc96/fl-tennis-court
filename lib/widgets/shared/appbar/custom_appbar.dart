import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        stops: [0.1,0.8],
        colors: [
          Color(0xff82BC00),
          Color(0xff03204b),
        ])
    );

    return Container(
      height: 100,
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 10, left: 20, right: 20),
        child: Row(
          children: [
            //Logo
            const _Logo(),
            Expanded(child: Container()),

            //CircleAvatar
            const _CircleAvatar(),
            const SizedBox(width: 10,),

            //Notification button
            InkWell(
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 24,),
              onTap: () {},
            ),
            const SizedBox(width: 10,),

            //Menu button
            InkWell(
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 24,),
              onTap: () {},
            ),

          ],
        ),
      ),
    );
  }
}

class _CircleAvatar extends StatefulWidget {
  const _CircleAvatar();

  @override
  State<_CircleAvatar> createState() => _CircleAvatarState();
}

class _CircleAvatarState extends State<_CircleAvatar> {

    final GlobalKey _circleAvatarKey = GlobalKey();

  void _openPopupMenu() {
    RenderBox renderBox = _circleAvatarKey.currentContext!.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy + renderBox.size.height, offset.dx + renderBox.size.width, offset.dy),
      items: [
        const PopupMenuItem<int>(
          value: 1,
          child: Text('Perfil'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('Salir'),
        ),
      ],
    ).then((value) {
      if (value == 2) {
        FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context, '/');
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: InkWell(
        key: _circleAvatarKey,
        onTap: _openPopupMenu,
        child: CircleAvatar(
          child: Image.asset('assets/image/avatar.png'),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {

    const boxDecoration2 = BoxDecoration(
      gradient: LinearGradient(
      stops: [0,1],
      colors: [
        Colors.transparent,
        Color(0xff82BC00),
      ])
    );

    return SizedBox(
      width: 170,
      child: Row(
        children: [
          const Text(
            'Tennis',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18),),
          const SizedBox(width: 10),
          Container(
            width: 50,
            height: 30,
            decoration: boxDecoration2,
            child: const _TextCourt(),
          )
        ],
      ),
    );
  }
}

class _TextCourt extends StatelessWidget {
  const _TextCourt();

  @override
  Widget build(BuildContext context) {

    const textStyleCourt = TextStyle(
      color: Colors.white,
      fontSize: 18);
    var boxDecoration3 = BoxDecoration(
      border: Border.all(
        color: Colors.white
      ),
      borderRadius: BorderRadius.circular(100),
      color: const Color(0xff82BC00),
    );

    return Row(
      children: [
        const Text(
          'c',
          style: textStyleCourt,),
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(top: 2),
          decoration: boxDecoration3,
        ),
        const Text(
          'urt',
          style: textStyleCourt,),
      ],
    );
  }
}