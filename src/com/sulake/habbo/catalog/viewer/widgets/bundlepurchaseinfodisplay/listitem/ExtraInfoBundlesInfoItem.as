// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBundlesInfoItem

package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class ExtraInfoBundlesInfoItem extends ExtraInfoListItem 
    {

        private var _catalog:HabboCatalog;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4981:BundlePurchaseExtraInfoWidget;

        public function ExtraInfoBundlesInfoItem(_arg_1:BundlePurchaseExtraInfoWidget, _arg_2:int, _arg_3:ExtraInfoItemData, _arg_4:HabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_3, 2, true);
            _catalog = _arg_4;
            _SafeStr_4981 = _arg_1;
        }

        override public function getRenderedWindow():_SafeStr_3133
        {
            if (_window == null)
            {
                createWindow();
            };
            return (_window);
        }

        private function createWindow():void
        {
            _window = _SafeStr_3133(_catalog.utils.createWindow("bundlesInfoItem"));
            _window.procedure = windowProcedure;
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4981.events.dispatchEvent(new CatalogWidgetBundleDisplayExtraInfoEvent("CWPPEIE_ITEM_CLICKED", data, id));
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


