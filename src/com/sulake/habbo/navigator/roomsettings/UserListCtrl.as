// by nota

//com.sulake.habbo.navigator.roomsettings.UserListCtrl

package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.navigator._SafeStr_1697;
    import _-n1H._SafeStr_1627;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.utils.ExtendedProfileIcon;
    import _-p1Y._SafeStr_561;
    import _-p1Y._SafeStr_517;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-XO._SafeStr_313;

    public class UserListCtrl implements _SafeStr_13 
    {

        private static const DISPLAY_LIMIT:int = 200;

        protected var _navigator:_SafeStr_1697;
        private var _SafeStr_6278:Boolean;
        protected var _SafeStr_6279:int;

        public function UserListCtrl(_arg_1:_SafeStr_1697, _arg_2:Boolean)
        {
            _navigator = _arg_1;
            _SafeStr_6278 = _arg_2;
        }

        public function dispose():void
        {
            _navigator = null;
        }

        public function get disposed():Boolean
        {
            return (_navigator == null);
        }

        public function refresh(_arg_1:IItemListWindow, _arg_2:Array, _arg_3:String, _arg_4:int):void
        {
            var _local_6:int;
            var _local_5:Boolean;
            var _local_8:Array = [];
            for each (var _local_7:_SafeStr_1627 in _arg_2)
            {
                if (((_arg_3 == "") || (_local_7.userName.toLowerCase().indexOf(_arg_3) > -1)))
                {
                    _local_8.push(_local_7);
                };
                if (_local_8.length >= 200) break;
            };
            _arg_1.autoArrangeItems = false;
            _local_6 = 0;
            while (true)
            {
                _local_5 = refreshEntry(_arg_1, _local_6, _local_8[_local_6], _arg_4);
                if (_local_5) break;
                _local_6++;
            };
            _arg_1.autoArrangeItems = true;
            _arg_1.invalidate();
            _SafeStr_6279 = _local_8.length;
        }

        private function getListEntry(_arg_1:int):_SafeStr_3133
        {
            var _local_2:_SafeStr_3133 = getRowView();
            var _local_3:IRegionWindow = IRegionWindow(_local_2.findChildByName("bg_region"));
            _local_3.addEventListener("WME_CLICK", onBgMouseClick);
            _local_3.addEventListener("WME_OVER", onBgMouseOver);
            _local_3.addEventListener("WME_OUT", onBgMouseOut);
            ExtendedProfileIcon.setup(_local_2, onUserInfoMouseClick);
            _local_2.id = _arg_1;
            return (_local_2);
        }

        protected function getRowView():_SafeStr_3133
        {
            return (_SafeStr_3133(_navigator.getXmlWindow(((_SafeStr_6278) ? "ros_friend" : "ros_flat_controller"))));
        }

        protected function getBgColor(_arg_1:int, _arg_2:Boolean):uint
        {
            return ((_arg_2) ? 4290173439 : (((_arg_1 % 2) != 0) ? 0xFFFFFFFF : 4293519841));
        }

        private function refreshEntry(_arg_1:IItemListWindow, _arg_2:int, _arg_3:_SafeStr_1627, _arg_4:int):Boolean
        {
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_arg_1.getListItemAt(_arg_2));
            if (_local_5 == null)
            {
                if (_arg_3 == null)
                {
                    return (true);
                };
                _local_5 = getListEntry(_arg_2);
                _arg_1.addListItem(_local_5);
            };
            if (_arg_3 != null)
            {
                _local_5.color = this.getBgColor(_arg_2, (_arg_3.userId == _arg_4));
                refreshEntryDetails(_local_5, _arg_3);
                _local_5.visible = true;
                _local_5.height = 20;
            }
            else
            {
                _local_5.height = 0;
                _local_5.visible = false;
            };
            return (false);
        }

        private function refreshEntryDetails(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1627):void
        {
            _arg_1.findChildByName("user_name_txt").caption = _arg_2.userName;
            var _local_3:IRegionWindow = IRegionWindow(_arg_1.findChildByName("bg_region"));
            _local_3.id = _arg_2.userId;
            _arg_1.findChildByName("user_info_region").id = _arg_2.userId;
            ExtendedProfileIcon.setUserInfoState(false, _arg_1);
        }

        protected function onBgMouseClick(_arg_1:_SafeStr_3116):void
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.target);
            if (_SafeStr_6278)
            {
                _navigator.send(new _SafeStr_561(_local_3.id));
            }
            else
            {
                _local_2 = [];
                _local_2.push(_local_3.id);
                _navigator.send(new _SafeStr_517(_local_2));
            };
        }

        private function onBgMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.target.parent);
            _local_3.color = getBgColor(-1, true);
            var _local_2:_SafeStr_3109 = _local_3.findChildByName("arrow_icon");
            if (_local_2 != null)
            {
                _local_2.visible = true;
            };
        }

        private function onBgMouseOut(_arg_1:_SafeStr_3116):void
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.target.parent);
            _local_3.color = getBgColor(_local_3.id, false);
            var _local_2:_SafeStr_3109 = _local_3.findChildByName("arrow_icon");
            if (_local_2 != null)
            {
                _local_2.visible = false;
            };
        }

        public function get userCount():int
        {
            return (_SafeStr_6279);
        }

        private function onUserInfoMouseClick(_arg_1:_SafeStr_3116):void
        {
            _navigator.trackGoogle("extendedProfile", "navigator_roomSettingsUsersList");
            _navigator.send(new _SafeStr_313(_arg_1.target.id));
        }


    }
}//package com.sulake.habbo.navigator.roomsettings

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1627 = "_-k1s" (String#15391, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_517 = "_-12l" (String#13845, DoABC#4)
// _SafeStr_561 = "_-Li" (String#18948, DoABC#4)
// _SafeStr_6278 = "_-UM" (String#13908, DoABC#4)
// _SafeStr_6279 = "_-tN" (String#5249, DoABC#4)


