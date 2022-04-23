// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.SimplePriceCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;

    public class SimplePriceCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _catalog:HabboCatalog;
        private var _SafeStr_6546:_SafeStr_3109;

        public function SimplePriceCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            events.addEventListener("SELECT_PRODUCT", onSelectProduct);
            return (true);
        }

        private function onSelectProduct(_arg_1:SelectProductEvent):void
        {
            _SafeStr_6546 = _catalog.utils.showPriceOnProduct(_arg_1.offer, (_window as _SafeStr_3133), _SafeStr_6546, _window.findChildByName("fake_productimage"), 0, true, 0);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_6546 = "_-z1B" (String#2055, DoABC#4)


