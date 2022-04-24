// by nota

//com.sulake.habbo.notifications.feed.NotificationView

package com.sulake.habbo.notifications.feed
{
    import com.sulake.habbo.notifications.HabboNotifications;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.notifications.feed.view.content.FeedEntity;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.notifications.feed.view.pane.NotificationsPane;
    import com.sulake.habbo.notifications.feed.view.pane.StreamPane;
    import com.sulake.habbo.notifications.feed.view.pane.InfoPane;
    import com.sulake.habbo.notifications.feed.view.pane.SettingsPane;
    import com.sulake.habbo.notifications.feed.view.pane.StatusPane;
    import com.sulake.habbo.notifications.feed.view.pane._SafeStr_3395;
    import com.sulake.habbo.notifications.feed.view.pane.AbstractPane;
    import com.sulake.habbo.notifications.feed.view.content._SafeStr_3342;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class NotificationView 
    {

        public static const VIEW_PANE_FEEDS:String = "pane_feeds";
        public static const VIEW_PANE_NOTIFICATIONS:String = "pane_notifications";
        public static const VIEW_PANE_STREAM:String = "pane_stream";
        public static const VIEW_PANE_SETTINGS:String = "pane_settings";
        public static const VIEW_PANE_INFO:String = "pane_info";
        public static const VIEW_PANE_STATUS:String = "pane_status";
        private static const _SafeStr_8686:String = "settings_toggle";
        private static const ELEMENT_INFO:String = "info_toggle";

        private var _SafeStr_6187:StateController;
        private var _SafeStr_4147:HabboNotifications;
        private var _SafeStr_4360:NotificationController;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6186:_SafeStr_24;

        public function NotificationView(_arg_1:NotificationController, _arg_2:HabboNotifications)
        {
            _SafeStr_4360 = _arg_1;
            _SafeStr_4147 = _arg_2;
            _SafeStr_6187 = new StateController();
            FeedEntity.assignHandles(windowManager, assets, localization, _arg_1);
            setupUserInterface();
            closePaneLevel(2);
            switchToPane("pane_notifications");
            setVisibilityState(1);
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_6186)
            {
                for each (var _local_1:_SafeStr_13 in _SafeStr_6186)
                {
                    _local_1.dispose();
                };
                _SafeStr_6186.dispose();
                _SafeStr_6186 = null;
            };
            FeedEntity.removeHandles();
            _SafeStr_4360 = null;
            _SafeStr_6187 = null;
            _SafeStr_4147 = null;
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_SafeStr_4147.windowManager);
        }

        public function get assets():IAssetLibrary
        {
            return (_SafeStr_4147.assets);
        }

        public function get localization():_SafeStr_18
        {
            return (_SafeStr_4147.localization);
        }

        public function get controller():NotificationController
        {
            return (_SafeStr_4360);
        }

        private function setupUserInterface():void
        {
            if (_window)
            {
                return;
            };
            _window = (_SafeStr_4147.windowManager.buildFromXML((_SafeStr_4147.assets.getAssetByName("feed_display_xml").content as XML)) as _SafeStr_3133);
            _window.height = _window.desktop.height;
            _window.setParamFlag(64);
            _window.setParamFlag(0x0800);
            _window.findChildByName("settings_toggle").addEventListener("WME_CLICK", onSettingsToggle);
            _window.findChildByName("info_toggle").addEventListener("WME_CLICK", onInfoToggle);
            _SafeStr_6186 = new _SafeStr_24();
            _SafeStr_6186.add("pane_notifications", new NotificationsPane("pane_notifications", this, (_window.findChildByName("pane_notifications") as _SafeStr_3133)));
            _SafeStr_6186.add("pane_stream", new StreamPane("pane_stream", this, (_window.findChildByName("pane_stream") as _SafeStr_3133)));
            _SafeStr_6186.add("pane_info", new InfoPane("pane_info", this, (_window.findChildByName("pane_info") as _SafeStr_3133)));
            _SafeStr_6186.add("pane_settings", new SettingsPane("pane_settings", this, (_window.findChildByName("pane_settings") as _SafeStr_3133)));
            _SafeStr_6186.add("pane_status", new StatusPane("pane_status", this, (_window.findChildByName("pane_status") as _SafeStr_3133)));
        }

        public function toggleMinimized():void
        {
            switch (_SafeStr_6187.currentState())
            {
                case 2:
                    setVisibilityState(1);
                    return;
                case 1:
                    setVisibilityState(2);
                default:
            };
        }

        public function setVisibilityState(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_3:int = _SafeStr_6187.requestState(_arg_1);
            switch (_local_3)
            {
                case 0:
                    _window.x = _window.desktop.width;
                    _window.visible = false;
                    return;
                case 1:
                    _window.visible = true;
                    _local_2 = (_window.findChildByName("main_view") as _SafeStr_3133);
                    _window.x = (_window.desktop.width - (_window.width - _local_2.width));
                    return;
                case 2:
                    _window.visible = true;
                    _window.x = (_window.desktop.width - _window.width);
                default:
            };
        }

        public function setViewEnabled(_arg_1:Boolean):void
        {
            _SafeStr_6187.setEnabled(_arg_1);
            setVisibilityState(_SafeStr_6187.currentState());
        }

        public function setGameMode(_arg_1:Boolean):void
        {
            _SafeStr_6187.setGameMode(_arg_1);
            setVisibilityState(_SafeStr_6187.currentState());
        }

        public function switchToPane(_arg_1:String):void
        {
            var _local_2:_SafeStr_3395 = _SafeStr_6186.getValue(_arg_1);
            if (!_local_2)
            {
                return;
            };
            closePaneLevel(_local_2.paneLevel);
            _local_2.isVisible = true;
        }

        public function closePaneLevel(_arg_1:int):void
        {
            for each (var _local_2:AbstractPane in _SafeStr_6186)
            {
                if (_local_2.paneLevel == _arg_1)
                {
                    _local_2.isVisible = false;
                };
            };
        }

        public function addNotificationFeedItem(_arg_1:int, _arg_2:_SafeStr_3342):void
        {
            (_SafeStr_6186.getValue("pane_notifications") as NotificationsPane).addItem(_arg_1, _arg_2);
        }

        public function addStreamFeedItem(_arg_1:_SafeStr_3342):void
        {
            (_SafeStr_6186.getValue("pane_stream") as StreamPane).addItem(_arg_1);
        }

        public function removeStreamItems():void
        {
        }

        private function onSettingsToggle(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3395 = (_SafeStr_6186.getValue("pane_settings") as _SafeStr_3395);
            if (_local_2)
            {
                if (_local_2.isVisible)
                {
                    closePaneLevel(2);
                }
                else
                {
                    switchToPane("pane_settings");
                };
            };
        }

        private function onInfoToggle(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3395 = (_SafeStr_6186.getValue("pane_info") as _SafeStr_3395);
            if (_local_2)
            {
                if (_local_2.isVisible)
                {
                    closePaneLevel(2);
                }
                else
                {
                    switchToPane("pane_info");
                };
            };
        }


    }
}//package com.sulake.habbo.notifications.feed

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3342 = "_-qu" (String#6832, DoABC#4)
// _SafeStr_3395 = "_-22Y" (String#8631, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_6186 = "_-712" (String#4022, DoABC#4)
// _SafeStr_6187 = "_-Bb" (String#6776, DoABC#4)
// _SafeStr_8686 = "_-Ql" (String#39226, DoABC#4)


