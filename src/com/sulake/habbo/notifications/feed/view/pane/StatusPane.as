// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.feed.view.pane.StatusPane

package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class StatusPane extends AbstractPane 
    {

        private static const _SafeStr_8679:String = "minimize_toggle";
        private static const _SafeStr_8680:String = "notification_feed_button";
        private static const STREAM:String = "stream_feed_button";

        public function StatusPane(_arg_1:String, _arg_2:NotificationView, _arg_3:_SafeStr_3133)
        {
            super(_arg_1, _arg_2, _arg_3, 0);
            _window.findChildByName("minimize_toggle").addEventListener("WME_CLICK", onMinimizeToggle);
            _window.findChildByName("notification_feed_button").addEventListener("WME_CLICK", onSwitchToNotifications);
            _window.findChildByName("stream_feed_button").addEventListener("WME_CLICK", onSwitchToStream);
        }

        override public function dispose():void
        {
            if (_window)
            {
                _window.findChildByName("minimize_toggle").removeEventListener("WME_CLICK", onMinimizeToggle);
                _window.findChildByName("notification_feed_button").removeEventListener("WME_CLICK", onMinimizeToggle);
                (_window.findChildByName("stream_feed_button")("WME_CLICK", onMinimizeToggle));
            };
        }

        private function onMinimizeToggle(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_3761.toggleMinimized();
        }

        private function onSwitchToNotifications(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_3761.switchToPane("pane_notifications");
        }

        private function onSwitchToStream(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_3761.switchToPane("pane_stream");
        }


    }
}//package com.sulake.habbo.notifications.feed.view.pane

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_8679 = "_-q1g" (String#41057, DoABC#4)
// _SafeStr_8680 = "_-X1v" (String#36705, DoABC#4)


