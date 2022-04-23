// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.PetColorResult

package com.sulake.habbo.room
{
    public class PetColorResult 
    {

        private static const COLOR_TAGS:Array = ["Null", "Black", "White", "Grey", "Red", "Orange", "Pink", "Green", "Lime", "Blue", "Light-Blue", "Dark-Blue", "Yellow", "Brown", "Dark-Brown", "Beige", "Cyan", "Purple", "Gold"];

        private var _SafeStr_5255:int;
        private var _SafeStr_4019:String;
        private var _SafeStr_3820:String;
        private var _primaryColor:int = 0;
        private var _secondaryColor:int = 0;
        private var _SafeStr_5256:Boolean = false;
        private var _SafeStr_5257:Array = [];

        public function PetColorResult(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Boolean, _arg_7:Array)
        {
            _primaryColor = (_arg_1 & 0xFFFFFF);
            _secondaryColor = (_arg_2 & 0xFFFFFF);
            _SafeStr_5255 = _arg_3;
            _SafeStr_4019 = (((_arg_4 > -1) && (_arg_4 < COLOR_TAGS.length)) ? COLOR_TAGS[_arg_4] : "");
            _SafeStr_3820 = _arg_5;
            _SafeStr_5256 = _arg_6;
            _SafeStr_5257 = _arg_7;
        }

        public function get primaryColor():int
        {
            return (_primaryColor);
        }

        public function get secondaryColor():int
        {
            return (_secondaryColor);
        }

        public function get breed():int
        {
            return (_SafeStr_5255);
        }

        public function get tag():String
        {
            return (_SafeStr_4019);
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get isMaster():Boolean
        {
            return (_SafeStr_5256);
        }

        public function get layerTags():Array
        {
            return (_SafeStr_5257);
        }


    }
}//package com.sulake.habbo.room

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4019 = "_-LH" (String#3197, DoABC#4)
// _SafeStr_5255 = "_-C" (String#9448, DoABC#4)
// _SafeStr_5256 = "_-7B" (String#22265, DoABC#4)
// _SafeStr_5257 = "_-x1d" (String#12938, DoABC#4)


