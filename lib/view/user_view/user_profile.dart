import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/local_storage_service.dart';
import 'package:clinic/widget/custom_appbar.dart';
import 'package:clinic/widget/custom_cached_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key,});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? name;

  getUserName()async{
    name = await get('name');
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb ? null : appbar(context,(){context.beamToNamed('/dashboard');},bgColor,0.0),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25.0), 
                      bottomLeft: Radius.circular(25.0), 
                    ),
                    child: DisplayNetworkImage(
                      imageUrl: 'https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      height: MediaQuery.of(context).size.height/1.5,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            docDetails(),
          ],
        ),
      ),
    );
  }
  
  docDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Dr. '.capitalize!,style: ralewayBold(grey800, 20),),
              FutureBuilder(
                future: getUserName(),
                builder: (context,snapshot) {
                  if (snapshot.hasData)
                  {
                    final data = snapshot.data;
                    return Text( data.toString(),style: ralewayBold(grey800, 20),);
                  }
                  else{
                    return const SizedBox();
                  }
                }
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Text( 'DDE',style: ralewayMedium(grey500, 14),),
          const SizedBox(height: 30,),
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',style: ralewayBold(grey500, 16), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}