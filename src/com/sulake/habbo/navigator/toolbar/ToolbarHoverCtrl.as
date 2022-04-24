// by nota

//com.sulake.habbo.navigator.toolbar.ToolbarHoverCtrl

package com.sulake.habbo.navigator.toolbar
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.utils.Timer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import _-M1k._SafeStr_523;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Point;
    import flash.events.Event;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components._SafeStr_3195;

    public class ToolbarHoverCtrl 
    {

        private static const ITEM_BG_COLOR_OVER:uint = 7433577;
        private static const ITEM_BG_COLOR_OUT:uint = 5723213;

        private const ITEM_LIST:String = "item_list";
        private const SIMPLE_ITEM_TAG:String = "SIMPLE_ITEM";

        private var _disposed:Boolean;
        private var _navigator:HabboNavigator;
        private var _localization:_SafeStr_18;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4162:IItemListWindow;
        private var _simpleItemBase:_SafeStr_3133;
        private var _hideTimeout:Timer;
        private var _SafeStr_4906:Boolean;

        public function ToolbarHoverCtrl(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
            _localization = _arg_1.localization;
            _window = _SafeStr_3133(_navigator.getXmlWindow("toolbar_hover"));
            _SafeStr_4162 = IItemListWindow(_window.findChildByName("item_list"));
            _simpleItemBase = _SafeStr_3133(_SafeStr_4162.getListItemByTag("SIMPLE_ITEM"));
            _SafeStr_4162.removeListItem(_simpleItemBase);
            _window.addEventListener("WME_OVER", onHoverOverWindow);
            _window.addEventListener("WME_HOVERING", onHoverOverWindow);
            _window.addEventListener("WME_OUT", onHoverOutWindow);
            addSimpleItem("navigator", "${navigator.title}", onNavigatorClick);
            addSimpleItem("home", "${toolbar.icon.label.exitroom.home}", onHomeClick);
            addSimpleItem("favorites", "${navigator.navisel.myfavourites}", onFavouritesClick);
            addSimpleItem("create", "${navigator.createroom.create}", onCreateRoomClick);
            addSimpleItem("history", "${navigator.navisel.visitedrooms}", onHistoryClick);
            addSimpleItem("frequent", "${navigator.navisel.frequentvisits}", onFrequentHistoryClick);
        }

        public function dispose():void
        {
            _disposed = true;
            if (_hideTimeout)
            {
                _hideTimeout.reset();
                _hideTimeout = null;
            };
            _SafeStr_4162 = null;
            _window = null;
            _simpleItemBase = null;
            _navigator = null;
            _localization = null;
        }

        private function onNavigatorClick(_arg_1:WindowMouseEvent):void
        {
            _navigator.openNavigator();
            _navigator.goToMainView();
            hideForced();
        }

        private function onHomeClick(_arg_1:WindowMouseEvent):void
        {
            var _local_2:int = _navigator.data.homeRoomId;
            if (_local_2 > -1)
            {
                _navigator.goToPrivateRoom(_local_2);
                hideForced();
            };
        }

        private function onFavouritesClick(_arg_1:WindowMouseEvent):void
        {
            _navigator.showFavouriteRooms();
            hideForced();
        }

        private function onCreateRoomClick(_arg_1:WindowMouseEvent):void
        {
            _navigator.send(new _SafeStr_523());
            hideForced();
        }

        private function onHistoryClick(_arg_1:WindowMouseEvent):void
        {
            _navigator.showHistoryRooms();
            hideForced();
        }

        private function onFrequentHistoryClick(_arg_1:WindowMouseEvent):void
        {
            _navigator.showFrequentRooms();
            hideForced();
        }

        private function addSimpleItem(_arg_1:String, _arg_2:String, _arg_3:Function):void
        {
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_simpleItemBase.clone());
            _local_4.name = _arg_1;
            (_local_4.getChildByName("text") as ITextWindow).text = _arg_2;
            _local_4.addEventListener("WME_CLICK", _arg_3);
            _local_4.addEventListener("WME_OVER", setItemBgHoverState);
            _local_4.addEventListener("WME_OUT", setItemBgHoverState);
            _SafeStr_4162.addListItem(_local_4);
        }

        public function show(_arg_1:Point):void
        {
            stopHideTimeout();
            _window.visible = true;
            _window.position = _arg_1;
        }

        public function hideDelayed():void
        {
            if (((_disposed) || (_SafeStr_4906)))
            {
                return;
            };
            startHideTimeout();
        }

        public function hideForced():void
        {
            if (_disposed)
            {
                return;
            };
            stopHideTimeout();
            _SafeStr_4906 = false;
            _window.visible = false;
        }

        public function hide():void
        {
            if (((_disposed) || (_SafeStr_4906)))
            {
                return;
            };
            stopHideTimeout();
            _SafeStr_4906 = false;
            _window.visible = false;
        }

        private function startHideTimeout():void
        {
            if (!_hideTimeout)
            {
                _hideTimeout = new Timer(500, 1);
                _hideTimeout.addEventListener("timerComplete", onHideTimeout);
                _hideTimeout.start();
            }
            else
            {
                _hideTimeout.reset();
                _hideTimeout.start();
            };
        }

        private function stopHideTimeout():void
        {
            if (((_hideTimeout) && (_hideTimeout.running)))
            {
                _hideTimeout.reset();
            };
        }

        private function onHideTimeout(_arg_1:Event):void
        {
            hide();
        }

        private function setItemBgHoverState(_arg_1:WindowMouseEvent):void
        {
            var _local_2:Boolean;
            var _local_4:IRegionWindow = IRegionWindow(_arg_1.target);
            var _local_3:_SafeStr_3195 = _SafeStr_3195(_local_4.findChildByName("background"));
            if (_local_3)
            {
                _local_2 = (_arg_1.type == "WME_OVER");
                _local_3.color = ((_local_2) ? 7433577 : 5723213);
                onHoverOutWindow(_arg_1);
            };
        }

        private function onHoverOverWindow(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4906 = true;
        }

        private function onHoverOutWindow(_arg_1:WindowMouseEvent):void
        {
            if (_window.hitTestGlobalPoint(new Point(_arg_1.stageX, _arg_1.stageY)))
            {
                _SafeStr_4906 = true;
                return;
            };
            _SafeStr_4906 = false;
            hideDelayed();
        }


    }
}//package com.sulake.habbo.navigator.toolbar

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_4906 = "_-w0" (String#5756, DoABC#4)
// _SafeStr_523 = "_-21C" (String#20318, DoABC#4)


