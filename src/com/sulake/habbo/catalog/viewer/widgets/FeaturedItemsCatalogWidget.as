// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.FeaturedItemsCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import _-AE._SafeStr_1565;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class FeaturedItemsCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _catalog:HabboCatalog;
        private var _SafeStr_6675:IItemListWindow;
        private var _SafeStr_5686:_SafeStr_3133;

        public function FeaturedItemsCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                _catalog = null;
                _SafeStr_6675.dispose();
                _SafeStr_6675 = null;
                _SafeStr_5686.dispose();
                _SafeStr_5686 = null;
                super.dispose();
            };
        }

        override public function init():Boolean
        {
            var _local_2:int;
            if (!super.init())
            {
                return (false);
            };
            _SafeStr_6675 = (window.findChildByName("itemlist_featured") as IItemListWindow);
            _SafeStr_5686 = (_SafeStr_6675.getListItemByName("featured_item_template") as _SafeStr_3133);
            _SafeStr_6675.removeListItems();
            if (((_catalog.frontPageItems == null) || (_catalog.frontPageItems.length == 0)))
            {
                return (true);
            };
            var _local_1:_SafeStr_3133 = (_window.findChildByName("firstitem") as _SafeStr_3133);
            populateItem(_catalog.frontPageItems[0], _local_1);
            _local_2 = 1;
            while (_local_2 < Math.min(4, _catalog.frontPageItems.length))
            {
                _SafeStr_6675.addListItem(createItemFromTemplate(_catalog.frontPageItems[_local_2]));
                _local_2++;
            };
            return (true);
        }

        private function createItemFromTemplate(_arg_1:_SafeStr_1565):_SafeStr_3133
        {
            return (populateItem(_arg_1, (_SafeStr_5686.clone() as _SafeStr_3133)));
        }

        private function populateItem(_arg_1:_SafeStr_1565, _arg_2:_SafeStr_3133):_SafeStr_3133
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:ITextWindow = (_arg_2.findChildByName("item_title") as ITextWindow);
            _local_5.text = _arg_1.itemName;
            if (((!(_arg_1.itemPromoImage == null)) && (!(_arg_1.itemPromoImage == ""))))
            {
                _local_3 = _catalog.context.configuration.getProperty("image.library.url");
                _local_4 = (_arg_2.findChildByName("item_image") as IStaticBitmapWrapperWindow);
                _local_4.assetUri = (_local_3 + _arg_1.itemPromoImage);
            };
            var _local_6:_SafeStr_3109 = _arg_2.getChildByName("event_catcher_region");
            if (_local_6 != null)
            {
                _local_6.procedure = eventProc;
            };
            return (_arg_2);
        }

        private function eventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:int;
            var _local_3:* = null;
            if (_arg_1.type == "WME_DOWN")
            {
                _local_4 = _SafeStr_6675.getListItemIndex(_arg_2.parent);
                _local_4 = ((_local_4 < 0) ? 0 : (_local_4 + 1));
                _local_3 = _catalog.frontPageItems[_local_4];
                switch (_local_3.type)
                {
                    case 0:
                        if (_local_3.cataloguePageLocation == "room_bundles_mobile")
                        {
                            return (_catalog.openCatalogPage("room_bundles", "NORMAL"));
                        };
                        if (_local_3.cataloguePageLocation == "mobile_subscriptions")
                        {
                            return (_catalog.openCatalogPage("hc_membership", "NORMAL"));
                        };
                        _catalog.openCatalogPage(_local_3.cataloguePageLocation, "NORMAL");
                        return;
                    case 1:
                        _catalog.openCatalogPageByOfferId(_local_3.productOfferID, "NORMAL");
                    default:
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_1565 = "_-i1o" (String#13975, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_5686 = "_-SO" (String#4122, DoABC#4)
// _SafeStr_6675 = "_-p1l" (String#3960, DoABC#4)


