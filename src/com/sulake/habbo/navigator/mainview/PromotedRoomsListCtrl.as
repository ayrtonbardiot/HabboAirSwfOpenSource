// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.mainview.PromotedRoomsListCtrl

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.navigator.UserCountRenderer;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window._SafeStr_3109;
    import _-Ja._SafeStr_1678;
    import com.sulake.habbo.navigator.domain.RoomSessionTags;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-XO._SafeStr_313;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.habbo.navigator.*;

    public class PromotedRoomsListCtrl implements _SafeStr_13 
    {

        private static const CATEGORY_SPACING:int = 5;

        private var _navigator:HabboNavigator;
        private var _SafeStr_5195:UserCountRenderer;
        private var _SafeStr_6900:PromotedRoomsGuestRoomListCtrl;

        public function PromotedRoomsListCtrl(_arg_1:HabboNavigator):void
        {
            _navigator = _arg_1;
            _SafeStr_5195 = new UserCountRenderer(_navigator);
            _SafeStr_6900 = new PromotedRoomsGuestRoomListCtrl(_navigator);
        }

        public function dispose():void
        {
            _navigator = null;
            if (_SafeStr_5195)
            {
                _SafeStr_5195.dispose();
                _SafeStr_5195 = null;
            };
            if (_SafeStr_6900)
            {
                _SafeStr_6900.dispose();
                _SafeStr_6900 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_navigator == null);
        }

        private function getCategoryContainer(_arg_1:_SafeStr_3133, _arg_2:int):_SafeStr_3133
        {
            return (_SafeStr_3133(_arg_1.getChildByID(_arg_2)));
        }

        public function refresh(_arg_1:_SafeStr_3133, _arg_2:Array):void
        {
            var _local_4:int;
            var _local_5:* = null;
            Util.hideChildren(_arg_1);
            var _local_3:int;
            _local_4 = 0;
            while (_local_4 < _arg_2.length)
            {
                _local_5 = getCategoryContainer(_arg_1, _local_4);
                if (_local_5 == null)
                {
                    _local_5 = createEntry(_local_4);
                    _local_5.id = _local_4;
                    _arg_1.addChild(_local_5);
                };
                refreshEntry(_local_5, _arg_2[_local_4]);
                _local_5.y = _local_3;
                _local_3 = (_local_3 + (_local_5.height + 5));
                _local_5.visible = true;
                _local_4++;
            };
            _arg_1.height = ((Util.getLowestPoint(_arg_1) > 0) ? (Util.getLowestPoint(_arg_1) + 5) : 0);
        }

        public function createEntry(_arg_1:int):_SafeStr_3133
        {
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_navigator.getXmlWindow("grs_promoted_room_category"));
            setProcedureAndId(_local_2, _arg_1, "enter_room_button", onEnterRoomButton);
            setProcedureAndId(_local_2, _arg_1, "leader_region", onLeaderRegion);
            setProcedureAndId(_local_2, _arg_1, "toggle_open_region", onToggleOpenRegion);
            _navigator.refreshButton(_local_2, "navi_room_icon", true, null, 0);
            return (_local_2);
        }

        private function getLocationAfter(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:int=3):int
        {
            var _local_4:_SafeStr_3109 = _arg_1.findChildByName(_arg_2);
            return ((_local_4.x + _local_4.width) + _arg_3);
        }

        private function setProcedureAndId(_arg_1:_SafeStr_3133, _arg_2:int, _arg_3:String, _arg_4:Function):void
        {
            _arg_1.findChildByName(_arg_3).procedure = _arg_4;
            _arg_1.findChildByName(_arg_3).id = _arg_2;
        }

        public function refreshEntry(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1678):void
        {
            var _local_4:String = _navigator.getText(("promotedroomcategory." + _arg_2.code));
            _arg_1.findChildByName("category_name_txt").caption = _local_4;
            _arg_1.findChildByName("category_header").width = (_arg_1.findChildByName("category_name_txt").width + 13);
            _navigator.registerParameter("navigator.promotedrooms.hidetopten", "category", _local_4);
            _navigator.registerParameter("navigator.promotedrooms.viewtopten", "category", _local_4);
            _arg_1.findChildByName("open_txt").caption = _navigator.getText("navigator.promotedrooms.viewtopten");
            _arg_1.findChildByName("close_txt").caption = _navigator.getText("navigator.promotedrooms.hidetopten");
            _arg_1.findChildByName("room_name_txt").caption = _arg_2.bestRoom.roomName;
            var _local_3:_SafeStr_3109 = _arg_1.findChildByName("leader_name_txt");
            _local_3.caption = ((_arg_2.bestRoom.showOwner) ? _arg_2.bestRoom.ownerName : "");
            _local_3.x = getLocationAfter(_arg_1, "leader_name_caption_txt", 0);
            _arg_1.findChildByName("arrow_down_icon").visible = _arg_2.open;
            _arg_1.findChildByName("arrow_right_icon").visible = (!(_arg_2.open));
            _arg_1.findChildByName("close_txt").visible = _arg_2.open;
            _arg_1.findChildByName("open_txt").visible = (!(_arg_2.open));
            _arg_1.findChildByName("arrow_down_icon").x = getLocationAfter(_arg_1, "close_txt");
            _arg_1.findChildByName("arrow_right_icon").x = getLocationAfter(_arg_1, "open_txt");
            _SafeStr_5195.refreshUserCount(_arg_2.bestRoom.maxUserCount, _SafeStr_3133(_arg_1.findChildByName("enter_room_button")), _arg_2.bestRoom.userCount, "${navigator.usercounttooltip.users}", 222, 35);
            refreshAvatarImage(_arg_1, _arg_2);
            _arg_1.findChildByName("item_list").visible = _arg_2.open;
            if (_arg_2.open)
            {
                _arg_1.findChildByName("item_list").height = (_arg_2.rooms.length * 17);
                _SafeStr_6900.content = _arg_1;
                _SafeStr_6900.category = _arg_2;
                _SafeStr_6900.refresh();
            };
            _arg_1.height = ((_arg_2.open) ? (Util.getLowestPoint(_arg_1) + 3) : 90);
        }

        private function onEnterRoomButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = findCategory(_arg_2);
                _navigator.data.roomSessionTags = new RoomSessionTags(_local_3.code, "1");
                _navigator.goToPrivateRoom(_local_3.bestRoom.flatId);
                _navigator.closeNavigator();
            };
        }

        private function onLeaderRegion(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = findCategory(_arg_2);
                _navigator.trackGoogle("extendedProfile", "navigator_promotedRoom");
                _navigator.send(new _SafeStr_313(_local_3.bestRoom.ownerId));
            };
        }

        private function onToggleOpenRegion(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:int;
            var _local_5:* = null;
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                while (_local_4 < _navigator.data.promotedRooms.entries.length)
                {
                    _local_5 = _navigator.data.promotedRooms.entries[_local_4];
                    if (_arg_2.id != _local_4)
                    {
                        _local_5.open = false;
                    };
                    _local_4++;
                };
                _local_3 = findCategory(_arg_2);
                _local_3.toggleOpen();
                _navigator.mainViewCtrl.refresh();
            };
        }

        private function findCategory(_arg_1:_SafeStr_3109):_SafeStr_1678
        {
            return (_navigator.data.promotedRooms.entries[_arg_1.id]);
        }

        private function refreshAvatarImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1678):void
        {
            var _local_3:_SafeStr_3199 = _SafeStr_3199(_arg_1.findChildByName("avatar_image_widget"));
            var _local_4:_SafeStr_3289 = _SafeStr_3289(_local_3.widget);
            _local_4.figure = _arg_2.leaderFigure;
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1678 = "_-2l" (String#8477, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_5195 = "_-uW" (String#2551, DoABC#4)
// _SafeStr_6900 = "_-sl" (String#7435, DoABC#4)


