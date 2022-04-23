// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectRoomPlanePropertyUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomPlanePropertyUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const WALL_THICKNESS:String = "RORPPUM_WALL_THICKNESS";
        public static const FLOOR_THICKNESS:String = "RORPVUM_FLOOR_THICKNESS";

        private var _SafeStr_4028:String = "";
        private var _SafeStr_4525:Number = 0;

        public function RoomObjectRoomPlanePropertyUpdateMessage(_arg_1:String, _arg_2:Number)
        {
            super(null, null);
            _SafeStr_4028 = _arg_1;
            _SafeStr_4525 = _arg_2;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get value():Number
        {
            return (_SafeStr_4525);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)


