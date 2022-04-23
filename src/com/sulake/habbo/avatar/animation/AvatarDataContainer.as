// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.animation.AvatarDataContainer

package com.sulake.habbo.avatar.animation
{
    import flash.geom.ColorTransform;
    import com.sulake.core.utils._SafeStr_24;

    public class AvatarDataContainer implements _SafeStr_3323 
    {

        private var _SafeStr_6412:int;
        private var _foreGround:uint;
        private var _backGround:uint;
        private var _SafeStr_5882:ColorTransform;
        private var _SafeStr_6640:uint;
        private var _r:uint;
        private var _g:uint;
        private var _b:uint;
        private var _SafeStr_6641:Number = 1;
        private var _SafeStr_6642:Number = 1;
        private var _SafeStr_6643:Number = 1;
        private var _SafeStr_4172:Number = 1;
        private var _SafeStr_6644:_SafeStr_24;
        private var _SafeStr_6645:Boolean = true;

        public function AvatarDataContainer(_arg_1:XML)
        {
            _SafeStr_6412 = parseInt(_arg_1.@ink);
            var _local_2:String = String(_arg_1.@foreground);
            _local_2 = _local_2.replace("#", "");
            var _local_3:String = String(_arg_1.@background);
            _local_3 = _local_3.replace("#", "");
            _foreGround = parseInt(_local_2, 16);
            _backGround = parseInt(_local_3, 16);
            _SafeStr_6640 = parseInt(_local_2, 16);
            _r = ((_SafeStr_6640 >> 16) & 0xFF);
            _g = ((_SafeStr_6640 >> 8) & 0xFF);
            _b = ((_SafeStr_6640 >> 0) & 0xFF);
            _SafeStr_6641 = ((_r / 0xFF) * 1);
            _SafeStr_6642 = ((_g / 0xFF) * 1);
            _SafeStr_6643 = ((_b / 0xFF) * 1);
            if (_SafeStr_6412 == 37)
            {
                _SafeStr_4172 = 0.5;
                _SafeStr_6645 = false;
            };
            _SafeStr_5882 = new ColorTransform(_SafeStr_6641, _SafeStr_6642, _SafeStr_6643, _SafeStr_4172);
            _SafeStr_6644 = generatePaletteMapForGrayscale(_backGround, _foreGround);
        }

        public function get ink():int
        {
            return (_SafeStr_6412);
        }

        public function get colorTransform():ColorTransform
        {
            return (_SafeStr_5882);
        }

        public function get reds():Array
        {
            return (_SafeStr_6644.getValue("reds") as Array);
        }

        public function get greens():Array
        {
            return (_SafeStr_6644.getValue("greens") as Array);
        }

        public function get blues():Array
        {
            return (_SafeStr_6644.getValue("blues") as Array);
        }

        public function get alphas():Array
        {
            return (_SafeStr_6644.getValue("alphas") as Array);
        }

        public function get paletteIsGrayscale():Boolean
        {
            return (_SafeStr_6645);
        }

        private function generatePaletteMapForGrayscale(_arg_1:uint, _arg_2:uint):_SafeStr_24
        {
            var _local_9:int;
            var _local_15:* = ((_arg_1 >> 24) & 0xFF);
            var _local_24:* = ((_arg_1 >> 16) & 0xFF);
            var _local_10:* = ((_arg_1 >> 8) & 0xFF);
            var _local_14:* = ((_arg_1 >> 0) & 0xFF);
            var _local_17:* = ((_arg_2 >> 24) & 0xFF);
            var _local_3:* = ((_arg_2 >> 16) & 0xFF);
            var _local_11:* = ((_arg_2 >> 8) & 0xFF);
            var _local_16:* = ((_arg_2 >> 0) & 0xFF);
            var _local_21:Number = ((_local_17 - _local_15) / 0xFF);
            var _local_12:Number = ((_local_3 - _local_24) / 0xFF);
            var _local_6:Number = ((_local_11 - _local_10) / 0xFF);
            var _local_23:Number = ((_local_16 - _local_14) / 0xFF);
            var _local_22:_SafeStr_24 = new _SafeStr_24();
            var _local_19:Array = [];
            var _local_8:Array = [];
            var _local_13:Array = [];
            var _local_20:Array = [];
            var _local_4:Number = _local_15;
            var _local_18:Number = _local_24;
            var _local_7:Number = _local_10;
            var _local_5:Number = _local_14;
            _local_9 = 0;
            while (_local_9 < 0x0100)
            {
                if ((((_local_18 == _local_24) && (_local_7 == _local_10)) && (_local_5 == _local_14)))
                {
                    _local_4 = 0;
                };
                _local_4 = (_local_4 + _local_21);
                _local_18 = (_local_18 + _local_12);
                _local_7 = (_local_7 + _local_6);
                _local_5 = (_local_5 + _local_23);
                _local_20.push((_local_4 << 24));
                _local_19.push(((((_local_4 << 24) | (_local_18 << 16)) | (_local_7 << 8)) | _local_5));
                _local_8.push(((((_local_4 << 24) | (_local_18 << 16)) | (_local_7 << 8)) | _local_5));
                _local_13.push(((((_local_4 << 24) | (_local_18 << 16)) | (_local_7 << 8)) | _local_5));
                _local_9++;
            };
            _local_22.add("alphas", _local_19);
            _local_22.add("reds", _local_19);
            _local_22.add("greens", _local_8);
            _local_22.add("blues", _local_13);
            return (_local_22);
        }


    }
}//package com.sulake.habbo.avatar.animation

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3323 = "_-o1w" (String#8055, DoABC#4)
// _SafeStr_4172 = "_-y1Y" (String#3594, DoABC#4)
// _SafeStr_5882 = "_-s5" (String#1584, DoABC#4)
// _SafeStr_6412 = "_-hl" (String#4387, DoABC#4)
// _SafeStr_6640 = "_-71P" (String#5835, DoABC#4)
// _SafeStr_6641 = "_-xY" (String#8743, DoABC#4)
// _SafeStr_6642 = "_-p1G" (String#8513, DoABC#4)
// _SafeStr_6643 = "_-QL" (String#7942, DoABC#4)
// _SafeStr_6644 = "_-C1w" (String#11216, DoABC#4)
// _SafeStr_6645 = "_-j1f" (String#17339, DoABC#4)


