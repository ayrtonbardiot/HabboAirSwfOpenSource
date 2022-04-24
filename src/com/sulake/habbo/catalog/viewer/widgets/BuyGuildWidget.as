// by nota

//com.sulake.habbo.catalog.viewer.widgets.BuyGuildWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.tracking.HabboTracking;
    import _-XO._SafeStr_746;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class BuyGuildWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _button:_SafeStr_3122;

        public function BuyGuildWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
            if (_button)
            {
                _button.removeEventListener("WME_CLICK", onButtonClicked);
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            _button = (window.findChildByName("start_guild_purchase") as _SafeStr_3122);
            _button.addEventListener("WME_CLICK", onButtonClicked);
            return (true);
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            if (HabboTracking.getInstance() != null)
            {
                HabboTracking.getInstance().trackGoogle("groupPurchase", "catalogBuyClicked");
            };
            page.viewer.catalog.connection.send(new _SafeStr_746());
            page.viewer.catalog.toggleCatalog("NORMAL");
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_746 = "_-91B" (String#30531, DoABC#4)


