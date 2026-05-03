import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/routes/route_generator.dart';
import 'package:ayadati/core/theme/app_theme.dart';
import 'package:ayadati/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  getItInit();
  runApp(const Ayadati());
}

class Ayadati extends StatelessWidget {
  const Ayadati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ayadati app',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: AppRoutes.splashView,
      theme: AppTheme.mainTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates:const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale:const Locale('ar'),
    );
  }
}
