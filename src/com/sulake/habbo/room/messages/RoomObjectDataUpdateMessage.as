// by nota

//com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.IStuffData;

    public class RoomObjectDataUpdateMessage extends RoomObjectUpdateMessage 
    {

        private var _SafeStr_3734:int;
        private var _SafeStr_3740:IStuffData = null;
        private var _SafeStr_4268:Number = NaN;

        public function RoomObjectDataUpdateMessage(_arg_1:int, _arg_2:IStuffData, _arg_3:Number=NaN)
        {
            super(null, null);
            _SafeStr_3734 = _arg_1;
            _SafeStr_3740 = _arg_2;
            _SafeStr_4268 = _arg_3;
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get data():IStuffData
        {
            return (_SafeStr_3740);
        }

        public function get extra():Number
        {
            return (_SafeStr_4268);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4268 = "_-8L" (String#3669, DoABC#4)


