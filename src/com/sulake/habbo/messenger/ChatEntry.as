// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.messenger.ChatEntry

package com.sulake.habbo.messenger
{
    import flash.utils.getTimer;

    public class ChatEntry 
    {

        public static const TYPE_OWN_CHAT:int = 1;
        public static const TYPE_OTHER_CHAT:int = 2;
        public static const _SafeStr_8642:int = 3;
        public static const TYPE_INFO:int = 4;
        public static const _SafeStr_8643:int = 5;

        private var _SafeStr_4028:int;
        private var _SafeStr_4579:int;
        private var _SafeStr_4132:String;
        private var _SafeStr_6037:int;
        private var _clientReceiveTime:int;
        private var _SafeStr_5974:String;

        public function ChatEntry(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null)
        {
            _SafeStr_4028 = _arg_1;
            _SafeStr_4579 = _arg_2;
            _SafeStr_4132 = _arg_3;
            _SafeStr_6037 = _arg_4;
            _clientReceiveTime = getTimer();
            _SafeStr_5974 = _arg_5;
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get senderId():int
        {
            return (_SafeStr_4579);
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function get extraData():String
        {
            return (_SafeStr_5974);
        }

        public function get secondsSinceSent():int
        {
            var _local_1:int = int(((getTimer() - _clientReceiveTime) / 1000));
            return (_SafeStr_6037 + _local_1);
        }

        public function sentTimeStamp():Number
        {
            return (new Date().getTime() - (secondsSinceSent * 1000));
        }

        public function prefixMessageWith(_arg_1:String):void
        {
            _SafeStr_4132 = ((_arg_1 + "\n") + _SafeStr_4132);
        }


    }
}//package com.sulake.habbo.messenger

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_4579 = "_-021" (String#3552, DoABC#4)
// _SafeStr_5974 = "_-Wl" (String#10041, DoABC#4)
// _SafeStr_6037 = "_-LW" (String#18816, DoABC#4)
// _SafeStr_8642 = "_-a1s" (String#37300, DoABC#4)
// _SafeStr_8643 = "_-m1r" (String#36426, DoABC#4)


