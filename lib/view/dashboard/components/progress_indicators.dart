import 'package:clinic/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

  //dashboard percent indicator view for tablet
  dashboardItemsTabletView() {
    return Column(
      children: [
        SizedBox(
          width: 280,
          child: Row(
            mainAxisAlignment : MainAxisAlignment.start,
            children: [
              CircularPercentIndicator(
                radius: 44.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 7.0,
                percent: 0.8,
                center: const Icon(Icons.person, size: 32,),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: lightGrey,
                progressColor: pink,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height:20),
                  Text("Total Patient", style: ralewayMedium(black.withOpacity(0.9), 16),),
                  Text("52", style: ralewayBold(black, 35),),
                  const SizedBox(height: 8,),
                  Text("Till Today", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),),                      const SizedBox(height:20),
                ],
              )
            ],
          ),
        ),
        Divider(
          endIndent: 0,
          indent: 0,
          color: black.withOpacity(0.3),
          thickness : 0.5
        ),
        SizedBox(
          width: 280,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircularPercentIndicator(
                radius: 44.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 7.0,
                percent: 0.6,
                center: const Icon(Icons.local_hospital, size: 32,),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: lightGrey,
                progressColor: green,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height:20),
                  Text("Total Doctors", style: ralewayMedium(black.withOpacity(0.9), 16),),
                  Text("14", style: ralewayBold(black, 35),),
                  const SizedBox(height: 8,),
                  Text("06 Apr 2023", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),),
                  const SizedBox(height:20),
                ],
              )
            ],
          ),
        ),
        Divider(
          endIndent: 0,
          indent: 0,
          color: black.withOpacity(0.3),
          thickness : 0.5
        ),
        SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircularPercentIndicator(
                radius: 44.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 7.0,
                percent: 0.4,
                center: const Icon(Icons.calendar_month, size: 32,),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: lightGrey,
                progressColor: blue,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height:20),
                  Text("Total Appointments", style: ralewayMedium(black.withOpacity(0.9), 16),),
                  Text("18", style: ralewayBold(black, 35),),
                  const SizedBox(height: 8,),
                  Text("05 Mar 2023", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),),
                  const SizedBox(height:20),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
  
  //dashboard percent indicator view for web
  dashboardItemsWebView() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 280,
            child: Row(
              mainAxisAlignment : MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 44.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 7.0,
                  percent: 0.8,
                  center: const Icon(Icons.person, size: 32,),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: lightGrey,
                  progressColor: pink,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height:20),
                    Text("Total Patient", style: ralewayMedium(black.withOpacity(0.9), 16),),
                    Text("52", style: ralewayBold(black, 35),),
                    const SizedBox(height: 8,),
                    Text("Till Today", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),),                      const SizedBox(height:20),
                  ],
                )
              ],
            ),
          ),
          VerticalDivider(
            endIndent: 0,
            indent: 0,
            color: black.withOpacity(0.3),
            thickness : 0.5
          ),
          SizedBox(
            width: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 44.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 7.0,
                  percent: 0.6,
                  center: const Icon(Icons.local_hospital, size: 32,),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: lightGrey,
                  progressColor: green,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height:20),
                    Text("Total Doctors", style: ralewayMedium(black.withOpacity(0.9), 16),),
                    Text("14", style: ralewayBold(black, 35),),
                    const SizedBox(height: 8,),
                    Text("06 Apr 2023", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),),
                    const SizedBox(height:20),
                  ],
                )
              ],
            ),
          ),
          VerticalDivider(
            endIndent: 0,
            indent: 0,
            color: black.withOpacity(0.3),
            thickness : 0.5
          ),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 44.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 7.0,
                  percent: 0.4,
                  center: const Icon(Icons.calendar_month, size: 32,),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: lightGrey,
                  progressColor: blue,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height:20),
                    Text("Total Appointments", style: ralewayMedium(black.withOpacity(0.9), 16),),
                    Text("18", style: ralewayBold(black, 35),),
                    const SizedBox(height: 8,),
                    Text("05 Mar 2023", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),),
                    const SizedBox(height:20),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //dashboard percent indicator view for mobile
  dashboardItemsMmobileView() {
    return Column(
      children: [
        SizedBox(
          width: 280,
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 44.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 7.0,
                percent: 0.8,
                center: const Icon(Icons.person, size: 32,),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: lightGrey,
                progressColor: pink,
              ),
              const SizedBox(
                width: 20,
              ),
              const SizedBox(height:20),
              Text("Total Patient", style: ralewayMedium(black.withOpacity(0.9), 16),),
              Text("52", style: ralewayBold(black, 35),),
              const SizedBox(height: 8,),
              Text("Till Today", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),), 
            ],
          ),
        ),
        Divider(
          endIndent: 0,
          indent: 0,
          color: black.withOpacity(0.3),
          thickness : 0.5
        ),
        SizedBox(
          width: 280,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              CircularPercentIndicator(
                radius: 44.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 7.0,
                percent: 0.6,
                center: const Icon(Icons.local_hospital, size: 32,),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: lightGrey,
                progressColor: green,
              ),
              const SizedBox(
                width: 20,
              ),
              const SizedBox(height:20),
              Text("Total Doctors", style: ralewayMedium(black.withOpacity(0.9), 16),),
              Text("14", style: ralewayBold(black, 35),),
              const SizedBox(height: 8,),
              Text("06 Apr 2023", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),),
              const SizedBox(height:20),
            ],
          ),
        ),
        Divider(
          endIndent: 0,
          indent: 0,
          color: black.withOpacity(0.3),
          thickness : 0.5
        ),
        SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              CircularPercentIndicator(
                radius: 44.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 7.0,
                percent: 0.4,
                center: const Icon(Icons.calendar_month, size: 32,),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: lightGrey,
                progressColor: blue,
              ),
              const SizedBox(
                width: 20,
              ),
              const SizedBox(height:20),
              Text("Total Appointments", style: ralewayMedium(black.withOpacity(0.9), 16),),
              Text("18", style: ralewayBold(black, 35),),
              const SizedBox(height: 8,),
              Text("05 Mar 2023", style: ralewayLight(black.withOpacity(0.9), 14, 0.5),),
              const SizedBox(height:20),
            ],
          )
        ),
      ],
    );
  }