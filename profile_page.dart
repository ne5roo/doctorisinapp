import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_page.dart'; // Import MainPage
import 'providers/profile_image_provider.dart'; // Import ProfileImageProvider

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'What would you like to be called?'; //bolded need to change this
  String bio = 'What do you want to share about yourself?';
  String status = 'How are you feeling today?';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    bioController.text = bio;
    statusController.text = status;
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveProfile() {
    setState(() {
      name = nameController.text;
      bio = bioController.text;
      status = statusController.text;
      isEditing = false;
      // The updated values will now be displayed directly on the page.
    });
  }

  // List of image assets for cartoon characters
  final List<String> characterImages = [
    'assets/Profile pics/Rabbit.jpeg',
    'assets/Profile pics/Dog.jpeg',
    'assets/Profile pics/Fox.jpeg',
    // Add more characters here
  ];

  void selectProfilePic(String imagePath) {
    Provider.of<ProfileImageProvider>(context, listen: false).setProfileImageUrl(imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        centerTitle: true, // Center the AppBar title
        backgroundColor: Color(0xFFD0F0C0), // Consistent AppBar color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            ); // Redirect to main page
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isEditing) {
                        _showCharacterSelectionDialog(context);
                      }
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        Provider.of<ProfileImageProvider>(context).profileImageUrl,
                      ), // Use the selected image from assets
                    ),
                  ),
                  if (isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.blueAccent),
                        onPressed: () {
                          _showCharacterSelectionDialog(context);
                        },
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),
              isEditing
                  ? TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Display Name'),
                      onTap: () {
                        if (nameController.text == 'What would you like to be called?') {
                          nameController.clear();
                        }
                      },
                    )
                  : Row(
                      children: [
                        Text(
                          "Name: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 8),
              isEditing
                  ? TextField(
                      controller: bioController,
                      decoration: InputDecoration(labelText: 'Bio'),
                      onTap: () {
                        if (bioController.text == 'What do you want to share about yourself?') {
                          bioController.clear();
                        }
                      },
                    )
                  : Row(
                      children: [
                        Text(
                          "Bio: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          bio,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 8),
              isEditing
                  ? TextField(
                      controller: statusController,
                      decoration: InputDecoration(labelText: 'Status'),
                      onTap: () {
                        if (statusController.text == 'How are you feeling today?') {
                          statusController.clear();
                        }
                      },
                    )
                  : Row(
                      children: [
                        Text(
                          "Status: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: toggleEditing,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Match button color
                  elevation: 4, // Add elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.black), // Add border
                  ),
                ),
                child: Text(
                  isEditing ? 'Cancel' : 'Edit Profile',
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
              if (isEditing)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Match button color
                      elevation: 4, // Add elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.black), // Add border
                      ),
                    ),
                    child: Text(
                      'Save Profile',
                      style: TextStyle(color: Colors.black), // Set text color to black
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  // Show dialog with options to select a cartoon character image
  void _showCharacterSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose a Character"),
          content: SizedBox(
            height: 200,
            width: double.maxFinite,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: characterImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    selectProfilePic(characterImages[index]);
                    Navigator.pop(context);  // Close the dialog after selection
                  },
                  child: Image.asset(characterImages[index]), // Display each character image
                );
              },
            ),
          ),
        );
      },
    );
  }
}
