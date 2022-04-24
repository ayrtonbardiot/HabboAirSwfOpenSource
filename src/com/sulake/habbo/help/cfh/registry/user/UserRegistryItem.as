// by nota

//com.sulake.habbo.help.cfh.registry.user.UserRegistryItem

package com.sulake.habbo.help.cfh.registry.user
{
    public class UserRegistryItem 
    {

        private var _SafeStr_4128:int;
        private var _userName:String = "";
        private var _roomName:String = "";
        private var _SafeStr_3819:String = "";
        private var _SafeStr_3693:int;

        public function UserRegistryItem(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:String="")
        {
            _SafeStr_4128 = _arg_1;
            _userName = _arg_2;
            _SafeStr_3693 = _arg_4;
            _roomName = _arg_5;
            _SafeStr_3819 = _arg_3;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function set roomName(_arg_1:String):void
        {
            _roomName = _arg_1;
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.help.cfh.registry.user

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)


