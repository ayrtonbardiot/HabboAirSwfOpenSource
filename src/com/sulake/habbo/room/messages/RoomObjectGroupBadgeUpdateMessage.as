// by nota

//com.sulake.habbo.room.messages.RoomObjectGroupBadgeUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectGroupBadgeUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const BADGE_LOADED:String = "ROGBUM_BADGE_LOADED";

        private var _SafeStr_4615:String;
        private var _assetName:String;

        public function RoomObjectGroupBadgeUpdateMessage(_arg_1:String, _arg_2:String)
        {
            super(null, null);
            _SafeStr_4615 = _arg_1;
            _assetName = _arg_2;
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }

        public function get assetName():String
        {
            return (_assetName);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4615 = "_-91W" (String#2170, DoABC#4)


