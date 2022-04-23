// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.feed.view.pane.SettingsPane

package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.notifications.feed.FeedSettings;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class SettingsPane extends AbstractPane 
    {

        public function SettingsPane(_arg_1:String, _arg_2:NotificationView, _arg_3:_SafeStr_3133)
        {
            super(_arg_1, _arg_2, _arg_3, 2);
            applySettingsToView();
            _window.procedure = onWindowEventProc;
        }

        override public function dispose():void
        {
            super.dispose();
        }

        private function applySettingsToView():void
        {
            var _local_1:FeedSettings = _SafeStr_3761.controller.getSettings();
            _local_1.getVisibleFeedCategories();
        }

        public function onWindowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_5:int;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _SafeStr_3761.controller.getSettings();
                for each (var _local_4:String in _arg_2.tags)
                {
                    switch (_local_4)
                    {
                        case "ME":
                            _local_5 = 0;
                            break;
                        case "HOTEL":
                            _local_5 = 2;
                            break;
                        case "FRIENDS":
                            _local_5 = 1;
                    };
                    _local_3.toggleVisibleFeedCategory(_local_5);
                };
                applySettingsToView();
            };
        }


    }
}//package com.sulake.habbo.notifications.feed.view.pane

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)


