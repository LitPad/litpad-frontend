import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';
import 'package:litpad/ui/components/textfields/custom_textfield.dart';
import 'package:provider/provider.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({Key? key, this.isMobile = false})
      : super(key: key);

  final bool isMobile;

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileVM>(builder: (context, updateProfilevm, _) {
      return updateProfilevm.isBusy
          ? const SpinKitFadingCircle(
              color: Colors.deepPurple,
              size: 50.0,
            )
          : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Update your details",
                      style: AppTypography.text22.copyWith(
                        fontWeight: FontWeight.w500,
                      )),
                  YBox(widget.isMobile ? 20 : 50),
                  CustomTextField(
                    controller: updateProfilevm.usernameC,
                    labelText: 'Username',
                    showLabelHeader: true,
                    hintText: 'teeboy',
                    borderRadius: 50,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username must not be empty';
                      }
                      return null;
                    },
                  ),
                  // YBox(isMobile ? 20 : 50),
                  // const CustomTextField(
                  //   labelText: 'Email',
                  //   showLabelHeader: true,
                  //   hintText: 'topboy@gmail.com',
                  //   borderRadius: 50,
                  // ),
                  YBox(widget.isMobile ? 20 : 50),
                  CustomBtn.solid(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        updateProfilevm.updateProfile().then((value) {
                          if (value.success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                backgroundColor: AppColors.green,
                                content: Text(
                                  value.message ?? 'Profile update successful',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                backgroundColor: AppColors.red,
                                content: Text(
                                  value.message ?? 'Something went wrong',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        });
                      }
                    },
                    online: true,
                    text: 'Save changes',
                    width: 170,
                  )
                ],
              ),
            );
    });
  }
}
