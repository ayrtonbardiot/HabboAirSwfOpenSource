// by nota

//com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator

package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import _-M1k._SafeStr_523;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.*;

    public class MyRoomsTabPageDecorator implements ITabPageDecorator 
    {

        private const SUB_ITEMS:Array = [[5, "navigator.navisel.myrooms"], [4, "navigator.navisel.wherearemyfriends"], [3, "navigator.navisel.myfriendsrooms"], [18, "navigator.navisel.roomswithrights"], [19, "navigator.navisel.mygroups"], [6, "navigator.navisel.myfavourites"], [7, "navigator.navisel.visitedrooms"], [23, ""]];

        private var _navigator:HabboNavigator;
        private var _SafeStr_5447:_SafeStr_3269;

        public function MyRoomsTabPageDecorator(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
        }

        public function refreshCustomContent(_arg_1:_SafeStr_3133):void
        {
            var _local_2:String = "me_header";
            var _local_3:_SafeStr_3133 = (_arg_1.getChildByName(_local_2) as _SafeStr_3133);
            if (((_SafeStr_5447 == null) || (_SafeStr_5447.disposed)))
            {
                _SafeStr_5447 = _SafeStr_3269(_local_3.findChildByName("meSubNavi"));
                prepareSubNavi();
                _SafeStr_5447.addEventListener("WE_SELECTED", onFilterSelected);
            };
            _local_3.visible = true;
        }

        public function tabSelected():void
        {
            if (((!(_SafeStr_5447 == null)) && (!(_SafeStr_5447.disposed))))
            {
                _SafeStr_5447.removeEventListener("WE_SELECTED", onFilterSelected);
                _SafeStr_5447.selection = 0;
                _SafeStr_5447.addEventListener("WE_SELECTED", onFilterSelected);
            };
        }

        public function refreshFooter(_arg_1:_SafeStr_3133):void
        {
            var _local_2:_SafeStr_3133 = (_arg_1.getChildByName("me_footer") as _SafeStr_3133);
            var _local_3:_SafeStr_3109 = _local_2.findChildByName("create_room_but");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onCreateRoomClick);
            };
            _navigator.refreshButton(_local_2, "create_room", true, null, 0);
            _local_2.visible = true;
        }

        public function navigatorOpenedWhileInTab():void
        {
            startSearch();
        }

        private function onCreateRoomClick(_arg_1:_SafeStr_3116):void
        {
            _navigator.send(new _SafeStr_523());
        }

        private function prepareSubNavi():void
        {
            if (((_SafeStr_5447 == null) || (_SafeStr_5447.disposed)))
            {
                return;
            };
            var _local_2:Array = [];
            for each (var _local_1:Array in SUB_ITEMS)
            {
                _local_2.push(_navigator.getText(_local_1[1]));
            };
            _SafeStr_5447.populate(_local_2);
            _SafeStr_5447.selection = 0;
        }

        private function onFilterSelected(_arg_1:_SafeStr_3116):void
        {
            startSearch();
            var _local_2:_SafeStr_3109 = _arg_1.target;
            if ((_local_2 is _SafeStr_3269))
            {
                _navigator.trackNavigationDataPoint(_SafeStr_3269(_local_2).enumerateSelection()[_SafeStr_3269(_local_2).selection], "category.view");
            };
        }

        private function startSearch():void
        {
            var _local_1:int = (((_SafeStr_5447 == null) || (_SafeStr_5447.disposed)) ? 0 : _SafeStr_5447.selection);
            _navigator.mainViewCtrl.startSearch(3, getSearchTypeForIndex(_local_1));
        }

        private function getSearchTypeForIndex(_arg_1:int):int
        {
            if (_arg_1 <= SUB_ITEMS.length)
            {
                return (SUB_ITEMS[_arg_1][0]);
            };
            return (SUB_ITEMS[0][0]);
        }

        public function get filterCategory():String
        {
            return (((_SafeStr_5447) && (!(_SafeStr_5447.disposed))) ? _SafeStr_5447.enumerateSelection()[_SafeStr_5447.selection] : null);
        }

        public function setSubSelection(_arg_1:int):void
        {
            var _local_3:int;
            var _local_2:* = null;
            if (((!(_SafeStr_5447)) || (_SafeStr_5447.disposed)))
            {
                return;
            };
            var _local_4:int = _SafeStr_5447.numMenuItems;
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _local_2 = SUB_ITEMS[_local_3];
                if (_local_2[0] == _arg_1)
                {
                    _SafeStr_5447.selection = _local_3;
                    return;
                };
                _local_3++;
            };
            _SafeStr_5447.selection = 0;
        }

        public function processSearchParam(_arg_1:String):String
        {
            return (_arg_1);
        }


    }
}//package com.sulake.habbo.navigator.mainview.tabpagedecorators

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_523 = "_-21C" (String#20318, DoABC#4)
// _SafeStr_5447 = "_-62" (String#1087, DoABC#4)


