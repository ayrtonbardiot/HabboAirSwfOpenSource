// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomPlaneVisibilityUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const _SafeStr_8727:String = "RORPVUM_WALL_VISIBILITY";
        public static const _SafeStr_8728:String = "RORPVUM_FLOOR_VISIBILITY";

        private var _SafeStr_4028:String = "";
        private var _SafeStr_4426:Boolean = false;

        public function RoomObjectRoomPlaneVisibilityUpdateMessage(_arg_1:String, _arg_2:Boolean)
        {
            super(null, null);
            _SafeStr_4028 = _arg_1;
            _SafeStr_4426 = _arg_2;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4426 = "_-c1l" (String#1501, DoABC#4)
// _SafeStr_8727 = "_-51G" (String#33448, DoABC#4)
// _SafeStr_8728 = "_-Xt" (String#31910, DoABC#4)


