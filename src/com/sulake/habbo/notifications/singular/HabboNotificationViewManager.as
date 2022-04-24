// by nota

//com.sulake.habbo.notifications.singular.HabboNotificationViewManager

package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.notifications.HabboNotifications;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import flash.events.Event;

    public class HabboNotificationViewManager implements _SafeStr_41 
    {

        private static const SPACING:int = 4;

        private var _SafeStr_3745:_SafeStr_21;
        private var _windowManager:_SafeStr_1695;
        private var _toolbar:IHabboToolbar;
        private var _notifications:HabboNotifications;
        private var _styleConfig:_SafeStr_24;
        private var _viewConfig:_SafeStr_24;
        private var _disposed:Boolean = false;
        private var _viewItems:Array;

        public function HabboNotificationViewManager(_arg_1:HabboNotifications, _arg_2:_SafeStr_21, _arg_3:_SafeStr_1695, _arg_4:IHabboToolbar, _arg_5:_SafeStr_24, _arg_6:_SafeStr_24)
        {
            _notifications = _arg_1;
            _SafeStr_3745 = _arg_2;
            _windowManager = _arg_3;
            _toolbar = _arg_4;
            _styleConfig = _arg_5;
            _viewConfig = _arg_6;
            _viewItems = [];
            if (_toolbar)
            {
                _toolbar.events.addEventListener("EVE_EXTENSION_VIEW_RESIZED", refreshTopMargin);
            };
            _notifications.registerUpdateReceiver(this, 2);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function replaceIcon(_arg_1:BadgeImageReadyEvent):void
        {
            for each (var _local_2:HabboNotificationItemView in _viewItems)
            {
                _local_2.replaceIcon(_arg_1);
            };
        }

        public function dispose():void
        {
            var _local_2:int;
            var _local_1:int = _viewItems.length;
            _local_2 = 0;
            while (_local_2 < _local_1)
            {
                (_viewItems.pop() as HabboNotificationItemView).dispose();
                _local_2++;
            };
            _SafeStr_3745 = null;
            _windowManager = null;
            if (_styleConfig)
            {
                _styleConfig.dispose();
                _styleConfig = null;
            };
            if (_viewConfig)
            {
                _viewConfig.dispose();
                _viewConfig = null;
            };
            if (_toolbar)
            {
                _toolbar.events.removeEventListener("EVE_EXTENSION_VIEW_RESIZED", refreshTopMargin);
                _toolbar = null;
            };
            if (_notifications != null)
            {
                _notifications.removeUpdateReceiver(this);
                _notifications = null;
            };
            _disposed = true;
        }

        public function showItem(_arg_1:HabboNotificationItem):Boolean
        {
            if (!isSpaceAvailable())
            {
                return (false);
            };
            var _local_2:HabboNotificationItemView = new HabboNotificationItemView(_SafeStr_3745.getAssetByName("layout_notification_xml"), _windowManager, _styleConfig, _viewConfig, _arg_1);
            _local_2.reposition(getNextAvailableVerticalPosition());
            _viewItems.push(_local_2);
            _viewItems.sortOn("verticalPosition", 16);
            return (true);
        }

        public function isSpaceAvailable():Boolean
        {
            return ((getNextAvailableVerticalPosition() + 70) < _windowManager.getDesktop(0).height);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:* = null;
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < _viewItems.length)
            {
                (_viewItems[_local_3] as HabboNotificationItemView).update(_arg_1);
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < _viewItems.length)
            {
                _local_2 = (_viewItems[_local_3] as HabboNotificationItemView);
                if (_local_2.ready)
                {
                    _local_2.dispose();
                    _viewItems.splice(_local_3, 1);
                    _local_3--;
                };
                _local_3++;
            };
        }

        private function getNextAvailableVerticalPosition():int
        {
            var _local_3:int;
            var _local_1:* = null;
            if (!_toolbar)
            {
                return (4);
            };
            if (!_toolbar.extensionView)
            {
                return (4);
            };
            var _local_2:int = (_toolbar.extensionView.screenHeight + 4);
            if (_viewItems.length == 0)
            {
                return (_local_2);
            };
            var _local_4:* = _local_2;
            _local_3 = 0;
            while (_local_3 < _viewItems.length)
            {
                _local_1 = (_viewItems[_local_3] as HabboNotificationItemView);
                if ((_local_4 + 70) < _local_1.verticalPosition)
                {
                    return (_local_4);
                };
                _local_4 = ((_local_1.verticalPosition + 70) + 4);
                _local_3++;
            };
            return (_local_4);
        }

        public function refreshTopMargin(_arg_1:Event):void
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_3:int = (_toolbar.extensionView.screenHeight + 4);
            _local_4 = 0;
            while (_local_4 < _viewItems.length)
            {
                _local_2 = (_viewItems[_local_4] as HabboNotificationItemView);
                _local_2.reposition(_local_3);
                _local_3 = ((_local_2.verticalPosition + 70) + 4);
                _local_4++;
            };
        }


    }
}//package com.sulake.habbo.notifications.singular

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)


