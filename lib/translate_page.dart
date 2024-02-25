import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  bool _isSwapped = false;
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  int _wordCount1 = 0;
  int _wordCount2 = 0;
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  void _swapTexts() {
    setState(() {
      _isSwapped = !_isSwapped;
    });
  }

  void _initializeSpeech() async {
    _speech.initialize(
      onStatus: (status) {
        setState(() {
          _isListening = _speech.isListening;
        });
      },
      onError: (error) => print('Error: $error'),
    );
  }

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        setState(() {
          _text = result.recognizedWords;
          _textController1.text = _text;
          _updateWordCount1();
        });
      },
    );
  }

  void _stopListening() {
    _speech.stop();
  }

  void _updateWordCount1() {
    String text = _textController1.text.trim();
    List<String> words = text.split(' ');
    setState(() {
      _wordCount1 = words.length <= 5000 ? words.length : 5000;
      _textController1.text =
          _wordCount1 == 5000 ? words.sublist(0, 5000).join(' ') : text;
      _textController1.selection =
          TextSelection.fromPosition(TextPosition(offset: text.length));
    });
  }

  void _updateWordCount2() {
    String text = _textController2.text.trim();
    List<String> words = text.split(' ');
    setState(() {
      _wordCount2 = words.length <= 5000 ? words.length : 5000;
      _textController2.text =
          _wordCount2 == 5000 ? words.sublist(0, 5000).join(' ') : text;
      _textController2.selection =
          TextSelection.fromPosition(TextPosition(offset: text.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Translate',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          _isSwapped ? 'CENTRAL SUBANEN' : 'ENGLISH',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: _swapTexts,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.black,
                  ),
                  child: const Icon(Icons.swap_horiz, size: 50),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          _isSwapped ? 'ENGLISH' : 'CENTRAL SUBANEN',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Flexible(
              child: TextField(
                controller: _textController1,
                onChanged: (value) => _updateWordCount1(),
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$_wordCount1 / 5000',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 200),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (_isListening) {
                        _stopListening();
                      } else {
                        _startListening();
                      }
                    },
                    child: Icon(
                      _isListening ? Icons.mic_off : Icons.mic,
                      size: 30,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.spatial_audio_off,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Flexible(
              child: TextField(
                controller: _textController2,
                onChanged: (value) => _updateWordCount2(),
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$_wordCount2 / 5000',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 200),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.copy,
                    size: 30,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.spatial_audio_off,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
