import 'package:dashbord/controllers/api_controller.dart';
import 'package:dashbord/screens/components/info_card.dart';
import 'package:dashbord/screens/components/top_referals.dart';
import 'package:dashbord/screens/components/users_by_device.dart';
import 'package:dashbord/screens/components/viewers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import 'analytic_cards.dart';
import 'custom_appbar.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(builder: (ctrl) {
      return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            children: [
              const CustomAppbar(),
              const SizedBox(
                height: appPadding,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: const [
                            AnalyticCards(),
                            SizedBox(
                              height: appPadding,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Flexible(
                        child: InfoCard(
                          temp: ctrl.lastTemp,
                          title: 'Live temp °C',
                          svg: 'assets/icons/temp2.svg',
                          svgColor: ctrl.lastTemp < 30 ? Colors.blue : Colors.red,
                          subTitle: "time : ${
                              ctrl.formattedDate}",
                        ),
                      ),
                      4.horizontalSpace,
                       Flexible(
                        child: InfoCard(
                          temp:  ctrl.powr.toDouble(),
                          title: 'Main power',
                          svg: 'assets/icons/onoff.svg',
                          svgColor: ctrl.powr ==1 ?  Colors.green : Colors.red,
                          subTitle: 'in last 60 min',
                        ),
                      ),
                      4.horizontalSpace,
                       Flexible(
                        child: InfoCard(
                          temp: ctrl.ups.toDouble(),
                          title: 'Ups power',
                          svg: 'assets/icons/onoff.svg',
                          svgColor: ctrl.ups == 1 ?  Colors.green : Colors.red,
                          subTitle: 'in last 60 min',
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: appPadding,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!Responsive.isMobile(context))
                                  const Expanded(
                                    flex: 2,
                                    child: TopReferals(),
                                  ),
                                if (!Responsive.isMobile(context))
                                  const SizedBox(
                                    width: appPadding,
                                  ),
                                const Expanded(
                                  flex: 3,
                                  child: Viewers(),
                                ),
                              ],
                            ),
                            if (Responsive.isMobile(context))
                              const SizedBox(
                                height: appPadding,
                              ),
                            if (Responsive.isMobile(context))
                              const UsersByDevice(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        const SizedBox(
                          width: appPadding,
                        ),
                      if (!Responsive.isMobile(context))
                        const Expanded(
                          flex: 2,
                          child: UsersByDevice(),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
