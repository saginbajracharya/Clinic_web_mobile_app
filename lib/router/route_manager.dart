import 'package:beamer/beamer.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/view/appointment/appointment_page.dart';
import 'package:clinic/view/auth/change_password.dart';
import 'package:clinic/view/auth/forgot_password.dart';
import 'package:clinic/view/auth/login_page.dart';
import 'package:clinic/view/auth/signup_page.dart';
import 'package:clinic/view/dashboard/dashboard_page.dart';
import 'package:clinic/view/details_page.dart';
import 'package:clinic/view/doctor/doctors_page.dart';
import 'package:clinic/view/navigationbar/navigationbar_page.dart';
import 'package:clinic/view/patient/patient_page.dart';
import 'package:clinic/view/profile.dart';
import 'package:clinic/view/user_view/user_immunization.dart';
import 'package:clinic/view/user_view/user_profile.dart';
import 'package:clinic/view/user_view/user_track_immunization.dart';
import 'package:flutter/material.dart';

final routerDelegate = BeamerDelegate(
  setBrowserTabTitle : false,
  initialPath: '/',
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) {
        int index = 0;
        if(state.queryParameters['tab'] == 'dashboard'){
          index = 0;
        }
        else if(state.queryParameters['tab'] == 'appoinment'){
          index = 1;
        }
        else if(state.queryParameters['tab'] == 'patientList'){
          index = 2;
        }
        else if(state.queryParameters['tab'] == 'doctorList'){
          index = 3;
        }
        final initialIndex = index;
        return NavigationBarPage(initialIndex: initialIndex);
      },
      '/login': (context,state,date){
         return const BeamPage(
          key: ValueKey('login'),
          title: 'login',
          child: Login(),
        );
      },
      '/signup': (context,state,date){
         return const BeamPage(
          key: ValueKey('SignUpPage'),
          title: 'SignUpPage',
          child: SignUpPage(),
        );
      },
      '/forgotPassword': (context,state,date){
        return const BeamPage(
          key: ValueKey('forgotpassword'),
          title: 'forgotpassword',
          child: ForgotPassword(),
        );
      },
      '/changePassword': (context,state,date){
        return const BeamPage(
          key: ValueKey('changePassword'),
          title: 'changePassword',
          child: ChangePassword(),
        );
      },
      '/profile':(context,state,date){
        return const BeamPage(
          key: ValueKey('profile'),
          title: 'profile',
          child: UserProfile(),
        );
      },
      '/immunization' :(context,state,date){
        return const BeamPage(
          key: ValueKey('Immunization'),
          title: 'Immunization',
          child: UserImmunization(),
        );
      },
      '/immunization/:trackImmunization' : (context,state,date){
        return const BeamPage(
          key: ValueKey('Track Immunization'),
          title: 'Track Immunization',
          child: UserTrackImmunization(),
        );
      },
      '/appoinments/:appointmentId': (context, state, data) {
        // final appointmentId = state.pathParameters['appointmentId'];
        // final book = books.firstWhere((book) => book['id'] == appointmentId);
        // return BeamPage(
        //   key: ValueKey('book-$bookId'),
        //   title: book['title'],
        //   child: BookDetailsScreen(book: book),
        //   onPopPage: (context, delegate, _, page) {
        //     delegate.update(
        //       configuration: const RouteInformation(
        //         location: '/?tab=books',
        //       ),
        //       rebuild: false,
        //     );
        //     return true;
        //   },
        // );
      },
      '/doctorList/:doctorName' : (context,state,data){
        final docName = state.pathParameters['doctorName'];
        // Attempt to find the doctor in the list
        final doctorDetails = doctorsList.firstWhere(
          (doctor) => doctor['doctorName'] == docName,
          orElse: () => {'doctorName': 'Not Found'}, // Provide a default value (null in this case)
        );
        return BeamPage(
          key: const ValueKey('docProfile'),
          title: docName,
          child: DetailsPage(docList: doctorDetails),
        );
      },
      '/patientList/:patient': (context, state, data) {
        final patientName = state.pathParameters['patient'];
        // final patient = patientsList.firstWhere((patient) => patient['patientName'] == patientName);
        return BeamPage(
          key: const ValueKey('patientProfile'),
          title: patientName,
          child: PatientProfile(name : patientName),
        );
      },
    },
  ),
  notFoundRedirectNamed: '/',
);

class SideBarXLocation extends BeamLocation<BeamState> {
  SideBarXLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    '/dashboard',
    '/appointments',
    '/doctorList',
    '/patientList'
  ];
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final beamPages = [
      const BeamPage(
        key: ValueKey('clinic-daas'),
        title: 'Dashboard',
        child: DashboardPage(),
      ),
    ];
    if (state.pathPatternSegments.contains('dashboard')){
      beamPages.add(
        const BeamPage(
          key: ValueKey('clinic-dashboard'),
          title: 'Dashboard',
          child: DashboardPage(),
        ),
      );
    }
    else if (state.pathPatternSegments.contains('appointments')){
      beamPages.add(
        const BeamPage(
          key: ValueKey('clinic-appointments'),
          title: 'Appointments',
          child: AppointmentPage(),
        )
      );
    }
    else if (state.pathPatternSegments.contains('patientList')){
      if(state.pathParameters.containsKey('patient')){
        //Dont do anything
      }
      else{
        beamPages.add(
          const BeamPage(
            key: ValueKey('clinic-patient'),
            title: 'Patient',
            child: PatientViewPage(),
          ),
        );
      }
    }
    else if (state.pathPatternSegments.contains('doctorList')){
      if(state.pathParameters.containsKey('doctorName')){
        final docName = state.pathParameters['doctorName'];
        final doctorDetails = doctorsList.firstWhere(
          (doctor) => doctor['doctorName'] == docName,
          orElse: () => {'doctorName': 'Not Found'}, // Provide a default value (null in this case)
        );
        beamPages.add(
          BeamPage(
            key: const ValueKey('docProfile'),
            title: docName,
            child: DetailsPage(docList: doctorDetails),
          ),
        );
      }
      else{
        beamPages.add(
          const BeamPage(
            key: ValueKey('clinic-doctorList'),
            title: 'Doctor List',
            child: DoctorViewPage(),
          ),
        );
      }
    }
    else if (state.pathPatternSegments.contains('profile')){
      beamPages.add(
        const BeamPage(
          key: ValueKey('profile'),
          title: 'profile',
          child: UserProfile(),
        )
      );
    }
    return beamPages;
  }
}