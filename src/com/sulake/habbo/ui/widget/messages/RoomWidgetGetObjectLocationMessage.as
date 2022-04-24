// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetGetObjectLocationMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetGetObjectLocationMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9056:String = "RWGOI_MESSAGE_GET_OBJECT_LOCATION";
        public static const _SafeStr_9057:String = "RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION";

        private var _SafeStr_4157:int;
        private var _SafeStr_4652:int;

        public function RoomWidgetGetObjectLocationMessage(_arg_1:String, _arg_2:int, _arg_3:int)
        {
            super(_arg_1);
            _SafeStr_4157 = _arg_2;
            _SafeStr_4652 = _arg_3;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get objectType():int
        {
            return (_SafeStr_4652);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4652 = "_-61C" (String#3402, DoABC#4)
// _SafeStr_9056 = "_-qc" (String#31658, DoABC#4)
// _SafeStr_9057 = "_-3s" (String#38464, DoABC#4)


