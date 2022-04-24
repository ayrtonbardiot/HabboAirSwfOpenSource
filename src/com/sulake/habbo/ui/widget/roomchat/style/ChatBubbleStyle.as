// by nota

//com.sulake.habbo.ui.widget.roomchat.style.ChatBubbleStyle

package com.sulake.habbo.ui.widget.roomchat.style
{
    import com.sulake.core.window.components.IRegionWindow;
    import flash.display.BitmapData;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAsset;

    public class ChatBubbleStyle 
    {

        private var _SafeStr_5982:int;
        private var _styleName:String;
        private var _SafeStr_6312:Boolean = false;
        private var _SafeStr_6315:Boolean = false;
        private var _normalLayout:IRegionWindow;
        private var _whisperLayout:IRegionWindow;
        private var _shoutLayout:IRegionWindow;
        private var _SafeStr_6797:BitmapData;
        private var _SafeStr_6798:BitmapData;
        private var _SafeStr_6799:BitmapData;
        private var _SafeStr_6800:BitmapData;
        private var _SafeStr_6801:BitmapData;
        private var _SafeStr_6802:BitmapData;

        public function ChatBubbleStyle(_arg_1:_SafeStr_21, _arg_2:_SafeStr_1695, _arg_3:XML)
        {
            _SafeStr_5982 = _arg_3.@id[0];
            _styleName = _arg_3.@name[0];
            _SafeStr_6312 = _arg_3.@systemstyle[0];
            _SafeStr_6315 = _arg_3.@staffoverride[0];
            var _local_11:XML = _arg_3.child("layouts")[0];
            var _local_4:XML = _arg_3.child("bitmaps")[0];
            _normalLayout = buildBubbleWindow(_arg_2, _arg_1, getXmlElementAssetId(_local_11, "speakLayout"));
            _whisperLayout = buildBubbleWindow(_arg_2, _arg_1, getXmlElementAssetId(_local_11, "whisperLayout"));
            _shoutLayout = buildBubbleWindow(_arg_2, _arg_1, getXmlElementAssetId(_local_11, "shoutLayout"));
            var _local_9:String = getXmlElementAssetId(_local_4, "leftBitmap");
            var _local_6:String = getXmlElementAssetId(_local_4, "leftColorBitmap");
            var _local_7:String = getXmlElementAssetId(_local_4, "middleBitmap");
            var _local_5:String = getXmlElementAssetId(_local_4, "rightBitmap");
            var _local_10:String = getXmlElementAssetId(_local_4, "pointerBitmap");
            if (_local_9)
            {
                _SafeStr_6797 = getBitmapDataFor(_local_9, _arg_1);
            };
            if (_local_6)
            {
                _SafeStr_6798 = getBitmapDataFor(_local_6, _arg_1);
            };
            if (_local_7)
            {
                _SafeStr_6799 = getBitmapDataFor(_local_7, _arg_1);
            };
            if (_local_5)
            {
                _SafeStr_6800 = getBitmapDataFor(_local_5, _arg_1);
            };
            if (_local_10)
            {
                _SafeStr_6801 = getBitmapDataFor(_local_10, _arg_1);
            };
            var _local_8:String = getXmlElementAssetId(_local_4, "previewIconBitmap");
            if (_local_8)
            {
                _SafeStr_6802 = getBitmapDataFor(_local_8, _arg_1);
            };
        }

        private static function getXmlElementAssetId(_arg_1:XML, _arg_2:String):String
        {
            var _local_3:XMLList = _arg_1.child(_arg_2);
            if (_local_3.length() < 1)
            {
                return (null);
            };
            var _local_4:XMLList = XML(_local_3[0]).attribute("assetId");
            if (_local_4.length() < 1)
            {
                return (null);
            };
            return (_local_4[0]);
        }


        public function get normalLayout():IRegionWindow
        {
            return (_normalLayout);
        }

        public function get whisperLayout():IRegionWindow
        {
            return (_whisperLayout);
        }

        public function get shoutLayout():IRegionWindow
        {
            return (_shoutLayout);
        }

        public function get leftBitmapData():BitmapData
        {
            return (_SafeStr_6797);
        }

        public function get leftColorBitmapData():BitmapData
        {
            return (_SafeStr_6798);
        }

        public function get middleBitmapData():BitmapData
        {
            return (_SafeStr_6799);
        }

        public function get rightBitmapData():BitmapData
        {
            return (_SafeStr_6800);
        }

        public function get pointerBitmapData():BitmapData
        {
            return (_SafeStr_6801);
        }

        public function get isSystemStyle():Boolean
        {
            return (_SafeStr_6312);
        }

        public function get isStaffOverrideable():Boolean
        {
            return (_SafeStr_6315);
        }

        public function get selectorPreviewIconBitmapData():BitmapData
        {
            return (_SafeStr_6802);
        }

        private function buildBubbleWindow(_arg_1:_SafeStr_1695, _arg_2:_SafeStr_21, _arg_3:String):IRegionWindow
        {
            if (_arg_3 == null)
            {
                return (null);
            };
            var _local_5:IAsset = _arg_2.getAssetByName(localAssetName((_arg_3 + "_xml")));
            var _local_4:IRegionWindow = (_arg_1.buildFromXML((_local_5.content as XML), 1) as IRegionWindow);
            _local_4.tags.push("roomchat_bubble");
            _local_4.x = 0;
            _local_4.y = 0;
            _local_4.width = 0;
            _local_4.background = true;
            _local_4.mouseThreshold = 0;
            _local_4.setParamFlag(0x40000000, true);
            return (_local_4);
        }

        private function localAssetName(_arg_1:String):String
        {
            return ((("roomchat_styles_" + _styleName) + "_") + _arg_1);
        }

        private function getBitmapDataFor(_arg_1:String, _arg_2:_SafeStr_21):BitmapData
        {
            var _local_3:IAsset = _arg_2.getAssetByName(localAssetName(_arg_1));
            if (_local_3)
            {
                return (BitmapData(_local_3.content));
            };
            throw (new Error(("Configured bitmapdata asset missing for chat bubble style: " + localAssetName(_arg_1))));
            return (null); //dead code
        }


    }
}//package com.sulake.habbo.ui.widget.roomchat.style

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_5982 = "_-AQ" (String#7031, DoABC#4)
// _SafeStr_6312 = "_-p16" (String#8868, DoABC#4)
// _SafeStr_6315 = "_-85" (String#8791, DoABC#4)
// _SafeStr_6797 = "_-r1O" (String#21270, DoABC#4)
// _SafeStr_6798 = "_-01h" (String#20226, DoABC#4)
// _SafeStr_6799 = "_-HN" (String#22550, DoABC#4)
// _SafeStr_6800 = "_-aX" (String#19036, DoABC#4)
// _SafeStr_6801 = "_-21Q" (String#20331, DoABC#4)
// _SafeStr_6802 = "_-z" (String#21884, DoABC#4)


