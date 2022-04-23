// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.roomsettings.FriendEntryData

package com.sulake.habbo.navigator.roomsettings
{
    import _-n1H._SafeStr_1627;

    public class FriendEntryData implements _SafeStr_1627 
    {

        private var _SafeStr_4128:int;
        private var _userName:String;

        public function FriendEntryData(_arg_1:int, _arg_2:String)
        {
            _SafeStr_4128 = _arg_1;
            _userName = _arg_2;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }


    }
}//package com.sulake.habbo.navigator.roomsettings

// _SafeStr_1627 = "_-k1s" (String#15391, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)


