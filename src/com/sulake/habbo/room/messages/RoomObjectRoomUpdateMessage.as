// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const ROOM_WALL_UPDATE:String = "RORUM_ROOM_WALL_UPDATE";
        public static const ROOM_FLOOR_UPDATE:String = "RORUM_ROOM_FLOOR_UPDATE";
        public static const ROOM_LANDSCAPE_UPDATE:String = "RORUM_ROOM_LANDSCAPE_UPDATE";

        private var _SafeStr_4028:String = "";
        private var _SafeStr_4525:String = "";

        public function RoomObjectRoomUpdateMessage(_arg_1:String, _arg_2:String)
        {
            super(null, null);
            _SafeStr_4028 = _arg_1;
            _SafeStr_4525 = _arg_2;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get value():String
        {
            return (_SafeStr_4525);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)


