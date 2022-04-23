// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.club.VipBenefitsWindow

package com.sulake.habbo.catalog.club
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class VipBenefitsWindow implements _SafeStr_13 
    {

        private var _disposed:Boolean = false;
        private var _window:_SafeStr_3133;

        public function VipBenefitsWindow(_arg_1:HabboCatalog)
        {
            _window = (_arg_1.utils.createWindow("vip_benefits") as _SafeStr_3133);
            _window.findChildByName("header_button_close").addEventListener("WME_CLICK", onClose);
            _window.center();
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_window != null)
                {
                    _window.dispose();
                    _window = null;
                };
            };
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            dispose();
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


