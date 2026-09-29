import 'package:flutter/material.dart';

void main() {
  runApp(CollegeComplaintApp());
}

// ============================================================
// APP
// ============================================================

class CollegeComplaintApp extends StatelessWidget {
  const CollegeComplaintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Complaint Management System',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8F4),
      ),
      home: const LoginScreen(),
    );
  }
}

// ============================================================
// COMPLAINT MODEL
// ============================================================

class Complaint {
  String id;
  String subject;
  String category;
  String description;
  String location;
  String submittedBy;
  String userId;
  String status;

  String? assignedDepartment;
  String? assignedStaff;
  String? assignedStaffId;

  String? resolutionRemark;
  String? resolutionProof;
  String? adminRemark;

  Complaint({
    required this.id,
    required this.subject,
    required this.category,
    required this.description,
    required this.location,
    required this.submittedBy,
    required this.userId,
    required this.status,
    this.assignedDepartment,
    this.assignedStaff,
    this.assignedStaffId,
    this.resolutionRemark,
    this.resolutionProof,
    this.adminRemark,
  });
}

// ============================================================
// DEMO DATABASE
// ============================================================

final List<Complaint> complaints = [
  Complaint(
    id: 'CMP001',
    subject: 'Garbage not cleaned near Library',
    category: 'Cleanliness',
    description: 'Garbage has not been cleaned near the library.',
    location: 'Library',
    submittedBy: 'Student',
    userId: 'student1',
    status: 'Resolved',
    assignedDepartment: 'Housekeeping',
    assignedStaff: 'Ramesh',
    assignedStaffId: 'staff1',
    resolutionRemark: 'Area has been cleaned successfully.',
    resolutionProof: 'Cleaning completed',
  ),

  Complaint(
    id: 'CMP002',
    subject: 'Water leakage in classroom',
    category: 'Water & Sanitation',
    description: 'There is water leakage in the classroom.',
    location: 'Classroom 204',
    submittedBy: 'Student',
    userId: 'student1',
    status: 'In Progress',
    assignedDepartment: 'Maintenance',
    assignedStaff: 'Suresh',
    assignedStaffId: 'staff2',
  ),

  Complaint(
    id: 'CMP003',
    subject: 'Projector not working',
    category: 'Computer / IT',
    description: 'The classroom projector is not working.',
    location: 'Classroom 101',
    submittedBy: 'Student',
    userId: 'student1',
    status: 'Pending',
  ),

  Complaint(
    id: 'CMP004',
    subject: 'Canteen food quality',
    category: 'Canteen',
    description: 'There is a problem with the quality of food in the canteen.',
    location: 'Canteen',
    submittedBy: 'Student',
    userId: 'student1',
    status: 'Pending',
  ),

  Complaint(
    id: 'CMP005',
    subject: 'Broken classroom fan',
    category: 'Electrical',
    description: 'The classroom fan is not working.',
    location: 'Classroom 302',
    submittedBy: 'Teacher',
    userId: 'teacher1',
    status: 'Assigned',
    assignedDepartment: 'Electrical',
    assignedStaff: 'Ramesh',
    assignedStaffId: 'staff1',
  ),

  Complaint(
    id: 'CMP006',
    subject: 'Broken classroom desk',
    category: 'Furniture',
    description: 'Several desks are damaged.',
    location: 'Classroom 205',
    submittedBy: 'Teacher',
    userId: 'teacher1',
    status: 'Resolved',
    assignedDepartment: 'Maintenance',
    assignedStaff: 'Suresh',
    assignedStaffId: 'staff2',
    resolutionRemark: 'Damaged desks have been repaired.',
    resolutionProof: 'Repair completed',
  ),
];

// ============================================================
// LOGIN
// ============================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'Student';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (selectedRole == 'Student') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const UserDashboard(
            role: 'Student',
            userId: 'student1',
            userName: 'Student',
          ),
        ),
      );
    }

    if (selectedRole == 'Teacher') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const UserDashboard(
            role: 'Teacher',
            userId: 'teacher1',
            userName: 'Teacher',
          ),
        ),
      );
    }

    if (selectedRole == 'Staff') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const StaffDashboard(),
        ),
      );
    }

    if (selectedRole == 'Admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AdminDashboard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('College Complaint Management System'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Icon(
                    Icons.school,
                    size: 70,
                    color: Colors.green,
                  ),

                  SizedBox(height: 15),
                  Text('Login', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 25),

                  DropdownButtonFormField<String>(
                    initialValue: selectedRole,
                    decoration: const  InputDecoration(
                      labelText: 'Login As',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Student',
                        child: Text('Student'),
                      ),
                      DropdownMenuItem(
                        value: 'Teacher',
                        child: Text('Teacher'),
                      ),
                      DropdownMenuItem(
                        value: 'Staff',
                        child: Text('Staff'),
                      ),
                      DropdownMenuItem(
                        value: 'Admin',
                        child: Text('Admin'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedRole = value;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: login,
                      icon: const Icon(Icons.login),
                      label: const Text('LOGIN'),
                    ),
                  ),

                   SizedBox(height: 10),

                  /*Text('Demo: select a role and login.', style: TextStyle(color: Colors.grey,
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STUDENT + TEACHER DASHBOARD
// ============================================================

class UserDashboard extends StatefulWidget {
  final String role;
  final String userId;
  final String userName;

  const UserDashboard({
    super.key,
    required this.role,
    required this.userId,
    required this.userName,
  });

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  void logout() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(onPressed: () {Navigator.pop(dialogContext);},
              child: const Text('Cancel'),
            ),

            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                      (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final myComplaints = complaints
        .where((c) => c.userId == widget.userId)
        .toList();

    final total = myComplaints.length;

    final pending = myComplaints
        .where((c) => c.status == 'Pending')
        .length;

    final inProgress = myComplaints
        .where((c) => c.status == 'In Progress')
        .length;

    final resolved = myComplaints
        .where((c) => c.status == 'Resolved')
        .length;

    final Map<String, int> graphData = {};

    for (final complaint in myComplaints) {String key;
      if (widget.role == 'Student') {
        // Student graph = Category
        key = complaint.category;
      } else {
        // Teacher graph = Status
        key = complaint.status;
      }

      graphData[key] =
          (graphData[key] ?? 0) + 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.role} Dashboard',
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Text(
            'Welcome, ${widget.userName}',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'Total',
                  value: total,
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'Pending',
                  value: pending,
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'In Progress',
                  value: inProgress,
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'Resolved',
                  value: resolved,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SimpleBarChart(
            title: widget.role == 'Student'
                ? 'My Complaints by Category'
                : 'My Complaints by Status',
            data: graphData,
          ),

          const SizedBox(height: 20),

          Row(
            children: [

              Expanded(
                child: FilledButton.icon(
                  onPressed: () async {

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            SubmitComplaintScreen(
                              role: widget.role,
                              userId: widget.userId,
                            ),
                      ),
                    );

                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Submit Complaint'),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ComplaintListScreen(
                              title: 'My Complaints',
                              userId: widget.userId,
                            ),
                      ),
                    );

                    setState(() {});
                  },
                  icon: const Icon(Icons.list),
                  label: const Text(
                    'My Complaints',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// STAT CARD
// ============================================================

class StatCard extends StatelessWidget {
  final String title;
  final int value;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 5,
        ),
        child: Column(
          children: [

            Text('$value', style: const TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 5),

            Text(title,
              textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// BAR GRAPH
// ============================================================

class SimpleBarChart extends StatelessWidget {
  final String title;
  final Map<String, int> data;

  const SimpleBarChart({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    if (data.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text('No complaint data available.'),
            ],
          ),
        ),
      );
    }

    int maxValue = 1;

    for (final value in data.values) {
      if (value > maxValue) {
        maxValue = value;
      }
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              height: 250,
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.end,
                children: data.entries.map((entry) {

                  final double barHeight =
                      35 +
                          (entry.value / maxValue) * 150;

                  return Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [

                          Text(
                            '${entry.value}',
                            style: const TextStyle(
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Container(
                            height: barHeight,
                            decoration:
                            BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                              BorderRadius.circular(
                                6,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            entry.key,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                'X-axis = Category / Status     Y-axis = Number of Complaints',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SUBMIT COMPLAINT
// ============================================================

class SubmitComplaintScreen extends StatefulWidget {
  final String role;
  final String userId;

  const SubmitComplaintScreen({
    super.key,
    required this.role,
    required this.userId,
  });

  @override
  State<SubmitComplaintScreen> createState() =>
      _SubmitComplaintScreenState();
}

class _SubmitComplaintScreenState
    extends State<SubmitComplaintScreen> {

  final subjectController =
  TextEditingController();

  final descriptionController =
  TextEditingController();

  final locationController =
  TextEditingController();

  String category = 'Cleanliness';

  final categories = const [
    'Cleanliness',
    'Water & Sanitation',
    'Infrastructure',
    'Computer / IT',
    'Electrical',
    'Canteen',
    'Furniture',
    'Library',
    'Security',
    'Transport',
    'Academic',
    'Other',
  ];

  void submitComplaint() {

    if (subjectController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill all fields.',
          ),
        ),
      );

      return;
    }

    final nextNumber =
        complaints.length + 1;

    final newComplaint = Complaint(
      id: 'CMP${nextNumber.toString().padLeft(3, '0')}',
      subject: subjectController.text.trim(),
      category: category,
      description:
      descriptionController.text.trim(),
      location:
      locationController.text.trim(),
      submittedBy: widget.role,
      userId: widget.userId,
      status: 'Pending',
    );

    complaints.add(newComplaint);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Complaint submitted successfully!',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Complaint'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [

          TextField(
            controller: subjectController,
            decoration: const InputDecoration(
              labelText: 'Complaint Subject',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          DropdownButtonFormField<String>(
            initialValue: category,
            decoration: const InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(),
            ),
            items: categories
                .map(
                  (item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  category = value;
                });
              }
            },
          ),

          const SizedBox(height: 15),

          TextField(
            controller: descriptionController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: locationController,
            decoration: const InputDecoration(
              labelText: 'Location',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: submitComplaint,
            icon: const Icon(Icons.send),
            label: const Text(
              'SUBMIT COMPLAINT',
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// COMPLAINT LIST
// ============================================================

class ComplaintListScreen extends StatelessWidget {
  final String title;
  final String? userId;
  final String? staffId;

  const ComplaintListScreen({
    super.key,
    required this.title,
    this.userId,
    this.staffId,
  });

  @override
  Widget build(BuildContext context) {

    List<Complaint> list;

    if (userId != null) {

      list = complaints
          .where(
            (c) => c.userId == userId,
      )
          .toList();

    } else if (staffId != null) {

      list = complaints
          .where(
            (c) => c.assignedStaffId == staffId,
      )
          .toList();

    } else {

      list = complaints;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: list.isEmpty
          ? const Center(
        child: Text('No complaints found.'),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: list.length,
        itemBuilder: (context, index) {

          final complaint = list[index];

          return Card(
            child: ListTile(

              leading: CircleAvatar(
                child: Text(
                  complaint.id.substring(3),
                ),
              ),

              title: Text(
                complaint.subject,
                style: const TextStyle(
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              subtitle: Text(
                '${complaint.id}\n'
                    '${complaint.category}\n'
                    '${complaint.location}',
              ),

              isThreeLine: true,

              trailing: Chip(
                label: Text(
                  complaint.status,
                ),
              ),

              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ComplaintDetailsScreen(
                          complaint: complaint,
                          staffMode:
                          staffId != null,
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// COMPLAINT DETAILS
// ============================================================

class ComplaintDetailsScreen
    extends StatefulWidget {

  final Complaint complaint;
  final bool staffMode;

  const ComplaintDetailsScreen({
    super.key,
    required this.complaint,
    this.staffMode = false,
  });

  @override
  State<ComplaintDetailsScreen> createState() =>
      _ComplaintDetailsScreenState();
}

class _ComplaintDetailsScreenState
    extends State<ComplaintDetailsScreen> {

  final resolutionController =
  TextEditingController();

  void startWork() {

    setState(() {
      widget.complaint.status =
      'In Progress';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Complaint status changed to In Progress.',
        ),
      ),
    );
  }

  void submitResolution() {

    if (resolutionController.text
        .trim()
        .isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter resolution remark.',
          ),
        ),
      );

      return;
    }

    setState(() {

      widget.complaint.status =
      'Resolution Submitted';

      widget.complaint.resolutionRemark =
          resolutionController.text.trim();

      widget.complaint.resolutionProof =
      'Resolution proof added';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Resolution submitted to Admin.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final c = widget.complaint;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complaint Details',
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [

          InfoRow(
            title: 'Complaint ID',
            value: c.id,
          ),

          InfoRow(
            title: 'Subject',
            value: c.subject,
          ),

          InfoRow(
            title: 'Category',
            value: c.category,
          ),

          InfoRow(
            title: 'Location',
            value: c.location,
          ),

          InfoRow(
            title: 'Submitted By',
            value: c.submittedBy,
          ),

          InfoRow(
            title: 'Status',
            value: c.status,
          ),

          InfoRow(
            title: 'Assigned Department',
            value:
            c.assignedDepartment ??
                'Not assigned',
          ),

          InfoRow(
            title: 'Assigned Staff',
            value:
            c.assignedStaff ??
                'Not assigned',
          ),

          const SizedBox(height: 10),

          const Text(
            'Description',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(c.description),

          const SizedBox(height: 20),

          const Text(
            'Complaint Timeline',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          TimelineItem(
            title: 'Complaint Submitted',
            completed: true,
          ),

          TimelineItem(
            title: 'Assigned',
            completed:
            c.assignedStaff != null,
          ),

          TimelineItem(
            title: 'In Progress',
            completed:
            c.status == 'In Progress' ||
                c.status ==
                    'Resolution Submitted' ||
                c.status == 'Resolved',
          ),

          TimelineItem(
            title: 'Resolution Submitted',
            completed:
            c.status ==
                'Resolution Submitted' ||
                c.status == 'Resolved',
          ),

          TimelineItem(
            title: 'Resolved',
            completed:
            c.status == 'Resolved',
          ),

          if (widget.staffMode) ...[

            const SizedBox(height: 20),

            if (c.status == 'Assigned' ||
                c.status == 'Pending')
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: startWork,
                  icon: const Icon(
                    Icons.play_arrow,
                  ),
                  label: const Text('START WORK'),
                ),
              ),

            if (c.status == 'In Progress') ...[

              const SizedBox(height: 15),

              TextField(
                controller:
                resolutionController,
                maxLines: 4,
                decoration:
                const InputDecoration(
                  labelText: 'Resolution Remark',
                  hintText: 'Explain how the complaint was solved.',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: () {

                  setState(() {
                    c.resolutionProof =
                    'Proof photo added';
                  });

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Demo: proof photo added.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('ADD PROOF PHOTO'),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed:
                  submitResolution,
                  icon: const Icon(Icons.check),
                  label: const Text('SUBMIT RESOLUTION'),
                ),
              ),
            ],
          ],

          if (c.resolutionRemark !=
              null) ...[

            const SizedBox(height: 20),

            const Text('Resolution', style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(c.resolutionRemark!),

            const SizedBox(height: 8),

            Text('Proof: ${c.resolutionProof ?? "Not added"}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ============================================================
// INFO ROW
// ============================================================

class InfoRow extends StatelessWidget {

  final String title;
  final String value;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
      const EdgeInsets.only(
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 4),

          Text(value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TIMELINE
// ============================================================

class TimelineItem extends StatelessWidget {

  final String title;
  final bool completed;

  const TimelineItem({
    super.key,
    required this.title,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Icon(
        completed
            ? Icons.check_circle
            : Icons.radio_button_unchecked,
        color:
        completed
            ? Colors.green
            : Colors.grey,
      ),
      title: Text(title),
    );
  }
}

// ============================================================
// STAFF DASHBOARD
// ============================================================

class StaffDashboard extends StatefulWidget {

  const StaffDashboard({
    super.key,
  });

  @override
  State<StaffDashboard> createState() =>
      _StaffDashboardState();
}

class _StaffDashboardState
    extends State<StaffDashboard> {

  final String staffId = 'staff1';

  void logout() {

    showDialog(
      context: context,
      builder: (dialogContext) {

        return AlertDialog(
          title: const Text('Logout'),

          content: const Text('Are you sure you want to logout?'),

          actions: [

            TextButton(
              onPressed: () =>
                  Navigator.pop(
                    dialogContext,
                  ),
              child: const Text('Cancel'),
            ),

            FilledButton(
              onPressed: () {

                Navigator.pop(dialogContext,);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const LoginScreen(),
                  ),
                      (route) => false,
                );
              },
              child: const Text('Logout',),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final assigned = complaints
        .where(
          (c) => c.assignedStaffId == staffId,
    )
        .toList();

    final assignedCount = assigned.length;

    final inProgress = assigned
        .where(
          (c) => c.status == 'In Progress',
    )
        .length;

    final submitted = assigned
        .where(
          (c) =>
      c.status ==
          'Resolution Submitted',
    )
        .length;

    final resolved = assigned
        .where(
          (c) => c.status == 'Resolved',
    )
        .length;

    final graphData = <String, int>{
      'Assigned': assigned
          .where(
            (c) => c.status == 'Assigned',
      )
          .length,

      'In Progress': inProgress,

      'Submitted': submitted,

      'Resolved': resolved,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Staff Dashboard',
        ),
        actions: [

          IconButton(
            onPressed: logout,
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            'Welcome, Staff',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [

              Expanded(
                child: StatCard(
                  title: 'Assigned',
                  value: assignedCount,
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'In Progress',
                  value: inProgress,
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'Submitted',
                  value: submitted,
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'Resolved',
                  value: resolved,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SimpleBarChart(
            title:
            'My Assigned Work by Status',
            data: graphData,
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () async {

                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ComplaintListScreen(
                          title:
                          'My Assigned Complaints',
                          staffId: staffId,
                        ),
                  ),
                );

                setState(() {});
              },
              icon: const Icon(
                Icons.assignment,
              ),
              label: const Text(
                'MY ASSIGNED COMPLAINTS',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ADMIN DASHBOARD
// ============================================================

class AdminDashboard extends StatefulWidget {

  const AdminDashboard({
    super.key,
  });

  @override
  State<AdminDashboard> createState() =>
      _AdminDashboardState();
}

class _AdminDashboardState
    extends State<AdminDashboard> {

  void logout() {

    showDialog(
      context: context,
      builder: (dialogContext) {

        return AlertDialog(
          title: const Text(
            'Logout',
          ),

          content: const Text(
            'Are you sure you want to logout?',
          ),

          actions: [

            TextButton(
              onPressed: () =>
                  Navigator.pop(
                    dialogContext,
                  ),
              child: const Text(
                'Cancel',
              ),
            ),

            FilledButton(
              onPressed: () {

                Navigator.pop(
                  dialogContext,
                );

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const LoginScreen(),
                  ),
                      (route) => false,
                );
              },
              child: const Text(
                'Logout',
              ),
            ),
          ],
        );
      },
    );
  }

  int statusCount(String status) {

    return complaints
        .where(
          (c) => c.status == status,
    )
        .length;
  }

  @override
  Widget build(BuildContext context) {

    final statusGraph = <String, int>{
      'Pending':
      statusCount('Pending'),

      'Assigned':
      statusCount('Assigned'),

      'In Progress':
      statusCount('In Progress'),

      'Submitted':
      statusCount(
        'Resolution Submitted',
      ),

      'Resolved':
      statusCount('Resolved'),
    };

    final categoryGraph =
    <String, int>{};

    final userGraph =
    <String, int>{};

    for (final complaint
    in complaints) {

      categoryGraph[
      complaint.category] =
          (categoryGraph[
          complaint.category] ?? 0) + 1;

      userGraph[
      complaint.submittedBy] =
          (userGraph[
          complaint.submittedBy] ??
              0) +
              1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard',),

        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text('Welcome, Admin', style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'Total',
                  value:
                  complaints.length,
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'Pending',
                  value:
                  statusCount(
                    'Pending',
                  ),
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'In Progress',
                  value:
                  statusCount(
                    'In Progress',
                  ),
                ),
              ),

              Expanded(
                child: StatCard(
                  title: 'Resolved',
                  value:
                  statusCount('Resolved',),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SimpleBarChart(
            title: 'All Complaints by Status',
            data: statusGraph,
          ),

          const SizedBox(height: 15),

          SimpleBarChart(
            title: 'All Complaints by Category',
            data: categoryGraph,
          ),

          const SizedBox(height: 15),

          SimpleBarChart(
            title: 'Complaints by User Type',
            data: userGraph,
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const AdminManageComplaintsScreen(),
                  ),
                );

                setState(() {});
              },
              icon: const Icon(Icons.manage_accounts,),
              label: const Text('MANAGE ALL COMPLAINTS',),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ADMIN MANAGE COMPLAINTS
// ============================================================

class AdminManageComplaintsScreen
    extends StatefulWidget {

  const AdminManageComplaintsScreen({
    super.key,
  });

  @override
  State<AdminManageComplaintsScreen>
  createState() =>
      _AdminManageComplaintsScreenState();
}

class _AdminManageComplaintsScreenState
    extends State<
        AdminManageComplaintsScreen> {

  void assignComplaint(
      Complaint complaint) {

    String department =
        complaint.assignedDepartment ??
            'Maintenance';

    String staff =
        complaint.assignedStaff ??
            'Ramesh';

    String staffId =
        complaint.assignedStaffId ??
            'staff1';

    showDialog(
      context: context,
      builder: (dialogContext) {

        return StatefulBuilder(
          builder:
              (context, setDialogState) {

            return AlertDialog(

              title: Text('Assign ${complaint.id}',),

              content: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<
                      String>(
                    initialValue:
                    department,

                    decoration:
                    const InputDecoration(
                      labelText: 'Department',
                    ),

                    items: const [
                      'Maintenance',
                      'Housekeeping',
                      'Electrical',
                      'IT Support',
                      'Canteen',
                      'Security',
                    ]
                        .map(
                          (item) =>
                          DropdownMenuItem(
                            value: item,
                            child:
                            Text(item),
                          ),
                    )
                        .toList(),

                    onChanged: (value) {

                      if (value != null) {

                        setDialogState(() {
                          department =
                              value;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 15,),

                  DropdownButtonFormField<
                      String>(
                    initialValue:
                    staff,

                    decoration:
                    const InputDecoration(
                      labelText: 'Assign Staff',
                    ),

                    items: const [
                      DropdownMenuItem(
                        value: 'Ramesh',
                        child: Text('Ramesh'),
                      ),
                      DropdownMenuItem(
                        value: 'Suresh',
                        child: Text('Suresh'),
                      ),
                    ],

                    onChanged: (value) {
                      if (value != null) {
                        setDialogState(() {
                          staff = value;
                          staffId =
                          value ==
                              'Ramesh'
                              ? 'staff1'
                              : 'staff2';
                        });
                      }
                    },
                  ),
                ],
              ),

              actions: [

                TextButton(
                  onPressed: () =>
                      Navigator.pop(
                        dialogContext,
                      ),
                  child:
                  const Text('Cancel'),
                ),

                FilledButton(
                  onPressed: () {

                    setState(() {

                      complaint
                          .assignedDepartment =
                          department;

                      complaint
                          .assignedStaff =
                          staff;

                      complaint
                          .assignedStaffId =
                          staffId;

                      complaint.status =
                      'Assigned';
                    });

                    Navigator.pop(dialogContext,);

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${complaint.id} assigned to $staff.',
                        ),
                      ),
                    );
                  },
                  child: const Text('Assign'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void verifyResolution(
      Complaint complaint) {

    showDialog(
      context: context,
      builder: (dialogContext) {

        return AlertDialog(

          title: Text('Verify ${complaint.id}',),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Staff: ${complaint.assignedStaff ?? "-"}',),

              const SizedBox(height: 8,),

              Text('Remark: ${complaint.resolutionRemark ?? "-"}',),

              const SizedBox(height: 8,),

              Text('Proof: ${complaint.resolutionProof ?? "-"}',),
            ],
          ),

          actions: [

            TextButton(
              onPressed: () {
                setState(() {
                  complaint.status = 'In Progress';

                  complaint.adminRemark =
                  'Resolution rejected. Staff must solve the complaint again.';
                });

                Navigator.pop(dialogContext,);
              },

              child: const Text('Reject'),
            ),

            FilledButton(
              onPressed: () {

                setState(() {

                  complaint.status =
                  'Resolved';

                  complaint.adminRemark =
                  'Resolution approved by Admin.';
                });

                Navigator.pop(dialogContext,);
              },

              child: const Text('Approve'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Complaints',),
      ),

      body: ListView.builder(
        padding:
        const EdgeInsets.all(10),

        itemCount:
        complaints.length,

        itemBuilder:
            (context, index) {

          final complaint =
          complaints[index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text('${complaint.id} - ${complaint.subject}',
                    style: const TextStyle(fontWeight:
                      FontWeight.bold, fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5,),

                  Text('${complaint.category} • ${complaint.submittedBy}',
                  ),

                  const SizedBox(height: 5,),

                  Text('Status: ${complaint.status}'),

                  if (complaint.assignedStaff != null)
                    Text('Assigned Staff: ${complaint.assignedStaff}'),

                  const SizedBox(height: 10,),

                  Wrap(
                    spacing: 8,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () =>
                            assignComplaint(complaint),
                        icon: const Icon(Icons.person_add),
                        label: const Text('Assign'),
                      ),

                      if (complaint.status == 'Resolution Submitted')
                        FilledButton.icon(
                          onPressed: () => verifyResolution(complaint),
                          icon:
                          const Icon(Icons.verified,),
                          label:
                          const Text('Verify',),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}