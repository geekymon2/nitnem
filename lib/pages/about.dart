import 'package:flutter/material.dart';
import 'package:nitnem/constants/appconstants.dart';
import 'package:nitnem/navigation/appnavigator.dart';

class NitnemIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage('assets/images/khanda.png');
    var image = new Image(image: assetImage, width: 64.0, height: 64.0);
    return new Container(child: image);
  }
}

void aboutNitnem(BuildContext context) {
  final ThemeData themeData = Theme.of(context);
  final TextStyle? aboutTextStyle = themeData.textTheme.bodyLarge;

  showDialog(
    context: context,
    builder:
        (BuildContext context) => AlertDialog(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NitnemIcon(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('About Nitnem', textAlign: TextAlign.center),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: aboutTextStyle,
                    text:
                        'Waheguruji ka Khalsa, Waheguruji ki Fateh, Sangat Ji, For any mistakes please sent an email to ' +
                        AppConstants.CONTACT_EMAIL +
                        ' so that they can be corrected.\n',
                  ),
                  TextSpan(style: aboutTextStyle, text: '\n[CREDITS]\n'),
                  TextSpan(
                    style: aboutTextStyle,
                    text:
                        'Khanda Icon: www.flaticon.com\n' +
                        'Forest Background: by kotkoa - www.freepik.com\n' +
                        'Stars Background: by 0melapics - www.freepik.com\n' +
                        'Wood Background: by Olga_spb - www.freepik.com\n' +
                        'Floral Background: by visnezh - www.freepik.com\n' +
                        'Ethnic Background: by visnezh - www.freepik.com\n',
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () => AppNavigator.goBack(context),
            ),
          ],
        ),
  );
}
