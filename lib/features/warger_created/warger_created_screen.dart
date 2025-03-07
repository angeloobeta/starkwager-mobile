import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/features/warger_created/widgets/warger_created_app_bar.dart';
import 'package:starkwager/features/warger_created/widgets/warger_created_body.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class WargerCreatedScreen extends ConsumerWidget {
  WargerCreatedScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ScreenLayout.isMobile(context);
    return Scaffold(
      appBar: !isMobile ? WargerCreatedAppBar() : null,
      backgroundColor: context.primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double maxWidth = AppValues.width600;
              final double maxWidthTablet = AppValues.width1440;
              return isMobile
                  ? ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppValues.padding16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(30),
                            WargerCreatedBody(),
                            Spacer(),
                          ],
                        ),
                      ),
                    )
                  : ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidthTablet),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 120, right: 120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            WargerCreatedBody(),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
