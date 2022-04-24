// by nota

//com.sulake.habbo.room.messages.RoomObjectVisibilityUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectVisibilityUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const _SafeStr_8729:String = "ROVUM_ENABLED";
        public static const _SafeStr_8730:String = "ROVUM_DISABLED";

        private var _SafeStr_4028:String;

        public function RoomObjectVisibilityUpdateMessage(_arg_1:String)
        {
            super(null, null);
            _SafeStr_4028 = _arg_1;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_8729 = "_-P12" (String#28594, DoABC#4)
// _SafeStr_8730 = "_-02f" (String#35290, DoABC#4)


