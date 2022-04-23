// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator

package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class EventsTabPageDecorator implements ITabPageDecorator 
    {

        private var _navigator:HabboNavigator;
        private var _SafeStr_5447:_SafeStr_3269;

        public function EventsTabPageDecorator(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
        }

        public function refreshCustomContent(_arg_1:_SafeStr_3133):void
        {
            var _local_2:_SafeStr_3133 = (_arg_1.getChildByName("room_ad_header") as _SafeStr_3133);
            if (((_SafeStr_5447 == null) || (_SafeStr_5447.disposed)))
            {
                _SafeStr_5447 = (_local_2.getChildByName("roomAdFilter") as _SafeStr_3269);
                prepareFilter();
                _SafeStr_5447.addEventListener("WE_SELECTED", onFilterSelected);
            };
            _local_2.visible = true;
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
            var _local_2:_SafeStr_3133 = (_arg_1.getChildByName("room_ads_footer") as _SafeStr_3133);
            var _local_3:_SafeStr_3109 = _local_2.findChildByName("get_event_but");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onGetEventClick);
            };
            _local_2.visible = true;
        }

        public function navigatorOpenedWhileInTab():void
        {
            startSearch();
        }

        private function prepareFilter():void
        {
            if (((_SafeStr_5447 == null) || (_SafeStr_5447.disposed)))
            {
                return;
            };
            var _local_1:Array = [];
            _local_1.push(_navigator.getText("navigator.roomad.topads"));
            _local_1.push(_navigator.getText("navigator.roomad.newads"));
            _SafeStr_5447.populate(_local_1);
            _SafeStr_5447.selection = 0;
        }

        private function onFilterSelected(_arg_1:_SafeStr_3116):void
        {
            startSearch();
        }

        private function onGetEventClick(_arg_1:_SafeStr_3116):void
        {
            _navigator.openCatalogRoomAdsPage();
        }

        private function startSearch():void
        {
            var _local_1:int = 16;
            if (((!(_SafeStr_5447 == null)) && (!(_SafeStr_5447.disposed))))
            {
                _local_1 = getSearchType(_SafeStr_5447.selection);
            };
            _navigator.mainViewCtrl.startSearch(1, _local_1);
        }

        private function getSearchType(_arg_1:int):int
        {
            switch (_arg_1)
            {
                case 0:
                    return (16);
                case 1:
                    return (17);
                default:
                    _SafeStr_14.log(("Invalid index when searching Room ad search type: " + _arg_1));
                    return (0);
            };
        }

        public function get filterCategory():String
        {
            if (((_SafeStr_5447 == null) || (_SafeStr_5447.disposed)))
            {
                return (null);
            };
            return (_SafeStr_5447.enumerateSelection()[_SafeStr_5447.selection]);
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
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_5447 = "_-62" (String#1087, DoABC#4)


