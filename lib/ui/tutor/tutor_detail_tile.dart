import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/widgets/my_rating_bar.dart';
import 'package:provider/src/provider.dart';

class TutorDetailTile extends StatefulWidget {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String country;
  final bool isFavorite;
  const TutorDetailTile({
    Key? key,
    required this.name,
    required this.rating,
    required this.country,
    required this.imageUrl,
    required this.isFavorite,
    required this.id,
  }) : super(key: key);

  @override
  State<TutorDetailTile> createState() => _TutorDetailTileState();
}

class _TutorDetailTileState extends State<TutorDetailTile> {
  late bool isFavorite;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void _showSnackBar(String text, Color color) {
    Get.snackbar(
      text,
      '',
      colorText: Colors.white,
      backgroundColor: color,
      duration: const Duration(seconds: 1),
      leftBarIndicatorColor: Colors.white,
      borderRadius: 10,
    );
  }

  void _onFavoriteHandler(String accessToken) async {
    var dio = DioClient.dio;
    final translator = AppLocalizations.of(context)!;
    try {
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var res = await dio
          .post('/user/manageFavoriteTutor', data: {"tutorId": widget.id});
      setState(() {
        isFavorite = !isFavorite;
      });
      if (isFavorite) {
        _showSnackBar(translator.favoriteTutor, Colors.green);
      } else {
        _showSnackBar(translator.unfavoriteTutor, Colors.green);
      }
    } catch (e) {
      _showSnackBar(translator.error, Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final accessToken =
        context.read<AuthProvider>().userToken.tokens!.access!.token!;
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: ResizeImage(
              NetworkImage(widget.imageUrl),
              height: 50,
              width: 50,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  MyRatingBar(
                    rating: widget.rating,
                    padding: 0,
                    ignoreGestures: true,
                    size: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Teacher',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  isFavorite
                      ? IconButton(
                          onPressed: () => _onFavoriteHandler(accessToken),
                          icon: Icon(
                            Icons.favorite,
                            color:
                                Theme.of(context).textTheme.headline2!.color!,
                            size: 30,
                          ))
                      : IconButton(
                          onPressed: () => _onFavoriteHandler(accessToken),
                          icon: Icon(
                            Icons.favorite_border,
                            color:
                                Theme.of(context).textTheme.headline2!.color!,
                            size: 30,
                          )),
                ],
              ),
              Text(widget.country),
            ],
          ),
        ),
      ],
    );
  }
}
