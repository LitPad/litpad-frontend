import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';
import 'package:litpad/ui/components/textfields/custom_textfield.dart';
import 'package:provider/provider.dart';

class UpdatePasswordWidget extends StatefulWidget {
  const UpdatePasswordWidget({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  State<UpdatePasswordWidget> createState() => _UpdatePasswordWidgetState();
}

class _UpdatePasswordWidgetState extends State<UpdatePasswordWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdatePasswordVM>(builder: (context, updatePasswordVm, _) {
      return updatePasswordVm.isBusy
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
                  Text("Update your password",
                      style: AppTypography.text22.copyWith(
                        fontWeight: FontWeight.w500,
                      )),
                  YBox(widget.isMobile ? 20 : 50),
                  CustomTextField(
                    labelText: 'Old password',
                    showLabelHeader: true,
                    isPassword: true,
                    borderRadius: 50,
                    controller: updatePasswordVm.oldPasswordC,
                  ),
                  YBox(widget.isMobile ? 20 : 50),
                  CustomTextField(
                    labelText: 'New password',
                    showLabelHeader: true,
                    isPassword: true,
                    borderRadius: 50,
                    controller: updatePasswordVm.newPasswordC,
                  ),
                  YBox(widget.isMobile ? 20 : 50),
                  CustomBtn.solid(
                    onTap: update,
                    online: true,
                    text: 'Save changes',
                    width: 170,
                  )
                ],
              ),
            );
    });
  }

  update() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<UpdatePasswordVM>().updatePassword().then((value) {
        if (value.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: AppColors.green,
              content: Text(
                value.message ?? 'Password update successful',
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
  }
}
