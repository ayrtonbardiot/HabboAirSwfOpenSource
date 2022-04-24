// by nota

//com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniConfirmWidget

package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.ui.handler._SafeStr_3374;
    import com.sulake.core.window.events._SafeStr_3116;

    public class FriendFurniConfirmWidget extends RoomWidgetBase 
    {

        private var _stuffId:int = -1;
        private var _window:_SafeStr_3263;
        private var _SafeStr_5383:int = -1;

        public function FriendFurniConfirmWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            confirmWidgetHandler.widget = this;
        }

        override public function dispose():void
        {
            _stuffId = -1;
            destroyWindow();
            super.dispose();
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (_window);
        }

        public function open(_arg_1:int, _arg_2:Boolean):void
        {
            if ((((_window) && (_window.visible)) && (!(_stuffId == -1))))
            {
                confirmWidgetHandler.sendLockConfirm(_stuffId, false);
                destroyWindow();
            };
            _stuffId = _arg_1;
            createWindow();
            if (!_arg_2)
            {
                _window.findChildByName("other_locked_container").height = 0;
            }
            else
            {
                _window.findChildByName("other_locked_container").height = _SafeStr_5383;
                _window.findChildByName("message").visible = false;
            };
            mainWindow.visible = true;
        }

        public function close(_arg_1:int):void
        {
            if (_arg_1 == _stuffId)
            {
                destroyWindow();
            };
        }

        public function otherConfirmed(_arg_1:int):void
        {
            if (((!(_window == null)) && (_arg_1 == _stuffId)))
            {
                IStaticBitmapWrapperWindow(_window.findChildByName("lock")).assetUri = "${image.library.url}furniextras/locked_image.png";
                _window.findChildByName("message").visible = true;
            };
        }

        private function createWindow():void
        {
            if (_window != null)
            {
                return;
            };
            _window = _SafeStr_3263(windowManager.buildFromXML(XML(assets.getAssetByName("lock_confirm_xml").content)));
            _window.procedure = windowProcedure;
            _SafeStr_5383 = _window.findChildByName("other_locked_container").height;
            _window.center();
        }

        private function destroyWindow():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function get confirmWidgetHandler():_SafeStr_3374
        {
            return (_SafeStr_3374(_SafeStr_3914));
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "cancel_button":
                        confirmWidgetHandler.sendLockConfirm(_stuffId, false);
                        destroyWindow();
                        return;
                    case "confirm_button":
                        confirmWidgetHandler.sendLockConfirm(_stuffId, true);
                        destroyWindow();
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.friendfurni

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3374 = "_-n9" (String#8833, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_5383 = "_-A13" (String#18400, DoABC#4)


