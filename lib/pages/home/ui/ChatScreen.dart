
import 'package:book_tickets/models/chat_message_model.dart';
import 'package:book_tickets/pages/home/bloc/home_bloc.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final HomeBloc chatbloc = HomeBloc();
  TextEditingController textEditingController = TextEditingController();
   late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;
  

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            textEditingController.text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      } else {
        setState(() => _isListening = false);
        _speech.stop();
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
        backgroundColor: Styles.darkgreen,
        title: Text(" herit.AI.ge" , style: TextStyle( color: Styles.lighterGreen, fontSize: 30 , fontStyle: FontStyle.italic , fontWeight: FontWeight.bold),),centerTitle: true,),
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
                color: Styles.MorelighterGreen2,
                child: Column(
                  children: [
                   
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
                      margin: EdgeInsets.only(bottom: 80),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
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
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),  borderSide: BorderSide(
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
                            width: 10,
                          ),
                          InkWell(
                            onTap:_listen,
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Styles.darkgreen,
                              child: CircleAvatar(
                                radius: 30,
                               backgroundColor: Styles.darkgreen,
                                child: Center(
                                  child:  Icon(_isListening ? Icons.mic : Icons.mic_none , color: Colors.white,),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
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
                              backgroundColor: Styles.darkgreen,
                              child: CircleAvatar(
                                radius: 30,
                               backgroundColor: Styles.darkgreen,
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
