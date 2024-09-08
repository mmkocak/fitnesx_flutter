import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class PrivacyPolicyChackbox extends StatelessWidget {
  const PrivacyPolicyChackbox({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    bool isChecked = false;
    return BlocProvider(
      create: (context) => PrivacyPolicyCubit(),
      child: Padding (
          padding: EdgeInsets.all(screenWidth * 0.01),
        child: Row(
          children: [
            BlocBuilder<PrivacyPolicyCubit, bool>(
              builder: (context, state){
                return Checkbox(value: state, onChanged: (bool? value){
                  context.read<PrivacyPolicyCubit>().toggleCheckbox();
                },);
              },
            ),
          ],
        ),
      ),
    );
  }
}
