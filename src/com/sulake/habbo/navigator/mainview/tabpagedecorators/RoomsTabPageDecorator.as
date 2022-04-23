// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator

package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window._SafeStr_3133;
    import _-Ja._SafeStr_1629;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.*;

    public class RoomsTabPageDecorator implements ITabPageDecorator 
    {

        private var _navigator:HabboNavigator;
        private var _SafeStr_5447:_SafeStr_3269;
        private var _SafeStr_5448:Boolean = false;

        public function RoomsTabPageDecorator(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
        }

        public function refreshCustomContent(_arg_1:_SafeStr_3133):void
        {
            var _local_2:String = "rooms_header";
            var _local_3:_SafeStr_3133 = (_arg_1.getChildByName(_local_2) as _SafeStr_3133);
            if (((_SafeStr_5447 == null) || (_SafeStr_5447.disposed)))
            {
                _SafeStr_5447 = _SafeStr_3269(_local_3.findChildByName("roomCtgFilter"));
                prepareRoomCategories();
                _SafeStr_5447.addEventListener("WE_SELECTED", onFilterSelected);
            };
            _local_3.visible = true;
        }

        public function prepareRoomCategories():void
        {
            if (((_SafeStr_5447 == null) || (_SafeStr_5447.disposed)))
            {
                return;
            };
            var _local_1:Array = [_navigator.getText("navigator.navisel.popularrooms"), _navigator.getText("navigator.navisel.highestscore")];
            _SafeStr_5448 = _navigator.context.configuration.getBoolean("navigator.2014.personalized.navigator");
            if (_SafeStr_5448)
            {
                _local_1.push(_navigator.getText("navigator.navisel.recommendedrooms"));
            };
            for each (var _local_2:_SafeStr_1629 in _navigator.data.visibleCategories)
            {
                _local_1.push(_local_2.nodeName);
            };
            _SafeStr_5447.populate(_local_1);
            _SafeStr_5447.selection = defaultSelection;
        }

        private function get defaultSelection():int
        {
            return ((_SafeStr_5448) ? 2 : 0);
        }

        public function tabSelected():void
        {
            if (((!(_SafeStr_5447 == null)) && (!(_SafeStr_5447.disposed))))
            {
                _SafeStr_5447.removeEventListener("WE_SELECTED", onFilterSelected);
                _SafeStr_5447.selection = defaultSelection;
                _SafeStr_5447.addEventListener("WE_SELECTED", onFilterSelected);
            };
        }

        public function refreshFooter(_arg_1:_SafeStr_3133):void
        {
            _navigator.officialRoomEntryManager.refreshAdFooter(_arg_1);
        }

        public function navigatorOpenedWhileInTab():void
        {
            startSearch();
        }

        private function onFilterSelected(_arg_1:_SafeStr_3116):void
        {
            startSearch();
        }

        private function startSearch():void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_1:int;
            var _local_2:int = (((_SafeStr_5447) && (!(_SafeStr_5447.disposed))) ? _SafeStr_5447.selection : defaultSelection);
            _SafeStr_14.log(("Room filter changed: " + _local_2));
            if (_local_2 == 0)
            {
                _navigator.mainViewCtrl.startSearch(2, 1);
            }
            else
            {
                if (_local_2 == 1)
                {
                    _navigator.mainViewCtrl.startSearch(2, 2);
                }
                else
                {
                    if (((_local_2 == 2) && (_SafeStr_5448)))
                    {
                        _navigator.mainViewCtrl.startSearch(2, 22);
                    }
                    else
                    {
                        _local_3 = 2;
                        if (_SafeStr_5448)
                        {
                            _local_3++;
                        };
                        _local_4 = _navigator.data.visibleCategories[(_local_2 - _local_3)];
                        if (_local_4 == null)
                        {
                            _SafeStr_14.log(((("No fc found: " + _local_2) + ", ") + _navigator.data.visibleCategories.length));
                            return;
                        };
                        _local_1 = _local_4.nodeId;
                        _SafeStr_14.log(("Searching with catId: " + _local_1));
                        _navigator.mainViewCtrl.startSearch(2, 1, ("" + _local_1));
                    };
                };
            };
            if (((_SafeStr_5447) && (!(_SafeStr_5447.disposed))))
            {
                _navigator.trackNavigationDataPoint(_SafeStr_5447.enumerateSelection()[_SafeStr_5447.selection], "category.view");
            };
        }

        public function get filterCategory():String
        {
            return (((_SafeStr_5447) && (!(_SafeStr_5447.disposed))) ? _SafeStr_5447.enumerateSelection()[_SafeStr_5447.selection] : null);
        }

        public function setSubSelection(_arg_1:int):void
        {
        }

        public function processSearchParam(_arg_1:String):String
        {
            return (_arg_1);
        }


    }
}//package com.sulake.habbo.navigator.mainview.tabpagedecorators

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1629 = "_-K0" (String#4251, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_5447 = "_-62" (String#1087, DoABC#4)
// _SafeStr_5448 = "_-jS" (String#10851, DoABC#4)


