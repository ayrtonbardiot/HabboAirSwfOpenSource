// by nota

//com.sulake.habbo.navigator.mainview.PromotedRoomsGuestRoomListCtrl

package com.sulake.habbo.navigator.mainview
{
    import _-Ja._SafeStr_1678;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.navigator.domain.RoomSessionTags;

    public class PromotedRoomsGuestRoomListCtrl extends GuestRoomListCtrl 
    {

        private var _SafeStr_4158:_SafeStr_1678;

        public function PromotedRoomsGuestRoomListCtrl(_arg_1:HabboNavigator)
        {
            super(_arg_1, -6, false);
        }

        public function set category(_arg_1:_SafeStr_1678):void
        {
            _SafeStr_4158 = _arg_1;
        }

        override public function getRooms():Array
        {
            return (_SafeStr_4158.rooms);
        }

        override public function beforeEnterRoom(_arg_1:int):void
        {
            navigator.data.roomSessionTags = new RoomSessionTags(_SafeStr_4158.code, ("" + (_arg_1 + 2)));
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_1678 = "_-2l" (String#8477, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)


