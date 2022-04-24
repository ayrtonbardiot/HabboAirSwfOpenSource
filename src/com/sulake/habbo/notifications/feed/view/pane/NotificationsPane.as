// by nota

//com.sulake.habbo.notifications.feed.view.pane.NotificationsPane

package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.notifications.feed.view.content._SafeStr_3342;

    public class NotificationsPane extends AbstractPane 
    {

        private static const SECTIONS_LIST:String = "list";
        private static const _SafeStr_8675:String = "list_urgent";
        private static const _SafeStr_8676:String = "list_actions";
        private static const _SafeStr_8677:String = "list_persistent";
        private static const _SafeStr_8678:String = "list_notifications";

        private var _SafeStr_4162:IItemListWindow;

        public function NotificationsPane(_arg_1:String, _arg_2:NotificationView, _arg_3:_SafeStr_3133)
        {
            super(_arg_1, _arg_2, _arg_3, 1);
            setUp();
        }

        override public function dispose():void
        {
            _SafeStr_4162 = null;
            super.dispose();
        }

        private function setUp():void
        {
            _SafeStr_4162 = (_window.findChildByName("list") as IItemListWindow);
        }

        public function addItem(_arg_1:int, _arg_2:_SafeStr_3342):void
        {
            var _local_3:IItemListWindow = getSection(_arg_1);
            _local_3.addListItemAt(_arg_2.window, 0);
        }

        private function getSection(_arg_1:int):IItemListWindow
        {
            var _local_2:* = null;
            switch (_arg_1)
            {
                case 0:
                    _local_2 = "list_urgent";
                    break;
                case 1:
                    _local_2 = "list_actions";
                    break;
                case 2:
                    _local_2 = "list_persistent";
                    break;
                case 3:
                    _local_2 = "list_notifications";
                default:
            };
            return (_SafeStr_4162.getListItemByName(_local_2) as IItemListWindow);
        }


    }
}//package com.sulake.habbo.notifications.feed.view.pane

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3342 = "_-qu" (String#6832, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_8675 = "_-t15" (String#39529, DoABC#4)
// _SafeStr_8676 = "_-So" (String#39497, DoABC#4)
// _SafeStr_8677 = "_-v1P" (String#34180, DoABC#4)
// _SafeStr_8678 = "_-z18" (String#33692, DoABC#4)


