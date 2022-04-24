// by nota

//com.sulake.habbo.navigator.mainview.GuestRoomListCtrl

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.navigator.RoomPopupCtrl;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.habbo.navigator.UserCountRenderer;
    import com.sulake.habbo.navigator.Util;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import _-M1k._SafeStr_994;
    import _-M1k._SafeStr_725;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;
    import com.sulake.core.window.events.*;
    import com.sulake.habbo.navigator.*;

    public class GuestRoomListCtrl implements IViewCtrl 
    {

        protected var _navigator:HabboNavigator;
        private var _content:_SafeStr_3133;
        private var _SafeStr_4162:IItemListWindow;
        private var _SafeStr_5957:RoomPopupCtrl;
        private var _SafeStr_4452:IScrollbarWindow;
        protected var _SafeStr_5195:UserCountRenderer;
        private var _SafeStr_5960:_SafeStr_3133;
        private var _SafeStr_5961:int;
        private var _SafeStr_5959:Boolean;
        private var _SafeStr_5958:int;
        private var _showRoomNumbers:Boolean;

        public function GuestRoomListCtrl(_arg_1:HabboNavigator, _arg_2:int, _arg_3:Boolean):void
        {
            _navigator = _arg_1;
            _SafeStr_5958 = _arg_2;
            _showRoomNumbers = _arg_3;
            _SafeStr_5957 = new RoomPopupCtrl(_navigator, 5, -5);
            _SafeStr_5195 = new UserCountRenderer(_navigator);
        }

        public function dispose():void
        {
            if (_SafeStr_5957)
            {
                _SafeStr_5957.dispose();
                _SafeStr_5957 = null;
            };
            if (_SafeStr_5195)
            {
                _SafeStr_5195.dispose();
                _SafeStr_5195 = null;
            };
        }

        public function set content(_arg_1:_SafeStr_3133):void
        {
            _content = _arg_1;
            _SafeStr_4162 = ((_content) ? IItemListWindow(_content.findChildByName("item_list")) : null);
            _SafeStr_4452 = ((_content) ? IScrollbarWindow(_content.findChildByName("scroller")) : null);
            if (((_arg_1 == null) && (_SafeStr_5957)))
            {
                _SafeStr_5957.closePopup();
            };
        }

        public function get content():_SafeStr_3133
        {
            return (_content);
        }

        public function refresh():void
        {
            var _local_4:int;
            var _local_2:Boolean;
            var _local_3:Array = getRooms();
            var _local_1:int = getVisibleEntryCount();
            _SafeStr_4162.autoArrangeItems = false;
            _local_4 = 0;
            while (true)
            {
                if (_local_4 < _local_3.length)
                {
                    refreshEntry(true, _local_4, _local_3[_local_4]);
                }
                else
                {
                    _local_2 = refreshEntry(false, _local_4, null);
                    if (_local_2) break;
                };
                _local_4++;
            };
            _SafeStr_4162.autoArrangeItems = true;
            if (((!(_SafeStr_4452 == null)) && (!(getVisibleEntryCount() == _local_1))))
            {
                _SafeStr_4452.scrollV = 0;
            };
            if (_content.findChildByName("no_rooms_found"))
            {
                _content.findChildByName("no_rooms_found").visible = (_local_3.length < 1);
            };
        }

        private function getVisibleEntryCount():int
        {
            var _local_2:int;
            var _local_1:int;
            _local_2 = 0;
            while (_local_2 < _SafeStr_4162.numListItems)
            {
                if (_SafeStr_4162.getListItemAt(_local_2).visible)
                {
                    _local_1++;
                };
                _local_2++;
            };
            return (_local_1);
        }

        protected function getListEntry(_arg_1:int):_SafeStr_3133
        {
            var _local_3:int;
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_navigator.getXmlWindow("grs_guest_room_details_phase_one"));
            _local_2.background = true;
            _local_2.addEventListener("WME_MOVE", onMouseMove);
            _local_2.addEventListener("WME_OVER", onMouseOver);
            _local_2.addEventListener("WME_OUT", onMouseOut);
            _local_2.addEventListener("WME_CLICK", onMouseClick);
            _local_2.setParamFlag(1, true);
            _local_2.setParamFlag(128, true);
            _local_2.color = getBgColor(_arg_1);
            _local_2.tags.push(_arg_1);
            if (_showRoomNumbers)
            {
                _local_3 = 20;
                _local_2.findChildByName("roomname").x = (_local_2.findChildByName("roomname").x + _local_3);
                _local_2.findChildByName("roomname").width = (_local_2.findChildByName("roomname").width - _local_3);
            };
            return (_local_2);
        }

        protected function getBgColor(_arg_1:int):uint
        {
            return (((_arg_1 % 2) != 0) ? 0xFFFFFFFF : 4292797682);
        }

        private function refreshEntry(_arg_1:Boolean, _arg_2:int, _arg_3:_SafeStr_1569):Boolean
        {
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4162.getListItemAt(_arg_2));
            var _local_5:Boolean;
            if (_local_4 == null)
            {
                if (!_arg_1)
                {
                    return (true);
                };
                _local_4 = getListEntry(_arg_2);
                _SafeStr_4162.addListItem(_local_4);
                _local_5 = true;
            };
            Util.hideChildren(_local_4);
            if (_arg_1)
            {
                refreshEntryDetails(_local_4, _arg_3);
                _local_4.visible = true;
                _local_4.height = 17;
            }
            else
            {
                _local_4.height = 0;
                _local_4.visible = false;
            };
            if (_local_5)
            {
                _local_4.width = (_local_4.width + _SafeStr_5958);
                MainViewCtrl.stretchNewEntryIfNeeded(this, _local_4);
            };
            return (false);
        }

        protected function refreshEntryDetails(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1569):void
        {
            _arg_1.visible = true;
            Util.hideChildren(_arg_1);
            refreshFavouriteIcon(_arg_1, _arg_2);
            var _local_3:String = ((((_arg_2.doorMode == 1) || (_arg_2.doorMode == 2)) || (_arg_2.doorMode == 3)) ? "group_base_icon" : "group_base_icon_no_doormode");
            _navigator.refreshButton(_arg_1, _local_3, (_arg_2.habboGroupId > 0), null, 0, "group_base_icon");
            _navigator.refreshButton(_arg_1, "home", isHome(_arg_2), null, 0);
            _navigator.refreshButton(_arg_1, "doormode_doorbell_small", (_arg_2.doorMode == 1), null, 0);
            _navigator.refreshButton(_arg_1, "doormode_password_small", (_arg_2.doorMode == 2), null, 0);
            _navigator.refreshButton(_arg_1, "doormode_invisible_small", (_arg_2.doorMode == 3), null, 0);
            if (_showRoomNumbers)
            {
                _arg_1.findChildByName("room_number").visible = true;
                _arg_1.findChildByName("room_number").caption = ((_arg_1.tags[0] + 2) + ".");
            };
            refreshRoomName(_arg_1, _arg_2);
            _SafeStr_5195.refreshUserCount(_arg_2.maxUserCount, _arg_1, _arg_2.userCount, "${navigator.usercounttooltip.users}", 308, 2);
            _arg_1.name = ((("guestroom_" + _arg_2.ownerName) + "_") + _arg_2.roomName);
        }

        private function refreshRoomName(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1569):void
        {
            var _local_4:ITextWindow = ITextWindow(_arg_1.getChildByName("roomname"));
            _local_4.visible = true;
            var _local_3:Boolean = (((_arg_1.findChildByName("home").visible) || (_arg_1.findChildByName("favourite").visible)) || (_arg_1.findChildByName("make_favourite").visible));
            Util.cutTextToWidth(_local_4, _arg_2.roomName, ((_local_3) ? (_local_4.width - 20) : _local_4.width));
        }

        protected function onMouseMove(_arg_1:_SafeStr_3116):void
        {
            this.checkFastHorizontalMove(_arg_1);
        }

        protected function onMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.target;
            if (((_SafeStr_5957.visible) && (_SafeStr_5959)))
            {
                return;
            };
            hilite(_SafeStr_3133(_local_3));
            var _local_2:int = _local_3.tags[0];
            var _local_4:_SafeStr_1569 = getRoomAt(_local_2);
            if (_local_4 == null)
            {
                return;
            };
            _SafeStr_5957.room = _local_4;
            _SafeStr_5957.showPopup(_local_3);
        }

        public function getRooms():Array
        {
            return (((((_navigator == null) || (_navigator.data == null)) || (_navigator.data.guestRoomSearchResults == null)) || (_navigator.data.guestRoomSearchResults.rooms == null)) ? [] : _navigator.data.guestRoomSearchResults.rooms);
        }

        private function getRoomAt(_arg_1:int):_SafeStr_1569
        {
            return (getRooms()[_arg_1]);
        }

        protected function onMouseOut(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            if (Util.containsMouse(_local_2))
            {
                return;
            };
            var _local_3:int = _local_2.tags[0];
            _local_2.color = getBgColor(_local_3);
            _SafeStr_5957.closePopup();
        }

        protected function onMouseClick(_arg_1:_SafeStr_3116):void
        {
            var _local_3:* = null;
            var _local_5:_SafeStr_3109 = _arg_1.target;
            var _local_4:int = _local_5.tags[0];
            var _local_2:_SafeStr_1569 = getRoomAt(_local_4);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.ownerName != _navigator.sessionData.userName)
            {
                if (_local_2.habboGroupId != 0)
                {
                    _navigator.goToPrivateRoom(_local_2.flatId);
                    return;
                };
                _local_3 = new Point((_arg_1 as WindowMouseEvent).stageX, (_arg_1 as WindowMouseEvent).stageY);
                switch (_local_2.doorMode)
                {
                    case 2:
                        _navigator.passwordInput.show(_local_2, _local_3);
                        return;
                    case 1:
                        _navigator.doorbell.show(_local_2, _local_3);
                        return;
                    default:
                };
            };
            beforeEnterRoom(_local_4);
            _navigator.goToRoom(_local_2.flatId, true, "", _local_4);
            _SafeStr_5957.hideInstantly();
        }

        public function beforeEnterRoom(_arg_1:int):void
        {
        }

        private function refreshFavouriteIcon(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1569):void
        {
            var _local_4:Boolean = _navigator.data.isRoomFavourite(_arg_2.flatId);
            var _local_3:Boolean = isHome(_arg_2);
            refreshRegion(_arg_1, "make_favourite", ((!(_local_4)) && (!(_local_3))), onAddFavouriteClick);
            refreshRegion(_arg_1, "favourite", ((_local_4) && (!(_local_3))), onRemoveFavouriteClick);
        }

        private function isHome(_arg_1:_SafeStr_1569):Boolean
        {
            return (_arg_1.flatId == _navigator.data.homeRoomId);
        }

        private function refreshRegion(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:Function):void
        {
            var _local_5:IRegionWindow = (_arg_1.findChildByName(_arg_2) as IRegionWindow);
            if (!_local_5)
            {
                return;
            };
            if (!_arg_3)
            {
                _local_5.visible = false;
                if (_local_5.hasEventListener("WME_CLICK"))
                {
                    _local_5.removeEventListener("WME_CLICK", _arg_4);
                };
            }
            else
            {
                _local_5.addEventListener("WME_CLICK", _arg_4);
                _local_5.visible = true;
                _navigator.refreshButton(_local_5, _arg_2, _arg_3, null, 0);
            };
        }

        private function onRemoveFavouriteClick(_arg_1:WindowMouseEvent):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.target;
            if (((_local_3 == null) || (_local_3.parent == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1569 = getRoomAt(_local_3.parent.tags[0]);
            if (_local_2 == null)
            {
                return;
            };
            _navigator.send(new _SafeStr_994(_local_2.flatId));
        }

        private function onAddFavouriteClick(_arg_1:WindowMouseEvent):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.target;
            if (((_local_3 == null) || (_local_3.parent == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1569 = getRoomAt(_local_3.parent.tags[0]);
            if (_local_2 == null)
            {
                return;
            };
            _navigator.send(new _SafeStr_725(_local_2.flatId));
        }

        private function hilite(_arg_1:_SafeStr_3133):void
        {
            var _local_2:int;
            if (((!(_SafeStr_5960 == null)) && (!(_SafeStr_5960.disposed))))
            {
                _local_2 = _SafeStr_5960.tags[0];
                _SafeStr_5960.color = getBgColor(_local_2);
            };
            _SafeStr_5960 = _arg_1;
            _arg_1.color = 4288861930;
        }

        private function checkFastHorizontalMove(_arg_1:_SafeStr_3116):void
        {
            var _local_3:WindowMouseEvent = WindowMouseEvent(_arg_1);
            var _local_2:int = Math.abs((_SafeStr_5961 - _local_3.stageX));
            _SafeStr_5961 = _local_3.stageX;
            _SafeStr_5959 = (_local_2 > 2);
        }

        public function get roomPopupCtrl():RoomPopupCtrl
        {
            return (_SafeStr_5957);
        }

        public function get navigator():HabboNavigator
        {
            return (_navigator);
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_4452 = "_-91k" (String#2815, DoABC#4)
// _SafeStr_5195 = "_-uW" (String#2551, DoABC#4)
// _SafeStr_5957 = "_-7f" (String#5007, DoABC#4)
// _SafeStr_5958 = "_-tj" (String#17993, DoABC#4)
// _SafeStr_5959 = "_-Y1D" (String#16452, DoABC#4)
// _SafeStr_5960 = "_-Us" (String#10279, DoABC#4)
// _SafeStr_5961 = "_-kj" (String#18223, DoABC#4)
// _SafeStr_725 = "_-11Z" (String#10180, DoABC#4)
// _SafeStr_994 = "_-K4" (String#9037, DoABC#4)


