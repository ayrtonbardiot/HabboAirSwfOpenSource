// by nota

//com.sulake.habbo.notifications.NotificationPopup

package com.sulake.habbo.notifications
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class NotificationPopup implements _SafeStr_13 
    {

        private var _notifications:HabboNotifications;
        private var _SafeStr_4003:IModalDialog;
        private var _SafeStr_4028:String;
        private var _parameters:_SafeStr_24;

        public function NotificationPopup(_arg_1:HabboNotifications, _arg_2:String, _arg_3:_SafeStr_24)
        {
            var _local_7:* = null;
            var _local_8:* = null;
            super();
            _notifications = _arg_1;
            _SafeStr_4028 = _arg_2;
            _parameters = _arg_3;
            var _local_10:String = getNotificationPart("title", true);
            var _local_11:String = getNotificationPart("message", true).replace(/\\r/g, "\r");
            var _local_6:String = getNotificationPart("linkUrl", false);
            var _local_4:String;
            var _local_5:Boolean = ((!(_local_6 == null)) && (_local_6.substr(0, 6) == "event:"));
            if (_local_6 != null)
            {
                _local_4 = getNotificationPart("linkTitle", false);
                if (_local_4 == null)
                {
                    _local_4 = _local_6;
                };
            };
            var _local_12:IAsset = _notifications.assets.getAssetByName("layout_notification_popup_xml");
            _SafeStr_4003 = _notifications.windowManager.buildModalDialogFromXML((_local_12.content as XML));
            var _local_9:_SafeStr_3133 = (_SafeStr_4003.rootWindow as _SafeStr_3133);
            _local_9.procedure = windowProcedure;
            _local_9.caption = _local_10;
            if (_local_6 != null)
            {
                if (_local_5)
                {
                    _local_7 = _local_9.findChildByName("action");
                    _local_7.visible = true;
                    _local_7.caption = _local_4;
                }
                else
                {
                    _local_8 = _local_9.findChildByName("link");
                    _local_8.visible = true;
                    _local_8.caption = _local_4;
                };
            };
            _local_9.findChildByName("message").caption = _local_11;
            IStaticBitmapWrapperWindow(_local_9.findChildByName("illustration")).assetUri = _notifications.getNotificationImageUrl(_arg_3, _arg_2);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_4003.dispose();
            _SafeStr_4003 = null;
            _notifications = null;
            _SafeStr_4028 = null;
            _parameters = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4003 == null);
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (disposed)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "WME_CLICK":
                    switch (_arg_2.name)
                    {
                        case "header_button_close":
                            dispose();
                            break;
                        case "action":
                            _notifications.createLinkEvent(getNotificationPart("linkUrl", false).substr(6));
                            dispose();
                            break;
                        case "link":
                            HabboWebTools.openWebPage(getNotificationPart("linkUrl", false), "habboMain");
                    };
                    return;
                case "WE_RESIZED":
                    if (_arg_2.name == "illustration")
                    {
                        _arg_2.parent.limits.minHeight = _arg_2.height;
                    };
                    return;
            };
        }

        private function getNotificationPart(_arg_1:String, _arg_2:Boolean):String
        {
            return (_notifications.getNotificationPart(_parameters, _SafeStr_4028, _arg_1, _arg_2));
        }


    }
}//package com.sulake.habbo.notifications

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)


