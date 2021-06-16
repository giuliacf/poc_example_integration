import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/app_bar/repository/app_bar_store.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';

import '../../../../iupp_icons.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  final String currentPage;
  final authDatasource = Modular.get<AuthDatasource>();
  final store = Modular.get<AppBarStore>();

  AppBarPage({
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: true,
      title: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 58,
                width: 89,
              ),
              SizedBox(
                width: 100,
              ),
              Observer(
                builder: (_) => Expanded(
                    child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: white,
                      ),
                      child: TextFieldCustom(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        text: store.searchedWord,
                        textSize: 14,
                        onChanged: store.changeWord,
                        prefixIcon: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => store.search(store.searchedWord),
                            child: Icon(
                              Icons.search,
                              color: bluePool,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: store.clearSearch,
                          child: TextCustom(
                            text: Strings.clearSearch,
                            fontSize: 12,
                            textDecoration: TextDecoration.underline,
                            textColor: aqua,
                          ),
                        ))
                  ],
                )),
              ),
              SizedBox(
                width: 100,
              ),
              IconButton(
                tooltip: Strings.logout,
                icon: Icon(
                  IuppIcons.icone_solidos_S_sair,
                  color: aqua,
                  size: 24,
                ),
                onPressed: () async => await authDatasource.logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(100);
  }
}
