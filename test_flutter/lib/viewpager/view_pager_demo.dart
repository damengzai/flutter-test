import 'package:flutter/material.dart';
import 'package:test_flutter/viewpager/view_pager.dart';

class ViewPagerDemo extends StatelessWidget {
  final List<String> arr = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462012322&di=987630d5759673ef2b8b3b48f8112f78&imgtype=0&src=http%3A%2F%2Fwww.jituwang.com%2Fuploads%2Fallimg%2F121005%2F219049-1210051Q43054.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=100023636,3868399025&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462109653&di=fc9a56f0410fbc71aa78a87994d77681&imgtype=0&src=http%3A%2F%2Fimg.boqiicdn.com%2FData%2FBK%2FA%2F1408%2F7%2Fimg88561407405003.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462109652&di=81eab7bc76410abc2ffdb7ba0bd63049&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1303%2F03%2Fc9%2F18591026_18591026_1362320235218.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462109652&di=40a8a6f283e19dbd52f7c454b13c8e2b&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1303%2F03%2Fc9%2F18591026_18591026_1362320204968.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462208642&di=9c36cc656acfa0009863cefd1e09ae80&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F74%2F46%2F300000764046131105469835325.jpg'
  ];

  List<Widget> _createViewPager() {
    List<Widget> list = [];
    list.add(ViewPager(arr, (imgUrl){}));
    return list;
  }

  @override
  Widget build(BuildContext context) {
   return Column(
     children: _createViewPager(),
   );
  }
}