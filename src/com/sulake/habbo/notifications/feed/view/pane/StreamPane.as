// by nota

//com.sulake.habbo.notifications.feed.view.pane.StreamPane

package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.notifications.feed.view.content._SafeStr_3342;

    public class StreamPane extends AbstractPane 
    {

        private var _SafeStr_4162:IItemListWindow;

        public function StreamPane(_arg_1:String, _arg_2:NotificationView, _arg_3:_SafeStr_3133)
        {
            super(_arg_1, _arg_2, _arg_3, 1);
            _SafeStr_4162 = (_window.findChildByName("list") as IItemListWindow);
        }

        override public function dispose():void
        {
            _SafeStr_4162 = null;
            super.dispose();
        }

        public function addItem(_arg_1:_SafeStr_3342):void
        {
            _SafeStr_4162.addListItem(_arg_1.window);
        }


    }
}//package com.sulake.habbo.notifications.feed.view.pane

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3342 = "_-qu" (String#6832, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)


