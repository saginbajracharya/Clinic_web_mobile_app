import 'package:beamer/beamer.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/view/appointment/appointment_page.dart';
import 'package:clinic/view/auth/forgot_password.dart';
import 'package:clinic/view/auth/login_page.dart';
import 'package:clinic/view/auth/signup_page.dart';
import 'package:clinic/view/dashboard/dashboard_page.dart';
import 'package:clinic/view/doctor/doctors_page.dart';
import 'package:clinic/view/navigationbar/navigationbar_page.dart';
import 'package:clinic/view/patient/patient_page.dart';
import 'package:clinic/view/profile.dart';
import 'package:clinic/view/user_view/user_immunization.dart';
import 'package:clinic/view/details_page.dart';
import 'package:clinic/view/user_view/user_profile.dart';
import 'package:clinic/view/user_view/user_track_immunization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AuthLocation extends BeamLocation<BeamState> {
  AuthLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    '/login',
    '/dashboard',
    '/signup',
    '/forgotPassword'
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    state.pathPatternSegments.contains('login') 
    ?const BeamPage(
      key: ValueKey('login'),
      title: 'Login',
      child: Login(),
    )
    :const BeamPage(
      key: ValueKey('clinic'),
      title: 'Clinic',
      child: NavigationBarPage(initialIndex: 0),
    ),
    if(state.pathPatternSegments.contains('signup'))
    const BeamPage(
      key: ValueKey('signup'),
      title: 'Signup',
      child: SignUpPage(),
    ),
    if(state.pathPatternSegments.contains('forgotPassword'))
    const BeamPage(
      key: ValueKey('forgotPassword'),
      title: 'forgotPassword',
      child: ForgotPassword(),
    )
  ];
}

class DashboardLocation extends BeamLocation<BeamState> {
  DashboardLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    '/appointments',
    '/doctorList/:doctor',
    '/patientList/:patient',
    '/immunization/:trackImmunization',
    '/profile'
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

    if (state.pathPatternSegments.contains('appointments')){
      beamPages.add(
        const BeamPage(
          key: ValueKey('clinic-appointments'),
          title: 'Appointments',
          child: AppointmentPage(),
        )
      );
    }

    if (state.pathPatternSegments.contains('patientList')){
      beamPages.add(
        const BeamPage(
          key: ValueKey('clinic-patient'),
          title: 'Patient',
          child: PatientViewPage(),
        ),
      );
    }

    if (state.pathPatternSegments.contains('doctorList')){
      if(state.pathParameters.containsKey('doctor')){
        //Dont do anything
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

    if(state.pathParameters.containsKey('doctor')){
      final docName = state.pathParameters['doctor'];
      // Attempt to find the doctor in the list
      final doctorDetails = doctorsList.firstWhere(
        (doctor) => doctor['doctorName'] == docName,
        orElse: () => {'doctorName': 'Not Found'}, // Provide a default value (null in this case)
      );
      if (doctorDetails['doctorName'] != 'Not Found') {
        if(kIsWeb) {
          beamPages.add(
            BeamPage(
              key: const ValueKey('docProfile'),
              title: 'Doctor Profile',
              child: DetailsPage(docList: doctorDetails),
            ),
          );
        }
        else{
          WidgetsBinding.instance.addPostFrameCallback((_) => 
            Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsPage(docList: doctorDetails)))
          );
        }
      } else {
        //Error Page
      }
    }
      
    if (state.pathPatternSegments.contains('immunization')){
      beamPages.add(
        const BeamPage(
          key: ValueKey('user-immunization'),
          title: 'Immunization',
          child: UserImmunization(),
        ),
      );
    }
      
    if (state.pathPatternSegments.contains('profile')){
      beamPages.add(
        const BeamPage(
          key: ValueKey('profile'),
          title: 'Profile',
          child: UserProfile(),
        ),
      );
    }

    if(state.pathParameters.containsKey('patient')){
      final patientName = state.pathParameters['patient'];
      beamPages.add(
        BeamPage(
          key: const ValueKey('patientProfile'),
          title: 'Ptient Profile',
          child: PatientProfile(name : patientName),
        ),
      );
    }
      
    if(state.pathParameters.containsKey('trackImmunization')){
      beamPages.add(
        const BeamPage(
          key: ValueKey('trackImmunization'),
          title: 'Track Immunization',
          child: UserTrackImmunization(),
        ),
      );
    }
    return beamPages;
  }
}