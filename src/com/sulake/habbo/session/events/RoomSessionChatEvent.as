// by nota

//com.sulake.habbo.session.events.RoomSessionChatEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionChatEvent extends RoomSessionEvent 
    {

        public static const ROOM_SESSION_CHAT_EVENT:String = "RSCE_CHAT_EVENT";
        public static const ROOM_SESSION_FLOODCONTROL_EVENT:String = "RSCE_FLOOD_EVENT";
        public static const CHAT_TYPE_SPEAK:int = 0;
        public static const CHAT_TYPE_WHISPER:int = 1;
        public static const CHAT_TYPE_SHOUT:int = 2;
        public static const CHAT_TYPE_RESPECT:int = 3;
        public static const CHAT_TYPE_PETRESPECT:int = 4;
        public static const CHAT_TYPE_HAND_ITEM_RECEIVED:int = 5;
        public static const CHAT_TYPE_PETTREAT:int = 6;
        public static const CHAT_TYPE_PETREVIVE:int = 7;
        public static const CHAT_TYPE_PET_REBREED_FERTILIZE:int = 8;
        public static const CHAT_TYPE_PET_SPEED_FERTILIZE:int = 9;
        public static const CHAT_TYPE_MUTE_REMAINING:int = 10;

        private var _SafeStr_4128:int = 0;
        private var _text:String = "";
        private var _SafeStr_4129:int = 0;
        private var _SafeStr_4130:Array;
        private var _SafeStr_4131:int;
        private var _style:int;

        public function RoomSessionChatEvent(_arg_1:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:String, _arg_5:int=0, _arg_6:int=0, _arg_7:Array=null, _arg_8:int=-1)
        {
            super(_arg_1, _arg_2, false, false);
            _SafeStr_4128 = _arg_3;
            _text = _arg_4;
            _SafeStr_4129 = _arg_5;
            _SafeStr_4130 = _arg_7;
            _SafeStr_4131 = _arg_8;
            _style = _arg_6;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get chatType():int
        {
            return (_SafeStr_4129);
        }

        public function get links():Array
        {
            return (_SafeStr_4130);
        }

        public function get extraParam():int
        {
            return (_SafeStr_4131);
        }

        public function get style():int
        {
            return (_style);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4129 = "_-c1k" (String#2784, DoABC#4)
// _SafeStr_4130 = "_-q1K" (String#6080, DoABC#4)
// _SafeStr_4131 = "_-p1c" (String#2883, DoABC#4)


