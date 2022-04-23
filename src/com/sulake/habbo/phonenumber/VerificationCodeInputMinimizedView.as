// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.phonenumber.VerificationCodeInputMinimizedView

package com.sulake.habbo.phonenumber
{
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class VerificationCodeInputMinimizedView 
    {

        private static const BG_COLOR_LIGHT:uint = 4286084205;
        private static const BG_COLOR_DARK:uint = 4283781966;

        private var _SafeStr_4147:HabboPhoneNumber;
        private var _window:_SafeStr_3109;

        public function VerificationCodeInputMinimizedView(_arg_1:HabboPhoneNumber)
        {
            _SafeStr_4147 = _arg_1;
            createWindow();
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.removeEventListener("WME_CLICK", onClicked);
                _window.dispose();
                _window = null;
            };
            _SafeStr_4147 = null;
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }

        private function createWindow():void
        {
            if (_window)
            {
                return;
            };
            _window = _SafeStr_4147.windowManager.buildFromXML(XML(_SafeStr_4147.assets.getAssetByName("phonenumber_verify_minimized_xml").content));
            _window.addEventListener("WME_CLICK", onClicked);
            _window.addEventListener("WME_OVER", onContainerMouseOver);
            _window.addEventListener("WME_OUT", onContainerMouseOut);
            IRegionWindow(_window).findChildByTag("BGCOLOR").color = 4283781966;
        }

        private function onClicked(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4147.setVerifyViewMinimized(false);
        }

        private function onContainerMouseOver(_arg_1:WindowMouseEvent):void
        {
            IRegionWindow(_window).findChildByTag("BGCOLOR").color = 4286084205;
        }

        private function onContainerMouseOut(_arg_1:WindowMouseEvent):void
        {
            IRegionWindow(_window).findChildByTag("BGCOLOR").color = 4283781966;
        }


    }
}//package com.sulake.habbo.phonenumber

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)


