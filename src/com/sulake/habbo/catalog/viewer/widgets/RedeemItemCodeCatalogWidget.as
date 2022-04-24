// by nota

//com.sulake.habbo.catalog.viewer.widgets.RedeemItemCodeCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.window.utils._SafeStr_3114;

    public class RedeemItemCodeCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _redeemButton:_SafeStr_3122;
        private var _SafeStr_6754:ITextFieldWindow;

        public function RedeemItemCodeCatalogWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function dispose():void
        {
            super.dispose();
            if (_redeemButton != null)
            {
                _redeemButton.removeEventListener("WME_CLICK", onRedeem);
                _redeemButton = null;
            };
            if (_SafeStr_6754 != null)
            {
                _SafeStr_6754.removeEventListener("WKE_KEY_DOWN", windowKeyEventProcessor);
                _SafeStr_6754 = null;
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            _redeemButton = (_window.findChildByName("redeem") as _SafeStr_3122);
            if (_redeemButton != null)
            {
                _redeemButton.addEventListener("WME_CLICK", onRedeem);
            };
            _SafeStr_6754 = (_window.findChildByName("voucher_code") as ITextFieldWindow);
            if (_SafeStr_6754 != null)
            {
                _SafeStr_6754.addEventListener("WKE_KEY_DOWN", windowKeyEventProcessor);
            };
            return (true);
        }

        private function onRedeem(_arg_1:WindowMouseEvent):void
        {
            redeem();
        }

        private function windowKeyEventProcessor(_arg_1:_SafeStr_3116=null, _arg_2:_SafeStr_3109=null):void
        {
            var _local_3:WindowKeyboardEvent = (_arg_1 as WindowKeyboardEvent);
            if (_local_3.charCode == 13)
            {
                redeem();
            };
        }

        private function redeem():void
        {
            var input:_SafeStr_3109 = _window.findChildByName("voucher_code");
            if (input != null)
            {
                var voucher:String = input.caption;
                if (voucher.length > 0)
                {
                    page.viewer.catalog.redeemVoucher(voucher);
                    input.caption = "";
                }
                else
                {
                    page.viewer.catalog.windowManager.alert("${catalog.voucher.empty.title}", "${catalog.voucher.empty.desc}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                    {
                        _arg_1.dispose();
                    });
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_6754 = "_-02j" (String#7886, DoABC#4)


