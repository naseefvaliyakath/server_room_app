import 'package:dashbord/screens/components/profile_info.dart';
import 'package:dashbord/screens/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../../controllers/controller.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: context.read<Controller>().controlMenu,
            icon: Icon(Icons.menu,color: textColor.withOpacity(0.5),),
          ),
        Expanded(child: SearchField()),
        ProfileInfo()
      ],
    );
  }
}
