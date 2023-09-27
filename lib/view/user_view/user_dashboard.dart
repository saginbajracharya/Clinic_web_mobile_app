import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/widget/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final controller = PageController( keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //banner
            bannerImage(),
            const SizedBox(height: 10),
            //services
            services(),
            const SizedBox(height: 10),
            //doctors list
            doctors(),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
  
  //Banner
  bannerImage() {
    return DisplayNetworkImage(
      imageUrl:'https://images.pexels.com/photos/5726794/pexels-photo-5726794.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      height: MediaQuery.of(context).size.height/4,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
  
  //Services
  services() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('services'.tr, style: ralewayMedium(grey700, 18),),
          const SizedBox(height: 18,),
          StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            children: List.generate(serviceList.length, (index) {
              return InkWell(
                onTap: (){
                  context.beamToNamed('/immunization');
                },
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow:  [
                      BoxShadow(
                        color: grey200!, 
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(Icons.local_hotel_outlined,color: grey400, size: 32,)
                      ),
                      const SizedBox(height: 9,),
                      Flexible(child: Text(serviceList[index], style: ralewayMedium(grey500, 13),))
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
  
  //doctors List
  doctors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:14.0,top: 5),
          child: Text('ourDoctors'.tr, style: ralewayMedium(grey700, 18),),
        ),
        const SizedBox(height: 18,),
        SizedBox(
          height: 170,
          width: double.infinity,
          child: PageView.builder(
            controller: controller,
            itemCount: doctorsList.length,
            itemBuilder: (_, index) {
              return  Padding(
                padding: const EdgeInsets.only(left :14.0, bottom: 20),
                child: InkWell(
                  onTap: (){
                    context.beamToNamed('/doctorList/${doctorsList[index]['doctorName']}');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right:14 ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow:  [
                        BoxShadow(
                          color: grey300!, 
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(-5, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0), 
                              bottomLeft: Radius.circular(8.0), 
                            ),
                            child: DisplayNetworkImage(
                              imageUrl:'https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              height: 170,
                              width: 160,
                              fit: BoxFit.cover,
                            ),   
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top : 14, left: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(child: Text(doctorsList[index]['doctorName'].toString(), style: ralewayMedium(grey700, 16),)),
                                const SizedBox(height: 5,),
                                Flexible(child: Text('${doctorsList[index]['speciality'].toString()} - ${doctorsList[index]['education'].toString()}', style: ralewayMedium(grey500, 12),)),
                                const SizedBox(height: 5,),
                                // ratings
                                Flexible(
                                  child: SmoothStarRating(
                                    allowHalfRating: false,
                                    onRatingChanged: (v) {
                                      setState(() {
                                        doctorsList[index]['ratings'] = v;
                                      });
                                    },
                                    starCount: 5,
                                    rating: double.parse(doctorsList[index]['ratings'].toString()),
                                    size: 24.0,
                                    filledIconData: Icons.star,
                                    color: yellow,
                                    borderColor: yellow,
                                    spacing:0.0
                                  ),
                                ),
                                const Spacer(),
                                Flexible(
                                  child: SizedBox(
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: (){
                                                                  
                                      }, 
                                      child: Text('Book Appointment' ,style: ralewayMedium(white, 14),)
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 7,),
        //indicator
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: appointmentList.length,
            effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              type: WormType.thinUnderground,
            ),
          ),
        ),
      ],
    );
  }

}
