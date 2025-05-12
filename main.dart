import 'package:fhc_superapp/core/constants/app_constants.dart';
import 'package:fhc_superapp/core/constants/theme_constants.dart';
import 'package:fhc_superapp/core/services/routing_service.dart';
import 'package:fhc_superapp/core/shared/state/button_provider.dart';
import 'package:fhc_superapp/features/authentication/state/authentication_provider.dart';
import 'package:fhc_superapp/features/dashboard/state/dashboard_provider.dart';
import 'package:fhc_superapp/features/home/state/home_provider.dart';
import 'package:fhc_superapp/features/profile/state/profile_provider.dart';
import 'package:fhc_superapp/features/renew_contract/state/renew_contract_provider.dart';
import 'package:fhc_superapp/features/services/categories/document/ads/state/ads_management_provider.dart';
import 'package:fhc_superapp/features/services/categories/hr/attendance/state/attendance_provider.dart';
import 'package:fhc_superapp/features/services/categories/hr/pay_slip/state/pay_slip_provider.dart';
import 'package:fhc_superapp/features/services/categories/procurment/bid/state/bid_managment_provider.dart';
import 'package:fhc_superapp/features/services/categories/property/bill_history/state/bill_history_provider.dart';
import 'package:fhc_superapp/features/services/categories/app/Permissions/user_permissions/state/user_permissions_provider.dart';
import 'package:fhc_superapp/features/services/categories/hr/employee_profile/state/employee_profile_provider.dart';
import 'package:fhc_superapp/features/services/categories/hr/leave_management/state/leave_management_provider.dart';
import 'package:fhc_superapp/features/services/categories/property/features/property_detail/state/property_detail_provider.dart';
import 'package:fhc_superapp/features/services/state/services_provider.dart';
import 'package:fhc_superapp/features/services/categories/property/todo/state/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final routingService = RoutingService();
  runApp( Main(
    routingService: routingService,
  ));
}

class Main extends StatelessWidget {
  final RoutingService routingService;

  const Main({
    required this.routingService,
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ButtonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(
            buttonProvider: context.read<ButtonProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AdsManagementProvider(
            buttonProvider: context.read<ButtonProvider>(),
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(
            buttonProvider: context.read<ButtonProvider>(),
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PropertyDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ServicesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BillHistoryProvider(
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PaySlipProvider(
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AttendanceProvider(
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => EmployeeProfileProvider(
            buttonProvider: context.read<ButtonProvider>(),
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LeaveManagementProvider(
            buttonProvider: context.read<ButtonProvider>(),
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => UserPermissionsProvider(
            buttonProvider: context.read<ButtonProvider>(),
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ToDoProvider(
            // buttonProvider: context.read<ButtonProvider>(),
            authenticationProvider: context.read<AuthenticationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => RenewContractProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BidManagmentProvider(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: routingService.router.routerDelegate,
        routeInformationParser: routingService.router.routeInformationParser,
        routeInformationProvider:
            routingService.router.routeInformationProvider,
        title: AppConstants.appTitle,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: ThemeConstants.primaryColor),
          // useMaterial3: false,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
