import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/screens/customappbar.dart';
import 'package:login_register_app/screens/search.dart';
import 'package:login_register_app/utils/helpers/navigation_helper.dart';
import 'package:login_register_app/values/app_routes.dart';



class SubjectPage extends StatefulWidget
{
  const SubjectPage({super.key});

  @override
  State<StatefulWidget> createState() => SubjectPageState();

}

class SubjectPageState extends State<SubjectPage>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: '', type: 0),
      body:Center(
          child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
         child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImageButton('assets/images/calculator (1).png', 'Mathematics'),
            const SizedBox(height: 32),
            _buildImageButton('assets/images/essay.png', 'English Language'),
            const SizedBox(height: 32),
            _buildImageButton('assets/images/microscope.png', 'Biology'),
            const SizedBox(height: 32),
            _buildImageButton('assets/images/wave.png', 'Physics'),
            const SizedBox(height: 32),
            _buildImageButton('assets/images/chemistry.png', 'Chemistry'),
            const SizedBox(height: 32),
           // _buildImageButton('assets/image4.jpg', 'Button 4'),
          ],
        ),
      ),),),
      bottomNavigationBar: CustomAppBar(title: '', type: 2),
    );
  }
  Widget _buildImageButton(String imagePath, String buttonText) {
    return SizedBox(
      height: 200,
      width: 200,
      child:ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide( width: 0.5),
        ),
        elevation: 4,

      ),
      onPressed: () {
        // Add your button press logic here
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            buttonText,
            style: GoogleFonts.lato(
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),);
  }
}
