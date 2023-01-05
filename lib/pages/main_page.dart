import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portofolio_web/shared/data.dart';
import 'package:portofolio_web/shared/theme.dart';
import 'package:portofolio_web/widgets/navbar.dart';
import 'package:portofolio_web/widgets/service_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../bloc/project_bloc.dart';
import '../widgets/buttons.dart';
import '../widgets/project_item.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Widget profile() {
      return Container(
        margin: const EdgeInsets.only(top: 163, right: 104, left: 104),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, I am',
                    style: orangeTextStyleUbuntu.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Muhammad Azri\nFatihah Susanto',
                    style: purpleTextStyle.copyWith(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      height: 1.066,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: 44,
                    height: 10,
                    color: orangeColor,
                  ),
                  const SizedBox(height: 72),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          launchUrl(linkedin);
                        },
                        child: Image.asset(
                          'assets/icons/linkedin.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 24),
                      InkWell(
                        onTap: () {
                          launchUrl(github);
                        },
                        child: Image.asset(
                          'assets/icons/github.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter Developer based in Jakarta, Indonesia.',
                  maxLines: 2,
                  style: purpleTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  'I am a Flutter developer with 1 year of experience and\nproficiency in using the Bloc pattern for state\nmanagement. I am self-taught and able to deliver visually\nappealing, powerful applications for various industries.',
                  style: grayTextStyle,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    CustomButton(
                      title: 'Email me',
                      icon: 'assets/icons/email.png',
                      onTap: () {
                        launchUrl(
                            Uri.parse('mailto:muhammad.azri.f.s@gmail.com'));
                      },
                    ),
                    const SizedBox(width: 32),
                    InkWell(
                      onTap: () {
                        launchUrlString(
                          'https://drive.google.com/file/d/1aKkJ467umKOGhF3icYd1635B4oBK4YRS/view?usp=sharing',
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/download.png',
                            width: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Download CV',
                            style: grayTextStyleUbuntu.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget aboutMe() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 83, right: 104, left: 104),
        padding: const EdgeInsets.only(
          left: 60,
          top: 96,
          right: 60,
          bottom: 80,
        ),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/about_me.png',
              width: 499,
              height: 445,
            ),
            const SizedBox(width: 240),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: orangeTextStyleUbuntu.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Why hire me for your next project?',
                    style: whiteTextStyle.copyWith(
                        fontSize: 32, fontWeight: bold, height: 1.45),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'You should consider hiring me for your next project because I am a dedicated and disciplined Flutter developer with 1 year of experience creating visually appealing and powerful mobile applications using the Bloc pattern for state management. My portfolio, available on this website and on my GitHub profile, showcases my skills and capabilities as a developer. I am known for my strong work ethic and ability to meet deadlines, making me a reliable and efficient choice for your project. In addition to my technical skills, I am also a strong communicator and always make sure to keep my clients informed and up-to-date throughout the development process. I believe that clear communication is key to the success of any project, and I am always willing to go the extra mile to ensure that your project is a success.',
                    style: grayTextStyleUbuntu.copyWith(
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget projects() {
      final ScrollController projectScrollController = ScrollController();
      double scrollStartX = 0;
      double dragStartX = 0;

      return Container(
        height: 600,
        margin: const EdgeInsets.only(top: 100, left: 104),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projects',
              style: orangeTextStyleUbuntu.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Latest works.',
              style: purpleTextStyle.copyWith(
                fontSize: 32,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 48),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanDown: (details) {
                dragStartX = details.globalPosition.dx;
              },
              onPanUpdate: (details) {
                final currentX = details.globalPosition.dx;
                projectScrollController
                    .jumpTo(dragStartX - currentX + scrollStartX);
              },
              onPanEnd: (details) {
                scrollStartX = projectScrollController.offset;
              },
              child: SingleChildScrollView(
                controller: projectScrollController,
                scrollDirection: Axis.horizontal,
                child: BlocProvider(
                  create: (context) => ProjectBloc()..add(ProjectGet()),
                  child: BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) {
                      if (state is ProjectSuccess) {
                        return Row(
                          children: state.projects.map(
                            (project) {
                              return ProjectItem(projectModel: project);
                            },
                          ).toList(),
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget services() {
      return Container(
        margin: const EdgeInsets.only(
          top: 100,
          right: 10,
          left: 104,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Services',
                    style: orangeTextStyleUbuntu.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Best solutions to\nboost your creative project.',
                    style: purpleTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Are you in need of a modern and visually appealing mobile app for your business or\nservice? Is your current app outdated and not optimized for a variety of devices and\nbrowsers? Look no further! As a skilled Flutter developer, I can create a custom app from\na given design and am proficient in integrating API functionality. Trust me to\ndeliver an optimal user experience for your customers.',
                    style: grayTextStyleUbuntu.copyWith(
                      height: 1.8,
                    ),
                    maxLines: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 122),
            const ServiceItem(
              title: 'Flutter\nDeveloper',
              description:
                  'Good communication, details in the code and verbose documentation. I guaranteed free session until you can run my code on your system.',
            ),
            const ServiceItem(
              title: 'Backend\nDeveloper',
              description:
                  'I view backend development projects as opportunities to learn and grow. Currently learning Laravel and Django, working to improve my skills',
            ),
          ],
        ),
      );
    }

    Widget footer() {
      Widget credit() {
        return Container(
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Divider(
                thickness: 1,
                color: grayColor,
              ),
              const SizedBox(
                height: 82,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      launchUrl(linkedin);
                    },
                    child: Image.asset(
                      'assets/icons/linkedin.png',
                      width: 16,
                      height: 16,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(width: 32),
                  InkWell(
                    onTap: () {
                      launchUrl(github);
                    },
                    child: Image.asset(
                      'assets/icons/github.png',
                      width: 16,
                      height: 16,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'For business inquiry please send email to muhammad.azri.f.s@gmail.com\nThanks to hanihusam for the website design, all rights reserved.',
                style: grayTextStyleUbuntu,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 52,
              ),
            ],
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.only(
          left: 104,
          right: 104,
          top: 50,
        ),
        decoration: BoxDecoration(
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Interested working\nwith me?',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    launchUrl(github);
                  },
                  child: Container(
                    width: 154,
                    height: 65,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: orangeColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'See More Projects',
                        style: whiteTextStyleUbuntu,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                CustomButton(
                  title: 'Hire Me',
                  onTap: () {
                    launchUrlString('mailto:muhammad.azri.f.s@gmail.com');
                  },
                )
              ],
            ),
            credit()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        controller: _scrollController,
        primary: false,
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(
              top: 19,
              bottom: 19,
            ),
          ),
          SliverAppBar(
            pinned: true,
            backgroundColor: whiteColor,
            flexibleSpace: FlexibleSpaceBar(
              title: NavBar(
                scrollController: _scrollController,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                profile(),
                aboutMe(),
                projects(),
                services(),
                footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
