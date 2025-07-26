import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssistantPlayground extends StatefulWidget {
  const AssistantPlayground({super.key});

  @override
  State<AssistantPlayground> createState() => _AssistantPlaygroundState();
}

class _AssistantPlaygroundState extends State<AssistantPlayground> {
  bool _isEditModalVisible = false;
  String _selectedAssistant = 'Polity Expert';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Padding(
        padding: const EdgeInsets.all(32.0), // p-8 (8 * 4px = 32px)
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1152), // max-w-6xl (72rem = 1152px)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0), // mb-8
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assistant Playground',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AspirantsAIPalette.black,
                        ),
                      ),
                      const SizedBox(height: 8), // mb-2
                      Text(
                        'Create and interact with AI assistants tailored to your study needs.',
                        style: AspirantsAITextStyles.bodyMedium.copyWith(
                          color: AspirantsAIPalette.grey600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Grid Layout
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column: Assistant Creation Form and List
                      Expanded(
                        flex: 1, // lg:col-span-1 (1/3 of grid)
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Assistant Creation Form
                              Container(
                                padding: const EdgeInsets.all(24), // p-6
                                margin: const EdgeInsets.only(bottom: 24), // mb-6
                                decoration: BoxDecoration(
                                  color: AspirantsAIPalette.white,
                                  borderRadius: BorderRadius.circular(12), // rounded-xl
                                  border: Border.all(color: AspirantsAIPalette.grey300),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AspirantsAIPalette.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Create New Assistant',
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AspirantsAIPalette.black,
                                      ),
                                    ),
                                    const SizedBox(height: 16), // space-y-4
                                    _buildFormField(
                                      label: 'Assistant Name',
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'e.g., History Tutor',
                                          hintStyle: AspirantsAITextStyles.bodySmall,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(color: AspirantsAIPalette.grey300),
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        ),
                                        style: AspirantsAITextStyles.bodySmall,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    _buildFormField(
                                      label: 'Role',
                                      child: MinimalDropdown(
                                        options: ['Subject Expert', 'Quiz Master', 'Study Planner', 'Doubt Solver'],
                                        initialValue: 'Subject Expert',
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    _buildFormField(
                                      label: 'Dataset',
                                      child: MinimalDropdown(
                                        options: [
                                          'All Uploaded Documents',
                                          'Indian Constitution Basics',
                                          'Modern History Notes',
                                          'Economics MCQs'
                                        ],
                                        initialValue: 'All Uploaded Documents',
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    _buildFormField(
                                      label: 'Tone',
                                      child: MinimalDropdown(
                                        options: ['Professional', 'Friendly', 'Encouraging', 'Strict'],
                                        initialValue: 'Professional',
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AspirantsAIPalette.purple,
                                        foregroundColor: AspirantsAIPalette.white,
                                        minimumSize: const Size(double.infinity, 40),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      child: const Text(
                                        'Create Assistant',
                                        style: TextStyle(fontFamily: 'Satoshi', fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Assistant List
                              Container(
                                padding: const EdgeInsets.all(24), // p-6
                                decoration: BoxDecoration(
                                  color: AspirantsAIPalette.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AspirantsAIPalette.grey300),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AspirantsAIPalette.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your Assistants',
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AspirantsAIPalette.black,
                                      ),
                                    ),
                                    const SizedBox(height: 12), // space-y-3
                                    _buildAssistantItem(
                                      name: 'Polity Expert',
                                      role: 'Subject Expert',
                                      tone: 'Professional tone',
                                      status: 'Active',
                                      statusColor: AspirantsAIPalette.grey100,
                                      statusTextColor: AspirantsAIPalette.purple,
                                      dotColor: AspirantsAIPalette.green,
                                      onEdit: () => setState(() => _isEditModalVisible = true),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildAssistantItem(
                                      name: 'History Tutor',
                                      role: 'Subject Expert',
                                      tone: 'Friendly tone',
                                      status: 'Inactive',
                                      statusColor: AspirantsAIPalette.grey100,
                                      statusTextColor: AspirantsAIPalette.grey600,
                                      dotColor: AspirantsAIPalette.grey,
                                      onEdit: () => setState(() => _isEditModalVisible = true),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildAssistantItem(
                                      name: 'Quiz Master Pro',
                                      role: 'Quiz Master',
                                      tone: 'Encouraging tone',
                                      status: 'Inactive',
                                      statusColor: AspirantsAIPalette.grey100,
                                      statusTextColor: AspirantsAIPalette.grey600,
                                      dotColor: AspirantsAIPalette.grey,
                                      onEdit: () => setState(() => _isEditModalVisible = true),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 32), // gap-8
                      // Right Column: Chat Interface
                      Expanded(
                        flex: 2, // lg:col-span-2 (2/3 of grid)
                        child: Container(
                          height: 600,
                          decoration: BoxDecoration(
                            color: AspirantsAIPalette.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AspirantsAIPalette.grey300),
                            boxShadow: [
                              BoxShadow(
                                color: AspirantsAIPalette.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Chat Header
                              Container(
                                padding: const EdgeInsets.all(16), // p-4
                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: AspirantsAIPalette.grey300)),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AspirantsAIPalette.purple.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.smart_toy, color: AspirantsAIPalette.purple, size: 24),
                                    ),
                                    const SizedBox(width: 12), // space-x-3
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _selectedAssistant,
                                          style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AspirantsAIPalette.black,
                                          ),
                                        ),
                                        Text(
                                          'Subject Expert • Online',
                                          style: AspirantsAITextStyles.bodySmall.copyWith(color: AspirantsAIPalette.grey600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Chat Messages
                              Expanded(
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(16), // p-4
                                  child: Column(
                                    children: [
                                      _buildChatMessage(
                                        isUser: false,
                                        message: 'Hello! I\'m your Polity Expert assistant. I can help you understand Indian Constitution, fundamental rights, governance structures, and more. What would you like to learn today?',
                                      ),
                                      const SizedBox(height: 16), // space-y-4
                                      _buildChatMessage(
                                        isUser: true,
                                        message: 'Can you explain the difference between fundamental rights and directive principles?',
                                      ),
                                      const SizedBox(height: 16),
                                      _buildChatMessage(
                                        isUser: false,
                                        message: '''
Great question! Here are the key differences:

**Fundamental Rights:**
- Legally enforceable
- Justiciable (can approach courts)
- Individual-focused
- Found in Part III (Articles 12-35)

**Directive Principles:**
- Not legally enforceable
- Non-justiciable
- Society-focused
- Found in Part IV (Articles 36-51)
                                        ''',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Chat Input
                              Container(
                                padding: const EdgeInsets.all(16), // p-4
                                decoration: const BoxDecoration(
                                  border: Border(top: BorderSide(color: AspirantsAIPalette.grey300)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Ask a question...',
                                          hintStyle: AspirantsAITextStyles.bodySmall,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(color: AspirantsAIPalette.grey300),
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                        ),
                                        style: AspirantsAITextStyles.bodySmall,
                                      ),
                                    ),
                                    const SizedBox(width: 12), // space-x-3
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AspirantsAIPalette.purple,
                                        foregroundColor: AspirantsAIPalette.white,
                                        minimumSize: const Size(0, 40),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      child: const Icon(Icons.send, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Edit Assistant Modal
      floatingActionButton: _isEditModalVisible
          ? GestureDetector(
              onTap: () => setState(() => _isEditModalVisible = false),
              child: Container(
                color: AspirantsAIPalette.black.withOpacity(0.5),
                child: Center(
                  child: Container(
                    width: 448, // max-w-md (28rem = 448px)
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AspirantsAIPalette.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AspirantsAIPalette.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Edit Assistant',
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AspirantsAIPalette.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () => setState(() => _isEditModalVisible = false),
                              icon: const Icon(Icons.close, color: AspirantsAIPalette.grey600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24), // mb-6
                        _buildFormField(
                          label: 'Assistant Name',
                          child: TextField(
                            controller: TextEditingController(text: 'Quiz Master Pro'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: AspirantsAIPalette.grey300),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            style: AspirantsAITextStyles.bodySmall,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildFormField(
                          label: 'Role',
                          child: MinimalDropdown(
                            options: ['Subject Expert', 'Quiz Master', 'Study Planner', 'Doubt Solver'],
                            initialValue: 'Quiz Master',
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildFormField(
                          label: 'Dataset',
                          child: MinimalDropdown(
                            options: [
                              'All Uploaded Documents',
                              'Indian Constitution Basics',
                              'Modern History Notes',
                              'Economics MCQs'
                            ],
                            initialValue: 'All Uploaded Documents',
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildFormField(
                          label: 'Tone',
                          child: MinimalDropdown(
                            options: ['Professional', 'Friendly', 'Encouraging', 'Strict'],
                            initialValue: 'Encouraging',
                          ),
                        ),
                        const SizedBox(height: 24), // mt-6
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => setState(() => _isEditModalVisible = false),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(color: AspirantsAIPalette.grey300),
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: AspirantsAITextStyles.bodyMedium.copyWith(color: AspirantsAIPalette.grey600),
                              ),
                            ),
                            const SizedBox(width: 12), // space-x-3
                            ElevatedButton(
                              onPressed: () => setState(() => _isEditModalVisible = false),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AspirantsAIPalette.purple,
                                foregroundColor: AspirantsAIPalette.white,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text(
                                'Save Changes',
                                style: AspirantsAITextStyles.bodyMedium.copyWith(color: AspirantsAIPalette.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildFormField({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AspirantsAITextStyles.bodyMedium.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AspirantsAIPalette.grey600,
          ),
        ),
        const SizedBox(height: 8), // mb-2
        child,
      ],
    );
  }

  Widget _buildAssistantItem({
    required String name,
    required String role,
    required String tone,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required Color dotColor,
    required VoidCallback onEdit,
  }) {
    return Container(
      padding: const EdgeInsets.all(12), // p-3
      decoration: BoxDecoration(
        color: status == 'Active' ? AspirantsAIPalette.grey100 : AspirantsAIPalette.grey100,
        borderRadius: BorderRadius.circular(8), // rounded-lg
        border: Border.all(color: status == 'Active' ? AspirantsAIPalette.grey300 : AspirantsAIPalette.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AspirantsAIPalette.black,
                ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // mb-2
          Text(
            '$role • $tone',
            style: AspirantsAITextStyles.bodySmall.copyWith(color: AspirantsAIPalette.grey600),
          ),
          const SizedBox(height: 8), // mb-2
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // px-2 py-1
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: AspirantsAITextStyles.bodySmall.copyWith(
                    fontSize: 12,
                    color: statusTextColor,
                  ),
                ),
              ),
              const SizedBox(width: 8), // space-x-2
              TextButton(
                onPressed: onEdit,
                child: Text(
                  'Edit',
                  style: AspirantsAITextStyles.bodySmall.copyWith(
                    fontSize: 12,
                    color: AspirantsAIPalette.grey600,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Delete',
                  style: AspirantsAITextStyles.bodySmall.copyWith(
                    fontSize: 12,
                    color: AspirantsAIPalette.orange, // Using orange as closest to red600
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessage({required bool isUser, required String message}) {
    return Row(
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUser)
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AspirantsAIPalette.purple.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.smart_toy, color: AspirantsAIPalette.purple, size: 16),
          ),
        if (!isUser) const SizedBox(width: 12), // space-x-3
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 448), // max-w-md
            padding: const EdgeInsets.all(12), // p-3
            decoration: BoxDecoration(
              color: isUser ? AspirantsAIPalette.purple : AspirantsAIPalette.grey100,
              borderRadius: BorderRadius.circular(12), // rounded-xl
            ),
            child: Text(
              message,
              style: AspirantsAITextStyles.bodyMedium.copyWith(
                color: isUser ? AspirantsAIPalette.white : AspirantsAIPalette.black,
              ),
            ),
          ),
        ),
        if (isUser) const SizedBox(width: 12), // space-x-3
        if (isUser)
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AspirantsAIPalette.grey300,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'AK',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AspirantsAIPalette.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// Reusing MinimalDropdown from UploadedDocuments
class MinimalDropdown extends StatefulWidget {
  final List<String> options;
  final String initialValue;

  const MinimalDropdown({super.key, required this.options, required this.initialValue});

  @override
  _MinimalDropdownState createState() => _MinimalDropdownState();
}

class _MinimalDropdownState extends State<MinimalDropdown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AspirantsAIPalette.white,
        border: Border.all(color: AspirantsAIPalette.grey300, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: PopupMenuButton<String>(
        menuPadding: EdgeInsets.zero,
        onSelected: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        itemBuilder: (context) => widget.options
            .map((item) => PopupMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AspirantsAITextStyles.bodySmall.copyWith(fontSize: 12),
                  ),
                ))
            .toList(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue,
              style: AspirantsAITextStyles.bodySmall.copyWith(fontSize: 12),
            ),
            const Icon(
              CupertinoIcons.chevron_down,
              size: 12,
              color: AspirantsAIPalette.grey300,
            ),
          ],
        ),
      ),
    );
  }
}