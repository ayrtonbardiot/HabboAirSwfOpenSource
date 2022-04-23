// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomEngineRoomColorEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineRoomColorEvent extends RoomEngineEvent 
    {

        public static const ROOM_COLOR:String = "REE_ROOM_COLOR";

        private var _color:uint;
        private var _SafeStr_4485:uint;
        private var _SafeStr_4486:Boolean;

        public function RoomEngineRoomColorEvent(_arg_1:int, _arg_2:uint, _arg_3:uint, _arg_4:Boolean, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super("REE_ROOM_COLOR", _arg_1, _arg_5, _arg_6);
            _color = _arg_2;
            _SafeStr_4485 = _arg_3;
            _SafeStr_4486 = _arg_4;
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get brightness():uint
        {
            return (_SafeStr_4485);
        }

        public function get bgOnly():Boolean
        {
            return (_SafeStr_4486);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4485 = "_-I1c" (String#18914, DoABC#4)
// _SafeStr_4486 = "_-K1" (String#6454, DoABC#4)


