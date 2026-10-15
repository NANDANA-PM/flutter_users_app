import 'package:flutter/material.dart';

import '../models/user.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 44,
              child: Text(
                user.name.isNotEmpty ? user.name[0] : '?',
                style: theme.textTheme.headlineLarge,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(child: Text(user.name, style: theme.textTheme.headlineSmall)),
          Center(child: Text('@${user.username}')),
          const SizedBox(height: 24),
          _InfoTile(icon: Icons.email_outlined, label: 'Email', value: user.email),
          _InfoTile(icon: Icons.phone_outlined, label: 'Phone', value: user.phone),
          _InfoTile(icon: Icons.language, label: 'Website', value: user.website),
          _InfoTile(
              icon: Icons.location_on_outlined,
              label: 'Address',
              value: user.fullAddress),
          _InfoTile(
              icon: Icons.business_outlined,
              label: 'Company',
              value: '${user.companyName}\n${user.companyCatchPhrase}'),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }
}
