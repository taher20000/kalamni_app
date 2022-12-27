import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:kalamni_app/shared/styles/icon_broken.dart';

import '../../shared/components/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Kalamni',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                actions:  [
                 IconButton(onPressed: (){print('Notification work');}, icon:  const Icon(IconBroken.Notification),),
                  IconButton(onPressed: (){print('Search work');}, icon:     const Icon(IconBroken.Search),)

                ],
              ),
              bottomNavigationBar: ConvexAppBar(
                items: const [
                  TabItem(icon: Icon(IconBroken.Home), title: 'Home'),
                  TabItem(icon: Icon(IconBroken.Chat), title: 'Chats'),
                  TabItem(icon: Icon(IconBroken.Plus), title: 'Add Post'),
                  TabItem(icon: Icon(IconBroken.User), title: 'Users'),
                  TabItem(icon: Icon(IconBroken.Setting), title: 'Settings'),
                ],
                // ignore: avoid_print
                onTap: (int index) => print('click index=$index'),
              ));
        });
  }
}
