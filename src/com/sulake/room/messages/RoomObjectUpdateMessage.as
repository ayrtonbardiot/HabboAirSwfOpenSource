// by nota

//com.sulake.room.messages.RoomObjectUpdateMessage

package com.sulake.room.messages
{
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectUpdateMessage 
    {

        protected var _SafeStr_3985:IVector3d;
        protected var _SafeStr_4049:IVector3d;

        public function RoomObjectUpdateMessage(_arg_1:IVector3d, _arg_2:IVector3d)
        {
            _SafeStr_3985 = _arg_1;
            _SafeStr_4049 = _arg_2;
        }

        public function get loc():IVector3d
        {
            return (_SafeStr_3985);
        }

        public function get dir():IVector3d
        {
            return (_SafeStr_4049);
        }


    }
}//package com.sulake.room.messages

// _SafeStr_3985 = "_-Bg" (String#992, DoABC#4)
// _SafeStr_4049 = "_-W12" (String#2181, DoABC#4)


