// by nota

//com.sulake.habbo.room.messages.RoomObjectRoomFloorHoleUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomFloorHoleUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const ADD_HOLE:String = "RORPFHUM_ADD";
        public static const REMOVE_HOLE:String = "RORPFHUM_REMOVE";

        private var _SafeStr_4028:String = "";
        private var _SafeStr_3820:int;
        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;
        private var _width:int;
        private var _SafeStr_4234:int;

        public function RoomObjectRoomFloorHoleUpdateMessage(_arg_1:String, _arg_2:int, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0)
        {
            super(null, null);
            _SafeStr_4028 = _arg_1;
            _SafeStr_3820 = _arg_2;
            _SafeStr_4050 = _arg_3;
            _SafeStr_4051 = _arg_4;
            _width = _arg_5;
            _SafeStr_4234 = _arg_6;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function get width():int
        {
            return (_width);
        }

        public function get height():int
        {
            return (_SafeStr_4234);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)


