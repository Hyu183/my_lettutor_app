import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String userAvatarUrl;
  const ProfileAvatar({Key? key, required this.userAvatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: userAvatarUrl !=
                    "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png"
                ? ResizeImage(
                    NetworkImage(userAvatarUrl),
                    height: 60,
                    width: 60,
                  )
                : const ResizeImage(
                    AssetImage(
                      'assets/images/user.png',
                    ),
                    height: 60,
                    width: 60,
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
