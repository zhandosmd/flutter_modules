import 'package:flutter/material.dart';
import 'package:module/profile_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileModule(
        fullname: 'Zhandos Medetov',
        avatarUrl:
            'https://minio.naprocat.kz/naprocat-dev/avatar/13/a3cc324f15f75aa99e255270775b8ed8.jpg',
        formattedPhone: '+7 778 930 3841',
        status: 'Продавец',
        isIdentified: true,
        isVerified: 3,
        mainColor: Colors.blueAccent,
        newOrdersLength: 23,
        profileTabs: [
          ProfileTabs(
            imageURL: 'assets/icons/ic_profile_orders.svg',
            title: 'Мои заказы',
            rightChevron: true,
          ),
          ProfileTabs(
            imageURL: 'assets/icons/ic_profile_address.svg',
            title: 'Мои адреса',
            rightChevron: true,
          ),
          ProfileTabs(
            imageURL: 'assets/icons/ic_profile_about.svg',
            title: 'О приложении',
          ),
        ],
      ),
    );
  }
}
