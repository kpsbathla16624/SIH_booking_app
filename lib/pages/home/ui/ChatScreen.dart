
import 'package:book_tickets/models/chat_message_model.dart';
import 'package:book_tickets/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final HomeBloc chatbloc = HomeBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBody: true,
     extendBodyBehindAppBar: true,
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: chatbloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSucessState:
              List<chatMessageModel> messages = (state as ChatSucessState).messages;
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Chat With AI ',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return SizedBox.shrink();
                          }

                          // Calculate text width
                          TextPainter textPainter = TextPainter(
                            text: TextSpan(
                              text: messages[index].parts.first.text,
                              style: TextStyle(fontSize: 19),
                            ),
                            maxLines: 1,
                            textDirection: TextDirection.ltr,
                          )..layout(maxWidth: MediaQuery.of(context).size.width * 0.7); // Set max width as 70% of screen width

                          double textWidth = textPainter.size.width + 20; // Add some padding to width

                          return Container(
                            alignment: messages[index].role == 'user' ? Alignment.centerLeft : Alignment.centerRight,
                            margin: EdgeInsets.only(
                              bottom: 12,
                              left: messages[index].role == 'user' ? 100 : 0,
                              right: messages[index].role == 'user' ? 0 : 50,
                            ),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black.withOpacity(0.7),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: textWidth, // Set max width according to text width
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  messages[index].role != 'user' ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                              children: [
                                if (messages[index].role != 'user')
                                  Text(
                                    messages[index].role == 'user' ? " " : " GalleryGuide : ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: messages[index].role == 'user' ? Colors.yellow : Colors.teal.shade300,
                                    ),
                                  ),
                                if (messages[index].role != 'user')
                                  const SizedBox(
                                    height: 12,
                                  ),
                                Text(
                                  messages[index].parts.first.text,
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (chatbloc.generating)
                      Container(
                        height: 100,
                        width: 100,
                        child: Lottie.asset('assets/loader3.json'),
                      ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                
                                hintText: "Ask something from AI ",
                                hintStyle: TextStyle(color: Colors.grey.shade500),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2
                                  ), ),
                                focusedBorder: OutlineInputBorder(
                                  
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                chatbloc.add(
                                  ChatGenerateNewTextMessageEvent(inputMessage: text),
                                );
                              }
                            },
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Center(
                                  child: Icon(
                                    Icons.send,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
              return Center(
                child: Text(
                  "Retry",
                  style: TextStyle(fontSize: 50),
                ),
              );
          }
        },
      ),
    );
  }
}
