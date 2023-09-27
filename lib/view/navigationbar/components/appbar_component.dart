import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/controller/app_user_controller.dart';
import 'package:clinic/controller/navigation_bar_controller.dart';
import 'package:clinic/helpers/local_storage_service.dart';
import 'package:clinic/widget/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final appUserCon = Get.put(AppUserController());

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget{
  const AppBarComponent({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //TITLE
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left : 20.0),
                  child: InkWell(
                    onTap: (){
                      final NavigationBarController navBarCon = Get.find();
                      if(navBarCon.selectedIndex!=0){
                        navBarCon.titleClickNavigation();
                        context.beamToReplacementNamed('/dashboard');
                      }
                    },
                    child: Text(
                      'app_name'.tr, 
                      style: ralewayBold(blue, 28),
                      maxLines: 1, 
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center
                    )
                  ),
                ),
              ),
              // If Username is not saved to local Storage then show Login
              // Else Show Profile And LogOut button
              Obx((){
                return appUserCon.currentUser.value == ''
                ? Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: (){
                        appUserCon.currentUser.value='';
                        context.beamToReplacementNamed('/login');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
                        child: Text("login".tr, style: ralewayMedium(black, 15),maxLines: 1, overflow: TextOverflow.fade,textAlign: TextAlign.center),
                      )
                    ),
                  ),
                )
                : Flexible(
                  child: Row ( 
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children :[  
                      Flexible(
                        child: InkWell(
                          onTap: (){
                            context.beamToNamed('/profile');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical :10.0,horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const DisplayNetworkImage(
                                imageUrl:'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
                                height: 35,
                                width: 35,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: ()async{
                            remove('name');
                            context.beamToReplacementNamed('/login');
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.logout, size: 28, color: black),
                          )
                        ),
                      ),
                      const SizedBox(width: 10)
                    ]
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}