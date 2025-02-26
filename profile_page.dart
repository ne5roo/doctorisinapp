import 'package:flutter/material.dart';
import 'main_page.dart'; // Import MainPage

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'What would you like to be called?'; //bolded need to change this
  String bio = 'What do you want to share about yourself?';
  String status = 'How are you feeling today?';
  String profilePicUrl = 'assets/images/character1.png';  // Default profile picture can add pics to asset and create a route to display on page

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
    setState(() {
      profilePicUrl = imagePath; // Update the profile picture
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Color(0xFFFEE4B3), // Consistent AppBar color
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
                      backgroundImage: AssetImage(profilePicUrl), // Use the selected image from assets
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
                    )
                  : Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              SizedBox(height: 8),
              isEditing
                  ? TextField(
                      controller: bioController,
                      decoration: InputDecoration(labelText: 'Bio'),
                    )
                  : Text(
                      bio,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
              SizedBox(height: 8),
              isEditing
                  ? TextField(
                      controller: statusController,
                      decoration: InputDecoration(labelText: 'Status'),
                    )
                  : Text(
                      status,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: toggleEditing,
                child: Text(isEditing ? 'Cancel' : 'Edit Profile'),
              ),
              if (isEditing)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: saveProfile,
                    child: Text('Save Profile'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Show dialog with options to select a cartoon character image
  void _showCharacterSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose a Character"),
          content: Container(
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
