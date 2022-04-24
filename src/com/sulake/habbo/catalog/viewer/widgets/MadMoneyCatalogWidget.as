// by nota

//com.sulake.habbo.catalog.viewer.widgets.MadMoneyCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MadMoneyCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _buyButton:_SafeStr_3122;

        public function MadMoneyCatalogWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function dispose():void
        {
            super.dispose();
            if (_buyButton != null)
            {
                _buyButton.removeEventListener("WME_CLICK", eventProc);
                _buyButton = null;
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            _buyButton = (_window.findChildByName("ctlg_madmoney_button") as _SafeStr_3122);
            if (_buyButton != null)
            {
            };
            return (true);
        }

        private function eventProc(_arg_1:WindowMouseEvent):void
        {
            var event = _arg_1;
            page.viewer.catalog.windowManager.alert("TODO", "Fix in MadMoneyCatalogWidget.as", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
            {
                _arg_1.dispose();
            });
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)


