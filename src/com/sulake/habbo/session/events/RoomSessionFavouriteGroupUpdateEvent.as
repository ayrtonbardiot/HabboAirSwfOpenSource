// by nota

//com.sulake.habbo.session.events.RoomSessionFavouriteGroupUpdateEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionFavouriteGroupUpdateEvent extends RoomSessionEvent 
    {

        public static const _SafeStr_8910:String = "rsfgue_favourite_group_update";

        private var _SafeStr_5536:int;
        private var _SafeStr_6204:int;
        private var _habboGroupName:String;
        private var _status:int;

        public function RoomSessionFavouriteGroupUpdateEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super("rsfgue_favourite_group_update", _arg_1, _arg_6, _arg_7);
            _SafeStr_5536 = _arg_2;
            _SafeStr_6204 = _arg_3;
            _habboGroupName = _arg_5;
            _status = _arg_4;
        }

        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get habboGroupId():int
        {
            return (_SafeStr_6204);
        }

        public function get habboGroupName():String
        {
            return (_habboGroupName);
        }

        public function get status():int
        {
            return (_status);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_5536 = "_-517" (String#2777, DoABC#4)
// _SafeStr_6204 = "_-Gj" (String#22563, DoABC#4)
// _SafeStr_8910 = "_-01z" (String#35286, DoABC#4)


