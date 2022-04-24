// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarExpressionUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarExpressionUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4790:int = -1;

        public function RoomObjectAvatarExpressionUpdateMessage(_arg_1:int=-1)
        {
            _SafeStr_4790 = _arg_1;
        }

        public function get expressionType():int
        {
            return (_SafeStr_4790);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4790 = "_-52" (String#7226, DoABC#4)


