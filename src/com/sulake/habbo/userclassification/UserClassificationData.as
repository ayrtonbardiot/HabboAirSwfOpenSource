// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.userclassification.UserClassificationData

package com.sulake.habbo.userclassification
{
    public class UserClassificationData 
    {

        public static var _SafeStr_9089:uint = 1;
        public static var _SafeStr_9090:uint = 2;
        public static var _SafeStr_9091:uint = 3;
        public static var PAYING_USER_CLASSIFICATION:uint = 4;

        private var _SafeStr_4128:int;
        private var _username:String;
        private var _SafeStr_5965:String;

        public function UserClassificationData(_arg_1:int, _arg_2:String, _arg_3:String)
        {
            _SafeStr_4128 = _arg_1;
            _username = _arg_2;
            _SafeStr_5965 = _arg_3;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get username():String
        {
            return (_username);
        }

        public function get classType():String
        {
            return (_SafeStr_5965);
        }

        public function toString():String
        {
            return (((((("[" + _SafeStr_4128) + ", ") + _username) + "] [") + _SafeStr_5965) + "]");
        }


    }
}//package com.sulake.habbo.userclassification

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_5965 = "_-y3" (String#15161, DoABC#4)
// _SafeStr_9089 = "_-v1i" (String#34167, DoABC#4)
// _SafeStr_9090 = "_-f1H" (String#37868, DoABC#4)
// _SafeStr_9091 = "_-Qy" (String#39251, DoABC#4)


