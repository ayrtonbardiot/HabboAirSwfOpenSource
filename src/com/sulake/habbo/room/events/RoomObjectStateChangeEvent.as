// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomObjectStateChangeEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectStateChangeEvent extends RoomObjectEvent 
    {

        public static const ROOM_OBJECT_STATE_CHANGE:String = "ROSCE_STATE_CHANGE";
        public static const ROOM_OBJECT_STATE_RANDOM:String = "ROSCE_STATE_RANDOM";

        private var _SafeStr_4428:int = 0;

        public function RoomObjectStateChangeEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:int=0, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_4, _arg_5);
            _SafeStr_4428 = _arg_3;
        }

        public function get param():int
        {
            return (_SafeStr_4428);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4428 = "_-ZC" (String#1519, DoABC#4)


