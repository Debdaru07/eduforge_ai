import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/app_providers/chat_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Consumer<ChatProvider>(
        builder:
            (_, provider, __) => SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        itemCount: provider.messages.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Center(
                                child: Text(
                                  "Welcome Debdaru! Are you ready to aspire towards your goals?",
                                  style: AspirantsAITextStyles.bodyLarge
                                      .copyWith(
                                        color:
                                            AspirantsAIPalette.darkBackground,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }

                          final message = provider.messages[index - 1];
                          final isUser = message.role == "user";

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Align(
                              alignment:
                                  isUser
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                              child:
                                  isUser
                                      ? Container(
                                        padding: const EdgeInsets.all(12),
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.7,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AspirantsAIPalette.coffee,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Text(
                                          message.text,
                                          style: AspirantsAITextStyles
                                              .bodyMedium
                                              .copyWith(
                                                color: AspirantsAIPalette.white,
                                              ),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                      : provider.isLoading &&
                                          index == provider.messages.length
                                      ? Text(
                                        "Analyzing...",
                                        style: AspirantsAITextStyles.bodyMedium
                                            .copyWith(
                                              color: AspirantsAIPalette.grey600,
                                            ),
                                      )
                                      : Text(
                                        message.text,
                                        style: AspirantsAITextStyles.bodyMedium
                                            .copyWith(
                                              color: AspirantsAIPalette.black,
                                            ),
                                        textAlign: TextAlign.left,
                                      ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      color: AspirantsAIPalette.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              style: AspirantsAITextStyles.bodyMedium,
                              decoration: InputDecoration(
                                hintText: "Type your message...",
                                hintStyle: AspirantsAITextStyles.hint,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: AspirantsAIPalette.grey300,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: AspirantsAIPalette.coffee,
                            ),
                            onPressed: () {
                              final text = controller.text.trim();
                              if (text.isNotEmpty && !provider.isLoading) {
                                provider.sendMessage(text);
                                controller.clear();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
