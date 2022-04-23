// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.BuilderAddonsCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.events._SafeStr_3116;

    public class BuilderAddonsCatalogWidget extends CatalogWidget implements _SafeStr_3303, _SafeStr_13 
    {

        private var _catalog:HabboCatalog;

        public function BuilderAddonsCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function init():Boolean
        {
            var _local_3:* = null;
            if (!super.init())
            {
                return (false);
            };
            _window.procedure = windowProcedure;
            var _local_5:IItemListWindow = (_window.findChildByName("addons_list") as IItemListWindow);
            var _local_2:_SafeStr_3109 = _local_5.removeListItemAt(0);
            var _local_6:int;
            var _local_4:* = (_catalog.builderSecondsLeft > 0);
            _window.findChildByName("trial_warning").visible = (!(_local_4));
            for each (var _local_1:_SafeStr_3141 in page.offers)
            {
                _local_3 = (_local_2.clone() as _SafeStr_3133);
                _local_3.findChildByName("item_header").caption = _local_1.localizationName;
                _local_3.findChildByName("item_price").caption = _local_1.priceInCredits.toString();
                _local_3.findChildByName("item_buy").id = _local_6;
                if (_local_1.priceInActivityPoints > 0)
                {
                    _local_3.findChildByName("diamonds_icon").visible = true;
                    _local_3.findChildByName("diamonds_price").visible = true;
                    _local_3.findChildByName("diamonds_price").caption = _local_1.priceInActivityPoints.toString();
                };
                if (!_local_4)
                {
                    _SafeStr_3122(_local_3.findChildByName("item_buy")).disable();
                };
                _local_6++;
                _local_5.addListItem(_local_3);
            };
            return (true);
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_arg_2.name == "item_buy")
            {
                _catalog.showPurchaseConfirmation(page.offers[_arg_2.id], page.pageId);
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)


