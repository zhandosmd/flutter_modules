import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTabs {
  String imageURL;
  String title;
  bool? rightChevron;
  String? routeName;

  ProfileTabs({
    required this.imageURL,
    required this.title,
    this.rightChevron = false,
    this.routeName,
  });
}

class ProfileModule extends StatefulWidget {
  final bool? isIdentified;
  final String? fullname;
  final String? formattedPhone;
  final String? avatarUrl;
  final String? status;
  final int? isVerified;
  final int? newOrdersLength;
  final Color? mainColor;
  final List<ProfileTabs>? profileTabs;

  const ProfileModule({
    Key? key,
    this.isIdentified,
    this.fullname,
    this.formattedPhone,
    this.avatarUrl,
    this.status,
    this.isVerified,
    this.newOrdersLength,
    this.mainColor,
    this.profileTabs,
  }) : super(key: key);

  @override
  State<ProfileModule> createState() => _ProfileModuleState();
}

class _ProfileModuleState extends State<ProfileModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            // await context.read<ProfileModel>().getUserData();
          },
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          'assets/icons/ic_profile_settings.svg',
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        (widget.avatarUrl == null)
                            ? Image.asset(
                                'assets/images/im_profile_ava.png',
                                height: 100,
                                width: 100,
                              )
                            : CachedNetworkImage(
                                imageUrl: widget.avatarUrl ?? '',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                errorWidget: (_, a_, b_) => Image.asset(
                                  'assets/images/im_profile_ava.png',
                                  height: 100,
                                  width: 100,
                                ),
                                placeholder: (_, a_) => Image.asset(
                                  'assets/images/im_profile_ava.png',
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                        Positioned(
                          right: 0,
                          child: (widget.isIdentified == true)
                              ? Image.asset(
                                  'assets/icons/ic_profile_subscribed.png',
                                  height: 31,
                                  width: 31,
                                )
                              : const SizedBox(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        if (widget.fullname != null)
                          Text(
                            widget.fullname!,
                            style: const TextStyle(fontSize: 20),
                          ),
                        const SizedBox(
                          height: 2,
                        ),
                        if (widget.formattedPhone != null)
                          Text(
                            widget.formattedPhone!,
                            style: const TextStyle(
                                color: Color.fromRGBO(130, 130, 130, 1)),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    (widget.isVerified == 3)
                        ? Column(
                            children: [
                              if (widget.status != null)
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Статус: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  130, 130, 130, 1))),
                                      TextSpan(
                                        text: widget.status,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: widget.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 20),
                              Stack(
                                children: [
                                  Padding(
                                    padding: (widget.newOrdersLength != null &&
                                            widget.newOrdersLength! > 0)
                                        ? const EdgeInsets.only(top: 16)
                                        : EdgeInsets.zero,
                                    child: SizedBox(
                                      height: 70,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      86, 174, 255, 1),
                                                  Color.fromRGBO(
                                                      73, 161, 241, 1),
                                                ],
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Мой магазин'.toUpperCase(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(
                                              'assets/images/ic_my_shop.png',
                                              height: 70,
                                            ),
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              highlightColor:
                                                  Colors.white.withOpacity(0.3),
                                              splashColor:
                                                  Colors.white.withOpacity(0.4),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              onTap: () {
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    '/main_screen/splash');
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: (widget.newOrdersLength != null &&
                                            widget.newOrdersLength! > 0)
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.orange.shade600,
                                            ),
                                            child: Text(
                                              widget.newOrdersLength.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(height: 20),
                              Container(
                                height: 70,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: -8,
                                      bottom: 0,
                                      top: 0,
                                      child: Image.asset(
                                        'assets/images/ic_profile_premium.png',
                                        height: 91,
                                        width: 91,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Стать продавцом'.toUpperCase(),
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      81, 104, 139, 1),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (widget.isVerified == 1) {
                                                  // Navigator.of(context).pushNamed(
                                                  //   MainNavigationRouteNames
                                                  //       .verification,
                                                  // );
                                                } else {
                                                  // Navigator.of(context).push(
                                                  //   MaterialPageRoute(
                                                  //     builder: (_) =>
                                                  //         const SuccessfulVerificationWidget(),
                                                  //   ),
                                                  // );
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: widget.mainColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(7),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8,
                                                      horizontal: 20),
                                                  child: Text(
                                                    widget.isVerified == 1
                                                        ? 'Пройти модерацию'
                                                        : 'На рассмотрении',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final currentTab = widget.profileTabs![index];

                        return SizedBox(
                          height: 70,
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(18),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color.fromRGBO(248, 248, 248, 1)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(currentTab.imageURL),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                    Expanded(
                                        child: Text(
                                      currentTab.title,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color.fromRGBO(51, 51, 51, 1)),
                                    )),
                                    if (currentTab.rightChevron == true)
                                      Image.asset(
                                        'assets/icons/ic_chevron_left_black.png',
                                        height: 23,
                                        width: 23,
                                      )
                                  ],
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  highlightColor: Colors.white.withOpacity(0.3),
                                  splashColor: Colors.white.withOpacity(0.45),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  onTap: () {
                                    if (currentTab.routeName != null) {
                                      Navigator.of(context)
                                          .pushNamed(currentTab.routeName!);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: widget.profileTabs?.length ?? 0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: const Color.fromRGBO(248, 248, 248, 1),
                        child: InkWell(
                          highlightColor: Colors.white.withOpacity(0.3),
                          splashColor: Colors.white.withOpacity(0.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          onTap: () async {},
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ic_splash.svg',
                                    width: 35,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Гид Naprocat',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Расскажем все о наших сервисах',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
