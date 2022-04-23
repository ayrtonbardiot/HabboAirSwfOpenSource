// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.FirstProductSelectorCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;

    public class FirstProductSelectorCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        public function FirstProductSelectorCatalogWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            events.addEventListener("WIDGETS_INITIALIZED", onWidgetsInitialized);
            return (true);
        }

        private function onWidgetsInitialized(_arg_1:CatalogWidgetEvent):void
        {
            if (page.offers.length == 0)
            {
                return;
            };
            var _local_2:_SafeStr_3141 = page.offers[0];
            events.dispatchEvent(new SelectProductEvent(_local_2));
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)


