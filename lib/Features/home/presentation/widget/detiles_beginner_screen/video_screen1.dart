import 'dart:math';
import 'package:chewie/chewie.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class VideoScreen1 extends StatefulWidget {

  const VideoScreen1({Key? key}) : super(key: key);

  @override
  State<VideoScreen1> createState() => _VideoScreen1State();
}

class _VideoScreen1State extends State<VideoScreen1> {
  final picker = ImagePicker();
  File? file;
  File? fileVideo;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  String videoUrl = 'https://firebasestorage.googleapis.com/v0/b/newflutter-6a968.appspot.com/o/video%2F%D8%A7%D8%B3%D9%87%D9%84%20%D9%88%D8%A7%D9%87%D9%85%20%D8%AA%D9%85%D8%A7%D8%B1%D9%8A%D9%86%20%D9%84%D9%84%D8%A8%D8%B7%D9%86%20%F0%9F%92%AA%F0%9F%8F%BB.mp4?alt=media&token=1f48a4cf-995e-4a0e-ae80-f92ef9f180e0';
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();

    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 12 / 20, // adjust as needed
      autoPlay: true,
      looping: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Chewie(controller: _chewieController),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: background,
      //   onPressed: () async {
      //     await pickVideo();
      //   },
      //   child: Icon(Icons.video_collection),
      // ),
    );
  }

  pickImage() async {
    final XFile? imageFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      file = File(imageFile.path);

      var nameImage = basename(imageFile.path);

      var random = Random().nextInt(10000000);
      nameImage = '$random$nameImage';
      print('//////////$nameImage');
      var refsStorge = FirebaseStorage.instance.ref('images/$random$nameImage');
      await refsStorge.putFile(file!);
      var url = await refsStorge.getDownloadURL();
      print('//////////$url');
    } else {
      print('Error');
    }

  }

  pickVideo() async {
    final XFile? getVedio =
        await picker.pickVideo(source: ImageSource.gallery);
    print(getVedio);

    // if (getVedio != null) {
    //   fileVideo = File(getVedio.path);
    //
    //   var nameVedio = basename(getVedio.path);
    //
    //   var random = Random().nextInt(10000000);
    //   nameVedio = '$random$nameVedio';
    //
    //   print('//////////$nameVedio');
    //
    //   // upload
    //   //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    //     var ref = FirebaseStorage.instance
    //         .ref('videos')
    //         .child('$nameVedio.mp4');
    //
    //     var uploadTask = ref.putFile(File(getVedio.path));
    //
    //     await uploadTask.whenComplete(() => null);
    //     return await ref.getDownloadURL();
    //   } else {
    //     return null;
    //   }
    if (getVedio != null) {
      file = File(getVedio.path);

      var namevideo = basename(getVedio.path);

      var random = Random().nextInt(10000000);
      namevideo = '$random$namevideo';
      print('//////////$namevideo');
      var refsStorgeVideo = await FirebaseStorage.instance.ref('Video/$random$namevideo');
      await refsStorgeVideo.putFile(file!);
      var url = await refsStorgeVideo.getDownloadURL();


      print('//////////$url');
    } else {
      print('Error');
    }
  }


  void initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.file(file!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
      });
  }

  Widget _videoPreviewWidget() {
   if(videoUrl != null){
     return AspectRatio(
       aspectRatio: _videoPlayerController.value.aspectRatio,
       child: VideoPlayer(_videoPlayerController),
     );
   }else{
     return CircularProgressIndicator();
   }

  }
}

