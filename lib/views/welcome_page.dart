import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/models/welcome_page_model.dart';
import 'package:website/views/welcome_page_layout.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final WelcomePageLayout pageLayout = WelcomePageLayout(context);
    final WelcomePageModel pageModel =
        Provider.of<WelcomePageModel>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          children: [
            if (pageLayout.twoColumnMode)
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.shortestSide * 0.15,
                        backgroundColor: Colors.blue,
                      ),
                      Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
              ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: pageLayout.contentWidth),
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: ElevatedButton(
                    style: pageLayout.style,
                    onPressed: () => pageModel.go.call(),
                    child: const Text('Get Started'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
