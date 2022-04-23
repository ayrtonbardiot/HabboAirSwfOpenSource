// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.feed.view.pane.InfoPane

package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class InfoPane extends AbstractPane 
    {

        public function InfoPane(_arg_1:String, _arg_2:NotificationView, _arg_3:_SafeStr_3133)
        {
            super(_arg_1, _arg_2, _arg_3, 2);
            (_window.findChildByName("info_ok") as _SafeStr_3240).addEventListener("WME_CLICK", onOkClick);
        }

        override public function dispose():void
        {
            var _local_1:* = null;
            super.dispose();
            if (_window)
            {
                _local_1 = (_window.findChildByName("info_ok") as _SafeStr_3240);
                if (_local_1)
                {
                    _local_1.removeEventListener("WME_CLICK", onOkClick);
                    _local_1 = null;
                };
            };
        }

        private function onOkClick(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_3761.closePaneLevel(2);
        }


    }
}//package com.sulake.habbo.notifications.feed.view.pane

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)


