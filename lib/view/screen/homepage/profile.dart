import 'package:flutter/material.dart';
import 'package:foodninja/core/constant/imageasset.dart';
import 'package:foodninja/view/widget/iconsgradient.dart';
import 'package:get/get.dart';
import '../../../controller/home/profilecontroller.dart';
import '../../../core/constant/color.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Stack(
      children: [
        Positioned(
            child: Image.asset(
          ImageAsset.strawberry,
          height: Get.height / 2.4,
          fit: BoxFit.cover,
        )),
        ListView(
          children: [
            Container(
              height: Get.height / 3.3,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              // height: Get.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(42)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Anam Wusono',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(height: 0.4),
                          ),
                          Text('anamwp66@gmail.com',
                              style: Theme.of(context).textTheme.titleSmall)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Row(
                            children: [
                              Icon(Icons.settings),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Profile Settings'),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: GradientColor(
                              child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          children: [
                            Icon(Icons.language),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Language'),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          children: [
                            Icon(Icons.payments),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Payment Method'),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    height: 2,
                  ),
                  InkWell(
                    onTap: () {
                      controller.goto();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Location'),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          children: [
                            Icon(Icons.notifications),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Notification'),
                          ],
                        ),
                      ),
                      Switch(
                        value: true,
                        activeColor: AppColor.green1,
                        onChanged: (bool value) {},
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: InkWell(
                onTap: () {
                  controller.logOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: const Row(
                        children: [
                          // Icon(Icons.outbox),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Log Out'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: GradientColor(
                          child: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
