// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _isAdmin:Boolean = false;
        private var _SafeStr_4236:String;

        public function RoomObjectAvatarFlatControlUpdateMessage(_arg_1:String)
        {
            _SafeStr_4236 = _arg_1;
        }

        public function get isAdmin():Boolean
        {
            return (_isAdmin);
        }

        public function get rawData():String
        {
            return (_SafeStr_4236);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4236 = "_-11P" (String#20707, DoABC#4)


