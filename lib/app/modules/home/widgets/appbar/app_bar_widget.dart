import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iupp_components/components/atoms/atoms.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/app/modules/home/repository/home_store.dart';
import 'package:poc_example_integration/screens/widgets/inputs/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final HomeStore homeStore;
  final AuthDatasource authDatasource;

  AppBarWidget({
    required this.homeStore,
    required this.authDatasource,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: true,
      backgroundColor: lead,
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
              SizedBox(width: 100),
              Expanded(child: _buildSearchBar(context)),
              SizedBox(width: 100),
              IconButton(
                tooltip: AppLocalizations.of(context)!.logout,
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

  Widget _buildSearchBar(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [Condition.largerThan(name: MOBILE)],
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: white,
        ),
        child: Observer(
          builder: (_) => TextFieldCustom(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            text: homeStore.searchText,
            controller: homeStore.searchTextController,
            placeholder: AppLocalizations.of(context)!.whatAreYouLookingFor,
            onChanged: homeStore.changeSearch,
            prefixIcon: Tooltip(
              message: AppLocalizations.of(context)!.search,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: homeStore.search,
                  child: Icon(
                    IuppIcons.icone_contorno_B_busca_outline,
                    color: bluePool,
                  ),
                ),
              ),
            ),
            suffixIcon: AnimatedOpacity(
              opacity: homeStore.showCleanSearch ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Tooltip(
                message: AppLocalizations.of(context)!.clearSearch,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: homeStore.clearSearch,
                    child: Icon(
                      IuppIcons.icone_contorno_F_fechar,
                      color: bluePool,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(100);
  }
}
