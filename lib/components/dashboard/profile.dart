import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Flavor Bistro",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Admin",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...adminMenu.map(
                (el) => ListTile(
                  onTap: () => Navigator.of(context).pushNamed(el["link"]),
                  leading: el["icon"],
                  title: Text(el["label"]),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "General",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...generalMenu.map(
                (el) => ListTile(
                  onTap: () => Navigator.of(context).pushNamed(el["link"]),
                  leading: el["icon"],
                  title: Text(el["label"]),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pushNamed(
                  "/onboarding",
                ),
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text(
                  "Log Out",
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List adminMenu = [
  {
    "label": "Create New Product",
    "icon": const Icon(Icons.create_new_folder),
    "link": "/add_product"
  },
  {
    "label": "Modify Product",
    "icon": const Icon(Icons.edit),
    "link": "/edit_product"
  },
];

List generalMenu = [
  {
    "label": "About Us",
    "icon": const Icon(Icons.restaurant),
    "link": "/about_us"
  },
  {
    "label": "Contact Us",
    "icon": const Icon(Icons.call),
    "link": "/contact",
  },
];
