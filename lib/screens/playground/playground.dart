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
  final String _selectedAssistant = 'Polity Expert';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 640;
    final double padding = isMobile ? 16.0 : 32.0;
    final double fontSizeTitle = isMobile ? 24.0 : 30.0;
    final double fontSizeSubtitle = isMobile ? 14.0 : 16.0;
    final double fontSizeFormLabel = isMobile ? 12.0 : 14.0;
    final double containerMaxWidth = isMobile ? double.infinity : 1152.0;

    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          constraints: BoxConstraints(maxWidth: containerMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: EdgeInsets.only(bottom: isMobile ? 16.0 : 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assistant Playground',
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: fontSizeTitle,
                        fontWeight: FontWeight.w700,
                        color: AspirantsAIPalette.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Create and interact with AI assistants tailored to your study needs.',
                      style: AspirantsAITextStyles.bodyMedium.copyWith(
                        color: AspirantsAIPalette.grey600,
                        fontSize: fontSizeSubtitle,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              // Content Layout
              Expanded(
                child:
                    isMobile
                        ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLeftColumn(isMobile, fontSizeFormLabel),
                              const SizedBox(height: 16),
                              _buildRightColumn(isMobile, fontSizeSubtitle),
                            ],
                          ),
                        )
                        : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: _buildLeftColumn(
                                isMobile,
                                fontSizeFormLabel,
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              flex: 2,
                              child: _buildRightColumn(
                                isMobile,
                                fontSizeSubtitle,
                              ),
                            ),
                          ],
                        ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          _isEditModalVisible
              ? GestureDetector(
                onTap: () => setState(() => _isEditModalVisible = false),
                child: Container(
                  color: AspirantsAIPalette.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      width: isMobile ? double.infinity : 448,
                      padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
                      margin: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16.0 : 0,
                      ),
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
                              Expanded(
                                child: Text(
                                  'Edit Assistant',
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    fontSize: isMobile ? 18.0 : 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: AspirantsAIPalette.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed:
                                    () => setState(
                                      () => _isEditModalVisible = false,
                                    ),
                                icon: const Icon(
                                  Icons.close,
                                  color: AspirantsAIPalette.grey600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildFormField(
                            label: 'Assistant Name',
                            child: TextField(
                              controller: TextEditingController(
                                text: 'Quiz Master Pro',
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: AspirantsAIPalette.grey300,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                              style: AspirantsAITextStyles.bodySmall.copyWith(
                                fontSize: isMobile ? 12.0 : 14.0,
                              ),
                            ),
                            fontSize: fontSizeFormLabel,
                          ),
                          const SizedBox(height: 16),
                          _buildFormField(
                            label: 'Role',
                            child: MinimalDropdown(
                              options: [
                                'Subject Expert',
                                'Quiz Master',
                                'Study Planner',
                                'Doubt Solver',
                              ],
                              initialValue: 'Quiz Master',
                            ),
                            fontSize: fontSizeFormLabel,
                          ),
                          const SizedBox(height: 16),
                          _buildFormField(
                            label: 'Dataset',
                            child: MinimalDropdown(
                              options: [
                                'All Uploaded Documents',
                                'Indian Constitution Basics',
                                'Modern History Notes',
                                'Economics MCQs',
                              ],
                              initialValue: 'All Uploaded Documents',
                            ),
                            fontSize: fontSizeFormLabel,
                          ),
                          const SizedBox(height: 16),
                          _buildFormField(
                            label: 'Tone',
                            child: MinimalDropdown(
                              options: [
                                'Professional',
                                'Friendly',
                                'Encouraging',
                                'Strict',
                              ],
                              initialValue: 'Encouraging',
                            ),
                            fontSize: fontSizeFormLabel,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed:
                                    () => setState(
                                      () => _isEditModalVisible = false,
                                    ),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                      color: AspirantsAIPalette.grey300,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: AspirantsAITextStyles.bodyMedium
                                      .copyWith(
                                        color: AspirantsAIPalette.grey600,
                                        fontSize: isMobile ? 12.0 : 14.0,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                onPressed:
                                    () => setState(
                                      () => _isEditModalVisible = false,
                                    ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AspirantsAIPalette.coffee,
                                  foregroundColor: AspirantsAIPalette.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Save Changes',
                                  style: AspirantsAITextStyles.bodyMedium
                                      .copyWith(
                                        color: AspirantsAIPalette.white,
                                        fontSize: isMobile ? 12.0 : 14.0,
                                      ),
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

  Widget _buildLeftColumn(bool isMobile, double fontSizeFormLabel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Assistant Creation Form
          Container(
            padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
            margin: EdgeInsets.only(bottom: isMobile ? 16.0 : 24.0),
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
                  'Create New Assistant',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: isMobile ? 16.0 : 18.0,
                    fontWeight: FontWeight.w800,
                    color: AspirantsAIPalette.darkGrey,
                    letterSpacing: 0.1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  label: 'Assistant Name',
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'e.g., History Tutor',
                      hintStyle: AspirantsAITextStyles.bodySmall.copyWith(
                        fontSize: isMobile ? 12.0 : 14.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AspirantsAIPalette.grey300,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    style: AspirantsAITextStyles.bodySmall.copyWith(
                      fontSize: isMobile ? 12.0 : 14.0,
                    ),
                  ),
                  fontSize: fontSizeFormLabel,
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  label: 'Role',
                  child: MinimalDropdown(
                    options: [
                      'Subject Expert',
                      'Quiz Master',
                      'Study Planner',
                      'Doubt Solver',
                    ],
                    initialValue: 'Subject Expert',
                  ),
                  fontSize: fontSizeFormLabel,
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  label: 'Dataset',
                  child: MinimalDropdown(
                    options: [
                      'All Uploaded Documents',
                      'Indian Constitution Basics',
                      'Modern History Notes',
                      'Economics MCQs',
                    ],
                    initialValue: 'All Uploaded Documents',
                  ),
                  fontSize: fontSizeFormLabel,
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  label: 'Tone',
                  child: MinimalDropdown(
                    options: [
                      'Professional',
                      'Friendly',
                      'Encouraging',
                      'Strict',
                    ],
                    initialValue: 'Professional',
                  ),
                  fontSize: fontSizeFormLabel,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AspirantsAIPalette.coffee,
                    foregroundColor: AspirantsAIPalette.white,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Create Assistant',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                      fontSize: isMobile ? 14.0 : 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Assistant List
          Container(
            padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Assistants',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: isMobile ? 16.0 : 18.0,
                      fontWeight: FontWeight.w600,
                      color: AspirantsAIPalette.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      Container(
                        width:
                            isMobile
                                ? double.infinity
                                : (MediaQuery.of(context).size.width - 80) / 2,
                        child: _buildAssistantItem(
                          name: 'Polity Expert',
                          role: 'Subject Expert',
                          tone: 'Professional tone',
                          status: 'Active',
                          statusColor: AspirantsAIPalette.grey100,
                          statusTextColor: AspirantsAIPalette.coffee,
                          dotColor: AspirantsAIPalette.green,
                          onEdit:
                              () => setState(() => _isEditModalVisible = true),
                          isMobile: isMobile,
                        ),
                      ),
                      Container(
                        width:
                            isMobile
                                ? double.infinity
                                : (MediaQuery.of(context).size.width - 80) / 2,
                        child: _buildAssistantItem(
                          name: 'History Tutor',
                          role: 'Subject Expert',
                          tone: 'Friendly tone',
                          status: 'Inactive',
                          statusColor: AspirantsAIPalette.grey100,
                          statusTextColor: AspirantsAIPalette.grey600,
                          dotColor: AspirantsAIPalette.grey,
                          onEdit:
                              () => setState(() => _isEditModalVisible = true),
                          isMobile: isMobile,
                        ),
                      ),
                      Container(
                        width:
                            isMobile
                                ? double.infinity
                                : (MediaQuery.of(context).size.width - 80) / 2,
                        child: _buildAssistantItem(
                          name: 'Quiz Master Pro',
                          role: 'Quiz Master',
                          tone: 'Encouraging tone',
                          status: 'Inactive',
                          statusColor: AspirantsAIPalette.grey100,
                          statusTextColor: AspirantsAIPalette.grey600,
                          dotColor: AspirantsAIPalette.grey,
                          onEdit:
                              () => setState(() => _isEditModalVisible = true),
                          isMobile: isMobile,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightColumn(bool isMobile, double fontSizeSubtitle) {
    return Container(
      height: isMobile ? 400.0 : 600.0,
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
            padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AspirantsAIPalette.grey300),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: isMobile ? 32.0 : 40.0,
                  height: isMobile ? 32.0 : 40.0,
                  decoration: BoxDecoration(
                    color: AspirantsAIPalette.coffee.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.smart_toy,
                    color: AspirantsAIPalette.coffee,
                    size: isMobile ? 20.0 : 24.0,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedAssistant,
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: isMobile ? 14.0 : 16.0,
                          fontWeight: FontWeight.w600,
                          color: AspirantsAIPalette.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Subject Expert • Online',
                        style: AspirantsAITextStyles.bodySmall.copyWith(
                          color: AspirantsAIPalette.grey600,
                          fontSize: isMobile ? 12.0 : 14.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Chat Messages
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
              child: Column(
                children: [
                  _buildChatMessage(
                    isUser: false,
                    message:
                        'Hello! I\'m your Polity Expert assistant. I can help you understand Indian Constitution, fundamental rights, governance structures, and more. What would you like to learn today?',
                    isMobile: isMobile,
                  ),
                  const SizedBox(height: 16),
                  _buildChatMessage(
                    isUser: true,
                    message:
                        'Can you explain the difference between fundamental rights and directive principles?',
                    isMobile: isMobile,
                  ),
                  const SizedBox(height: 16),
                  _buildChatMessage(
                    isUser: false,
                    message:
                        '''Great question! Here are the key differences:\n\n**Fundamental Rights:**\n- Legally enforceable\n- Justiciable (can approach courts)\n- Individual-focused\n- Found in Part III (Articles 12-35)\n\n**Directive Principles:**\n- Not legally enforceable\n- Non-justiciable\n- Society-focused\n- Found in Part IV (Articles 36-51)''',
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),
          ),
          // Chat Input
          Container(
            padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AspirantsAIPalette.grey300),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ask a question...',
                      hintStyle: AspirantsAITextStyles.bodySmall.copyWith(
                        fontSize: isMobile ? 12.0 : 14.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AspirantsAIPalette.grey300,
                          width: 0.75,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    style: AspirantsAITextStyles.bodySmall.copyWith(
                      fontSize: isMobile ? 12.0 : 14.0,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: isMobile ? 48.0 : 60.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AspirantsAIPalette.coffee,
                      foregroundColor: AspirantsAIPalette.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Transform.rotate(
                      angle: -45 * 3.1415927 / 180,
                      child: Icon(
                        Icons.send_rounded,
                        size: isMobile ? 14.0 : 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required Widget child,
    required double fontSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AspirantsAITextStyles.bodyMedium.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: AspirantsAIPalette.grey600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
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
    required bool isMobile,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
      decoration: BoxDecoration(
        color:
            status == 'Active'
                ? AspirantsAIPalette.grey100
                : AspirantsAIPalette.grey100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AspirantsAIPalette.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: isMobile ? 14.0 : 16.0,
                    fontWeight: FontWeight.w500,
                    color: AspirantsAIPalette.black,
                  ),
                  overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 8),
          Text(
            '$role • $tone',
            style: AspirantsAITextStyles.bodySmall.copyWith(
              color: AspirantsAIPalette.grey600,
              fontSize: isMobile ? 12.0 : 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: AspirantsAITextStyles.bodySmall.copyWith(
                    fontSize: isMobile ? 10.0 : 12.0,
                    color: statusTextColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: onEdit,
                child: Text(
                  'Edit',
                  style: AspirantsAITextStyles.bodySmall.copyWith(
                    fontSize: isMobile ? 10.0 : 12.0,
                    color: AspirantsAIPalette.grey600,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Delete',
                  style: AspirantsAITextStyles.bodySmall.copyWith(
                    fontSize: isMobile ? 10.0 : 12.0,
                    color: AspirantsAIPalette.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessage({
    required bool isUser,
    required String message,
    required bool isMobile,
  }) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUser)
          Container(
            width: isMobile ? 24.0 : 32.0,
            height: isMobile ? 24.0 : 32.0,
            decoration: BoxDecoration(
              color: AspirantsAIPalette.coffee.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.smart_toy,
              color: AspirantsAIPalette.coffee,
              size: isMobile ? 14.0 : 16.0,
            ),
          ),
        if (!isUser) const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
            decoration: BoxDecoration(
              color:
                  isUser
                      ? AspirantsAIPalette.coffee
                      : AspirantsAIPalette.grey100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: AspirantsAITextStyles.bodyMedium.copyWith(
                color:
                    isUser
                        ? AspirantsAIPalette.white
                        : AspirantsAIPalette.black,
                fontSize: isMobile ? 12.0 : 14.0,
              ),
              overflow: TextOverflow.clip,
              softWrap: true,
            ),
          ),
        ),
        if (isUser) const SizedBox(width: 12),
        if (isUser)
          Container(
            width: isMobile ? 24.0 : 32.0,
            height: isMobile ? 24.0 : 32.0,
            decoration: const BoxDecoration(
              color: AspirantsAIPalette.grey300,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                'AK',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: isMobile ? 12.0 : 14.0,
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

class MinimalDropdown extends StatefulWidget {
  final List<String> options;
  final String initialValue;

  const MinimalDropdown({
    super.key,
    required this.options,
    required this.initialValue,
  });

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
    final isMobile = MediaQuery.of(context).size.width < 640;
    return Container(
      height: isMobile ? 28.0 : 32.0,
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
        itemBuilder:
            (context) =>
                widget.options
                    .map(
                      (item) => PopupMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: AspirantsAITextStyles.bodySmall.copyWith(
                            fontSize: isMobile ? 10.0 : 12.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedValue,
                style: AspirantsAITextStyles.bodySmall.copyWith(
                  fontSize: isMobile ? 10.0 : 12.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              CupertinoIcons.chevron_down,
              size: isMobile ? 10.0 : 12.0,
              color: AspirantsAIPalette.grey600,
            ),
          ],
        ),
      ),
    );
  }
}
