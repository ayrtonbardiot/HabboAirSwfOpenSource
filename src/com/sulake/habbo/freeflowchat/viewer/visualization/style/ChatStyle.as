// by nota

//com.sulake.habbo.freeflowchat.viewer.visualization.style.ChatStyle

package com.sulake.habbo.freeflowchat.viewer.visualization.style
{
    import com.sulake.habbo.freeflowchat.style._SafeStr_3366;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.text.TextFormat;
    import flash.geom.Point;
    import flash.text.StyleSheet;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.display.Sprite;

    public class ChatStyle implements _SafeStr_3366, _SafeStr_3335 
    {

        private var _background:BitmapData;
        private var _scale9Grid:Rectangle;
        private var _SafeStr_4532:BitmapData;
        private var _pointerY:int;
        private var _SafeStr_6310:Rectangle;
        private var _SafeStr_5893:TextFormat;
        private var _SafeStr_5214:BitmapData;
        private var _iconOffset:Point;
        private var _SafeStr_6311:BitmapData;
        private var _color:BitmapData;
        private var _colorOffset:Point;
        private var _overlap:Rectangle;
        private var _SafeStr_6312:Boolean;
        private var _SafeStr_6313:Boolean;
        private var _SafeStr_6314:Boolean;
        private var _SafeStr_6315:Boolean;
        private var _isAnonymous:Boolean;
        private var _allowHTML:Boolean;
        private var _SafeStr_4462:StyleSheet;

        public function ChatStyle(_arg_1:BitmapData, _arg_2:Rectangle, _arg_3:BitmapData, _arg_4:int, _arg_5:Rectangle, _arg_6:TextFormat, _arg_7:Boolean, _arg_8:Point, _arg_9:BitmapData, _arg_10:BitmapData, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Boolean, _arg_14:Boolean, _arg_15:BitmapData=null, _arg_16:Point=null, _arg_17:Rectangle=null, _arg_18:Boolean=false, _arg_19:StyleSheet=null)
        {
            _background = _arg_1;
            _scale9Grid = _arg_2;
            _SafeStr_4532 = _arg_3;
            _pointerY = _arg_4;
            _SafeStr_6310 = _arg_5;
            _SafeStr_5893 = _arg_6;
            _isAnonymous = _arg_7;
            _iconOffset = _arg_8;
            _SafeStr_5214 = _arg_9;
            _SafeStr_6311 = _arg_10;
            _SafeStr_6312 = _arg_11;
            _SafeStr_6313 = _arg_12;
            _SafeStr_6314 = _arg_14;
            _SafeStr_6315 = _arg_13;
            _color = _arg_15;
            _colorOffset = _arg_16;
            _overlap = _arg_17;
            _allowHTML = _arg_18;
            _SafeStr_4462 = _arg_19;
        }

        public function getNewBackgroundSprite(_arg_1:uint=0xFFFFFF):Sprite
        {
            var _local_4:* = null;
            var _local_2:uint;
            var _local_5:uint;
            var _local_3:uint;
            if (_color != null)
            {
                _local_4 = new BitmapData(_background.width, _background.height, _background.transparent, 0);
                _local_4.copyPixels(_background, _background.rect, new Point(0, 0));
                _local_2 = ((_arg_1 >> 16) & 0xFF);
                _local_5 = ((_arg_1 >> 8) & 0xFF);
                _local_3 = ((_arg_1 >> 0) & 0xFF);
                _local_4.draw(_color, null, new ColorTransform((_local_2 / 0xFF), (_local_5 / 0xFF), (_local_3 / 0xFF)), "darken");
            }
            else
            {
                _local_4 = _background;
            };
            return (HabboFreeFlowChat.create9SliceSprite(_scale9Grid, _local_4));
        }

        public function get textFormat():TextFormat
        {
            return (_SafeStr_5893);
        }

        public function get styleSheet():StyleSheet
        {
            return (_SafeStr_4462);
        }

        public function get pointer():BitmapData
        {
            return (_SafeStr_4532);
        }

        public function get pointerOffsetToBubbleBottom():int
        {
            return (_background.height - _pointerY);
        }

        public function get isAnonymous():Boolean
        {
            return (_isAnonymous);
        }

        public function get faceOffset():Point
        {
            return (_iconOffset);
        }

        public function get iconImage():BitmapData
        {
            return (_SafeStr_5214);
        }

        public function get textFieldMargins():Rectangle
        {
            return (_SafeStr_6310);
        }

        public function get overlap():Rectangle
        {
            return (_overlap);
        }

        public function get selectorPreview():BitmapData
        {
            return (_SafeStr_6311);
        }

        public function get isSystemStyle():Boolean
        {
            return (_SafeStr_6312);
        }

        public function get isHcOnly():Boolean
        {
            return (_SafeStr_6313);
        }

        public function get isAmbassadorOnly():Boolean
        {
            return (_SafeStr_6314);
        }

        public function get isStaffOverrideable():Boolean
        {
            return (_SafeStr_6315);
        }

        public function get allowHTML():Boolean
        {
            return (_allowHTML);
        }


    }
}//package com.sulake.habbo.freeflowchat.viewer.visualization.style

// _SafeStr_3335 = "_-sO" (String#7785, DoABC#4)
// _SafeStr_3366 = "_-ls" (String#8795, DoABC#4)
// _SafeStr_4462 = "_-Q1t" (String#9981, DoABC#4)
// _SafeStr_4532 = "_-w4" (String#2564, DoABC#4)
// _SafeStr_5214 = "_-D1k" (String#2378, DoABC#4)
// _SafeStr_5893 = "_-f1K" (String#6379, DoABC#4)
// _SafeStr_6310 = "_-i1i" (String#16954, DoABC#4)
// _SafeStr_6311 = "_-Wx" (String#19167, DoABC#4)
// _SafeStr_6312 = "_-p16" (String#8868, DoABC#4)
// _SafeStr_6313 = "_-8j" (String#22281, DoABC#4)
// _SafeStr_6314 = "_-L1u" (String#22734, DoABC#4)
// _SafeStr_6315 = "_-85" (String#8791, DoABC#4)


