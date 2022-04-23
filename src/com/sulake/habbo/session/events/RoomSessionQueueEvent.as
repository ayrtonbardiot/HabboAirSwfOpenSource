// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionQueueEvent

package com.sulake.habbo.session.events
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionQueueEvent extends RoomSessionEvent 
    {

        public static const QUEUE_STATUS:String = "RSQE_QUEUE_STATUS";
        public static const _SafeStr_8911:String = "c";
        public static const QUEUE_TYPE_NORMAL:String = "d";
        public static const _SafeStr_8912:int = 2;
        public static const _SafeStr_8913:int = 1;

        private var _name:String;
        private var _SafeStr_4017:int;
        private var _SafeStr_4512:_SafeStr_24;
        private var _SafeStr_4495:Boolean;
        private var _SafeStr_8914:String;

        public function RoomSessionQueueEvent(_arg_1:IRoomSession, _arg_2:String, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super("RSQE_QUEUE_STATUS", _arg_1, _arg_5, _arg_6);
            _name = _arg_2;
            _SafeStr_4017 = _arg_3;
            _SafeStr_4512 = new _SafeStr_24();
            _SafeStr_4495 = _arg_4;
        }

        public function get isActive():Boolean
        {
            return (_SafeStr_4495);
        }

        public function get queueSetName():String
        {
            return (_name);
        }

        public function get queueSetTarget():int
        {
            return (_SafeStr_4017);
        }

        public function get queueTypes():Array
        {
            return (_SafeStr_4512.getKeys());
        }

        public function getQueueSize(_arg_1:String):int
        {
            return (_SafeStr_4512.getValue(_arg_1));
        }

        public function addQueue(_arg_1:String, _arg_2:int):void
        {
            _SafeStr_4512.add(_arg_1, _arg_2);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4017 = "_-eB" (String#2049, DoABC#4)
// _SafeStr_4495 = "_-b12" (String#2547, DoABC#4)
// _SafeStr_4512 = "_-f17" (String#12593, DoABC#4)
// _SafeStr_8911 = "_-p1w" (String#39132, DoABC#4)
// _SafeStr_8912 = "_-yT" (String#34292, DoABC#4)
// _SafeStr_8913 = "_-wY" (String#34429, DoABC#4)
// _SafeStr_8914 = "_-WI" (String#31960, DoABC#4)


