// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.advertisement.AdImageRequest

package com.sulake.habbo.advertisement
{
    public class AdImageRequest 
    {

        private var _SafeStr_3693:int;
        private var _SafeStr_4157:int;
        private var _SafeStr_4750:int;
        private var _SafeStr_4751:String;
        private var _SafeStr_4752:String;

        public function AdImageRequest(_arg_1:int, _arg_2:String=null, _arg_3:String=null, _arg_4:int=-1, _arg_5:int=-1)
        {
            _SafeStr_3693 = _arg_1;
            _SafeStr_4157 = _arg_4;
            _SafeStr_4750 = _arg_5;
            _SafeStr_4751 = _arg_2;
            _SafeStr_4752 = _arg_3;
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get objectCategory():int
        {
            return (_SafeStr_4750);
        }

        public function get imageURL():String
        {
            return (_SafeStr_4751);
        }

        public function get clickURL():String
        {
            return (_SafeStr_4752);
        }


    }
}//package com.sulake.habbo.advertisement

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4750 = "_-E1d" (String#2700, DoABC#4)
// _SafeStr_4751 = "_-dA" (String#18998, DoABC#4)
// _SafeStr_4752 = "_-U1f" (String#15964, DoABC#4)


