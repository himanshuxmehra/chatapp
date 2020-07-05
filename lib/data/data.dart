import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/model/story_model.dart';
import 'package:chatapp/model/msg_model.dart';

List<StoryModel> getStories() {
  List<StoryModel> stories = new List();
  StoryModel storyModel = new StoryModel();

  //1
  storyModel.imgurl =
      "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80";
  storyModel.username = "Anshul";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //2
  storyModel.imgurl =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80";
  storyModel.username = "Lacy";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //3
  storyModel.imgurl =
      "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80";
  storyModel.username = "Himanshu";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //4
  storyModel.imgurl =
      "https://images.unsplash.com/photo-1520223297779-95bbd1ea79b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=666&q=80";
  storyModel.username = "John";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //5
  storyModel.imgurl =
      "https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=330&q=80";
  storyModel.username = "Shubham";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //6
  storyModel.imgurl =
      "https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80";
  storyModel.username = "Akansha";
  stories.add(storyModel);

  storyModel = new StoryModel();

  //7
  storyModel.imgurl =
      "https://images.unsplash.com/photo-1523419409543-a5e549c1faa8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=343&q=80";
  storyModel.username = "Harshit";
  stories.add(storyModel);

  storyModel = new StoryModel();
  return stories;
}

List<ChatModel> getChats() {
  List<ChatModel> chats = new List();
  ChatModel chatModel = new ChatModel();

  //1
  chatModel.name = "Elon Musk";
  chatModel.imgurl =
      "https://upload.wikimedia.org/wikipedia/commons/e/ed/Elon_Musk_Royal_Society.jpg";
  chatModel.isunreadmsg = true;
  chatModel.lastmessage = "Aur bhau kaisa hai? bhau bhau bhau bhau bhau ";
  chatModel.time = "Just now";
  chatModel.unreadmsgs = 1;

  chats.add(chatModel);

  chatModel = new ChatModel();

  //3
  chatModel.name = "Bihari";
  chatModel.imgurl =
      "https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=330&q=80";
  chatModel.isunreadmsg = true;
  chatModel.lastmessage = "Chutki dila de";
  chatModel.time = "5m";
  chatModel.unreadmsgs = 1;

  chats.add(chatModel);

  chatModel = new ChatModel();

  //4
  chatModel.name = "Anshul";
  chatModel.imgurl =
      "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80";
  chatModel.isunreadmsg = false;
  chatModel.lastmessage = "...";
  chatModel.time = "10m";
  chatModel.unreadmsgs = 1;

  chats.add(chatModel);

  chatModel = new ChatModel();

  //5
  chatModel.name = "Harshit";
  chatModel.imgurl =
      "https://images.unsplash.com/photo-1523419409543-a5e549c1faa8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=343&q=80";
  chatModel.isunreadmsg = false;
  chatModel.lastmessage = ".....";
  chatModel.time = "years ago";
  chatModel.unreadmsgs = 0;

  chats.add(chatModel);

  chatModel = new ChatModel();
  //2
  chatModel.name = "Tony Stark";
  chatModel.imgurl =
      "https://images.unsplash.com/photo-1584444527303-9d66a8948673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  chatModel.isunreadmsg = false;
  chatModel.lastmessage = "I'm breaking up with Jarvis! I love alexa now <3";
  chatModel.time = "Just now";
  chatModel.unreadmsgs = 1;

  chats.add(chatModel);

  chatModel = new ChatModel();
  //6
  chatModel.name = "Akansha";
  chatModel.imgurl =
      "https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  chatModel.isunreadmsg = false;
  chatModel.lastmessage = "<3";
  chatModel.time = "Just now";
  chatModel.unreadmsgs = 0;

  chats.add(chatModel);

  chatModel = new ChatModel();

  //6
  chatModel.name = "Unknown";
  chatModel.imgurl =
      "https://images.unsplash.com/photo-1520626337972-ebf863448db6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=625&q=80";
  chatModel.isunreadmsg = true;
  chatModel.lastmessage = "Heyy!";
  chatModel.time = "Just now";
  chatModel.unreadmsgs = 1;

  chats.add(chatModel);

  chatModel = new ChatModel();

  return chats;
}

List<MsgModel> getMsgs() {
  List<MsgModel> msgs = new List();
  MsgModel msg = new MsgModel();

  //1
  msg.text = "Rom Rom!";
  msg.isbyme = true;
  msgs.add(msg);
  msg = new MsgModel();

  //1
  msg.text = "Rom Rom!";
  msg.isbyme = false;
  msgs.add(msg);
  msg = new MsgModel();

  //1
  msg.text = "Rom sfdsfdsfdsfdsfdsfbjsd fd sfjds jf dsfbjdsfbjdsbndsRom!";
  msg.isbyme = true;
  msgs.add(msg);
  msg = new MsgModel();

  //1
  msg.text = "Rom fsdfsdfdsfdRom!";
  msg.isbyme = true;
  msgs.add(msg);
  msg = new MsgModel();

  //1
  msg.text = "Rom fdasfadsfdsfdRom!";
  msg.isbyme = false;
  msgs.add(msg);
  msg = new MsgModel();
  //1
  msg.text = "Rom Rom!";
  msg.isbyme = true;
  msgs.add(msg);
  msg = new MsgModel();

  return msgs;
}
