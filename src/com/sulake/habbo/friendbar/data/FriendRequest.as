// by nota

//com.sulake.habbo.friendbar.data.FriendRequest

package com.sulake.habbo.friendbar.data
{
    public class FriendRequest implements _SafeStr_3367 
    {

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _SafeStr_3819:String;

        public function FriendRequest(_arg_1:int, _arg_2:String, _arg_3:String)
        {
            _SafeStr_3820 = _arg_1;
            _name = _arg_2;
            _SafeStr_3819 = _arg_3;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }


    }
}//package com.sulake.habbo.friendbar.data

// _SafeStr_3367 = "_-41n" (String#5091, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)


