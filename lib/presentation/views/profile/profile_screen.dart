import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: controller.editProfile,
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile header
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Name
                      Text(
                        controller.userName.value,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Email
                      Text(
                        controller.userEmail.value,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Profile info
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Nom complet'),
                      subtitle: Text(controller.userName.value),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: controller.editName,
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email'),
                      subtitle: Text(controller.userEmail.value),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: controller.editEmail,
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Téléphone'),
                      subtitle: Text(controller.userPhone.value),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: controller.editPhone,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
