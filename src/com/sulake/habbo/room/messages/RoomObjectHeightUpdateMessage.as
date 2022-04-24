// by nota

//com.sulake.habbo.room.messages.RoomObjectHeightUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectHeightUpdateMessage extends RoomObjectUpdateMessage 
    {

        private var _SafeStr_4234:Number;

        public function RoomObjectHeightUpdateMessage(_arg_1:IVector3d, _arg_2:IVector3d, _arg_3:Number)
        {
            super(_arg_1, _arg_2);
            _SafeStr_4234 = _arg_3;
        }

        public function get height():Number
        {
            return (_SafeStr_4234);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)


