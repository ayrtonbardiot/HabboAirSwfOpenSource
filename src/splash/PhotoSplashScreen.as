// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//splash.PhotoSplashScreen

package splash
{
    import flash.display.Sprite;
    import __AS3__.vec.Vector;
    import flash.display.Bitmap;
    import flash.display.DisplayObjectContainer;

    public class PhotoSplashScreen extends Sprite 
    {

        private var splashBgClass:Class = _SafeStr_87;
        private var splashTopClass:Class = _SafeStr_88;
        private var splashImg1:Class = _SafeStr_99;
        private var splashImg2:Class = _SafeStr_110;
        private var splashImg3:Class = _SafeStr_112;
        private var splashImg4:Class = _SafeStr_113;
        private var splashImg5:Class = _SafeStr_114;
        private var splashImg6:Class = _SafeStr_115;
        private var splashImg7:Class = _SafeStr_116;
        private var splashImg8:Class = _SafeStr_117;
        private var splashImg9:Class = _SafeStr_118;
        private var splashImg10:Class = _SafeStr_89;
        private var splashImg11:Class = _SafeStr_90;
        private var splashImg12:Class = _SafeStr_91;
        private var splashImg13:Class = _SafeStr_92;
        private var splashImg14:Class = _SafeStr_93;
        private var splashImg15:Class = _SafeStr_94;
        private var splashImg16:Class = _SafeStr_95;
        private var splashImg17:Class = _SafeStr_96;
        private var splashImg18:Class = _SafeStr_97;
        private var splashImg19:Class = _SafeStr_98;
        private var splashImg20:Class = _SafeStr_100;
        private var splashImg21:Class = _SafeStr_101;
        private var splashImg22:Class = _SafeStr_102;
        private var splashImg23:Class = _SafeStr_103;
        private var splashImg24:Class = _SafeStr_104;
        private var splashImg25:Class = _SafeStr_105;
        private var splashImg26:Class = _SafeStr_106;
        private var splashImg27:Class = _SafeStr_107;
        private var splashImg28:Class = _SafeStr_108;
        private var splashImg29:Class = _SafeStr_109;
        private var splashImg30:Class = _SafeStr_111;

        public function PhotoSplashScreen(_arg_1:DisplayObjectContainer)
        {
            var _local_3:* = null;
            super();
            var _local_2:Vector.<Bitmap> = new Vector.<Bitmap>(0);
            _local_3 = (new splashBgClass() as Bitmap);
            _local_2.push(_local_3);
            var _local_4:Class = (this[("splashImg" + int((1 + Math.floor((Math.random() * 30)))))] as Class);
            if (_local_4 != null)
            {
                _local_3 = new (_local_4)();
                _local_3.x = 96;
                _local_3.y = 51;
                _local_2.push(_local_3);
            };
            _local_3 = (new splashTopClass() as Bitmap);
            _local_2.push(_local_3);
            for each (_local_3 in _local_2)
            {
                addChild(_local_3);
            };
        }

    }
}//package splash

// _SafeStr_100 = "userphoto_20_png$d3d120528593c4a8a6e4ffbf86cb7a88-1250882734" (String#2943, DoABC#3)
// _SafeStr_101 = "userphoto_21_png$3adaac9226fbdf35e1d1718b33b87858-1253874733" (String#2944, DoABC#3)
// _SafeStr_102 = "userphoto_22_png$007be0c8a58a020bf4df2e7c2c585bed-1252689300" (String#2945, DoABC#3)
// _SafeStr_103 = "userphoto_23_png$eedbb904f3d8c0f45230629124f4055a-1264102675" (String#2946, DoABC#3)
// _SafeStr_104 = "userphoto_24_png$abfd453da5435f619954d4c844a19a29-1263948434" (String#2947, DoABC#3)
// _SafeStr_105 = "userphoto_25_png$89bf9ce7be2aa258b97c0355d651f325-1262778897" (String#2948, DoABC#3)
// _SafeStr_106 = "userphoto_26_png$7ac7732aa408e55ba231ce026a8e5e49-1265787800" (String#2949, DoABC#3)
// _SafeStr_107 = "userphoto_27_png$b26b015da87e6b9faea24a041ab10a89-1264585495" (String#2950, DoABC#3)
// _SafeStr_108 = "userphoto_28_png$ecb3ea215e9527f040d2976dcccbff61-1260269718" (String#2951, DoABC#3)
// _SafeStr_109 = "userphoto_29_png$e8101c9db79869435c9a788a324c0fc7-1259329557" (String#2952, DoABC#3)
// _SafeStr_110 = "userphoto_2_png$5e29af630b42d7828a6e06c4d8289180-98240412" (String#2953, DoABC#3)
// _SafeStr_111 = "userphoto_30_png$bc53ce024355fb2eff0f331c42bb5d13-1289084687" (String#2954, DoABC#3)
// _SafeStr_112 = "userphoto_3_png$b51730fba4bf1d05cc32fd18a18ca9f4-97070875" (String#2955, DoABC#3)
// _SafeStr_113 = "userphoto_4_png$78e97ef848421e251726fee4afb2473a-96916634" (String#2956, DoABC#3)
// _SafeStr_114 = "userphoto_5_png$8290aa0cebb5a0e5f12bff508d35b955-99941401" (String#2957, DoABC#3)
// _SafeStr_115 = "userphoto_6_png$46ee8945b9f2d4717e974b7bf880848a-98756000" (String#2958, DoABC#3)
// _SafeStr_116 = "userphoto_7_png$c609a45125801626e60ab38c065d9200-93359391" (String#2959, DoABC#3)
// _SafeStr_117 = "userphoto_8_png$78ce6ea691af8b85548def11d58acbf5-93237918" (String#2960, DoABC#3)
// _SafeStr_118 = "userphoto_9_png$20048192e570e61356072b9eca190d30-96229917" (String#2961, DoABC#3)
// _SafeStr_87 = "splash_bg_png$872973ab0ff6dc56a2913740f64ca898-2102933241" (String#13813, DoABC#3)
// _SafeStr_88 = "splash_top_png$f4479ecbac617e539f334779def0010d-751749527" (String#13814, DoABC#3)
// _SafeStr_89 = "userphoto_10_png$a6cecfad3ec1184acd8a3dc85128512a-1232833997" (String#2932, DoABC#3)
// _SafeStr_90 = "userphoto_11_png$4b60ecb7dfddec8af8f2a8cd20f00eba-1231664564" (String#2933, DoABC#3)
// _SafeStr_91 = "userphoto_12_png$a38bde397ea3f5bc50e19a8ce2ba4db8-1231510835" (String#2934, DoABC#3)
// _SafeStr_92 = "userphoto_13_png$b3bc4ab23c6c91324461a4b1eb930e1d-1226130098" (String#2935, DoABC#3)
// _SafeStr_93 = "userphoto_14_png$9df1fe61af425d188526062daae5ed31-1224960561" (String#2936, DoABC#3)
// _SafeStr_94 = "userphoto_15_png$3ceb9d73ff982e75f20da917789ff7f9-1227953080" (String#2937, DoABC#3)
// _SafeStr_95 = "userphoto_16_png$bf34a4149a76aa830b227dc23c7437e3-1227832119" (String#2938, DoABC#3)
// _SafeStr_96 = "userphoto_17_png$dc08684bc47fe3156296fe1e9d4f79de-1239228598" (String#2939, DoABC#3)
// _SafeStr_97 = "userphoto_18_png$7ec284b155a067abba4c3411bd4ed487-1238026293" (String#2940, DoABC#3)
// _SafeStr_98 = "userphoto_19_png$a817a5baf9b3ebf581906b42eb22cc72-1241051580" (String#2941, DoABC#3)
// _SafeStr_99 = "userphoto_1_png$8c866f4268d85467c3b3ac398ddb5d6c-86842901" (String#2942, DoABC#3)


