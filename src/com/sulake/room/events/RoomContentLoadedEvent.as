// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.events.RoomContentLoadedEvent

package com.sulake.room.events
{
    import flash.events.Event;

    public class RoomContentLoadedEvent extends Event 
    {

        public static const CONTENT_LOAD_SUCCESS:String = "RCLE_SUCCESS";
        public static const CONTENT_LOAD_FAILURE:String = "RCLE_FAILURE";
        public static const CONTENT_LOAD_CANCEL:String = "RCLE_CANCEL";

        private var _SafeStr_4320:String;

        public function RoomContentLoadedEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_4320 = _arg_2;
        }

        public function get contentType():String
        {
            return (_SafeStr_4320);
        }


    }
}//package com.sulake.room.events

// _SafeStr_4320 = "_-i17" (String#10028, DoABC#4)


