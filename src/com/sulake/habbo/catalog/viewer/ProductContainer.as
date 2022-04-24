// by nota

//com.sulake.habbo.catalog.viewer.ProductContainer

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.catalog.purse._SafeStr_3226;
    import com.sulake.core.window.components.IItemListWindow;

    public class ProductContainer extends ProductGridItem implements _SafeStr_3140, _SafeStr_3300, _SafeStr_3266, _SafeStr_1875 
    {

        private static const ELEMENT_TOTAL_PRICE_CONTAINER:String = "totalprice_container";
        private static const _SafeStr_8358:String = "amount_text_left";
        private static const ELEMENT_AMOUNT_TEXT_RIGHT:String = "amount_text_right";
        private static const ELEMENT_CURRENCY_INDICATOR_BITMAP_RIGHT:String = "currency_indicator_bitmap_right";

        protected var _offer:_SafeStr_3141;
        protected var _SafeStr_3814:Vector.<_SafeStr_3151>;

        public function ProductContainer(_arg_1:_SafeStr_3141, _arg_2:Vector.<_SafeStr_3151>, _arg_3:HabboCatalog)
        {
            var _local_5:* = null;
            super(_arg_3);
            for each (var _local_4:Product in _arg_2)
            {
                if (_local_4.productType != "b")
                {
                    _local_5 = _local_4.extraParam;
                    break;
                };
            };
            _offer = _arg_1;
            _SafeStr_3814 = _arg_2;
        }

        public function get products():Vector.<_SafeStr_3151>
        {
            return (_SafeStr_3814);
        }

        public function get firstProduct():_SafeStr_3151
        {
            if (((!(_SafeStr_3814)) || (_SafeStr_3814.length == 0)))
            {
                return (null);
            };
            if (_SafeStr_3814.length == 1)
            {
                return (_SafeStr_3814[0]);
            };
            var _local_1:Vector.<_SafeStr_3151> = Product.stripAddonProducts(_SafeStr_3814);
            return ((_local_1.length > 0) ? _local_1[0] : null);
        }

        public function get offer():_SafeStr_3141
        {
            return (_offer);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            for each (var _local_1:Product in _SafeStr_3814)
            {
                _local_1.dispose();
            };
            _SafeStr_3814 = null;
            super.dispose();
        }

        public function get isLazy():Boolean
        {
            return (false);
        }

        public function initProductIcon(_arg_1:IRoomEngine, _arg_2:IStuffData=null):void
        {
        }

        override public function set view(_arg_1:_SafeStr_3133):void
        {
            var _local_3:int;
            var _local_2:* = null;
            super.view = _arg_1;
            if (_SafeStr_3882 == null)
            {
                return;
            };
            if (((((catalog) && (_offer.badgeCode)) && (!(_offer.badgeCode == ""))) && (_offer.productContainer.products.length > 1)))
            {
                setAddOnIcon("catalog_icon_badge_included");
            }
            else
            {
                if (((catalog) && (_offer.productContainer.products.length == 2)))
                {
                    _local_3 = 0;
                    while (_local_3 < 2)
                    {
                        _local_2 = _offer.productContainer.products[_local_3];
                        if (((_local_2.productType == "e") && (_local_2.productClassId == 108)))
                        {
                            setAddOnIcon("catalog_icon_ninja_effect_included");
                        };
                        _local_3++;
                    };
                };
            };
            setClubIconLevel(offer.clubLevel);
            if (catalog.isDraggable(offer))
            {
                setDraggable(true);
            };
        }

        private function setAddOnIcon(_arg_1:String):void
        {
            var _local_3:_SafeStr_3264 = (_SafeStr_3882.findChildByName("badge_add_on") as _SafeStr_3264);
            var _local_4:IAsset = catalog.assets.getAssetByName(_arg_1);
            _local_3.bitmap = (_local_4.content as BitmapData);
            var _local_2:BitmapData = (_local_4.content as BitmapData);
            _local_3.width = _local_2.width;
            _local_3.height = _local_2.height;
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            setIconImage(_arg_2, true);
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        public function setClubIconLevel(_arg_1:int):void
        {
            if (view == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = view.findChildByName("clubLevelIcon");
            if (_local_2 == null)
            {
                return;
            };
            switch (offer.clubLevel)
            {
                case 0:
                    _local_2.visible = false;
                    return;
                case 1:
                    _local_2.visible = true;
                    _local_2.style = 11;
                    _local_2.x = (_local_2.x + 3);
                    return;
                case 2:
                    _local_2.visible = true;
                    _local_2.style = 12;
                default:
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            if (!disposed)
            {
                for each (var _local_2:_SafeStr_3151 in products)
                {
                    if (((_local_2.productType == "r") && (_local_2.extraParam == _arg_1)))
                    {
                        setIconImage(renderAvatarImage(_local_2.extraParam, this), true);
                        return;
                    };
                };
            };
        }

        public function createCurrencyIndicators(_arg_1:HabboCatalog):void
        {
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            if (_offer.priceInCredits > 0)
            {
                if (_offer.priceInActivityPoints > 0)
                {
                    _local_2 = ITextWindow(_SafeStr_3882.findChildByName("amount_text_left"));
                }
                else
                {
                    _local_2 = ITextWindow(_SafeStr_3882.findChildByName("amount_text_right"));
                };
                if (_local_2)
                {
                    _local_2.text = (_offer.priceInCredits + "");
                };
            };
            if (_offer.priceInActivityPoints > 0)
            {
                _local_5 = ITextWindow(_SafeStr_3882.findChildByName("amount_text_right"));
                if (_local_5)
                {
                    _local_4 = _SafeStr_3882.findChildByName("currency_indicator_bitmap_right");
                    if (_local_4)
                    {
                        _local_4.style = _SafeStr_3226.getIconStyleFor(_offer.activityPointType, _arg_1, false);
                    };
                    _local_5.text = (_offer.priceInActivityPoints + "");
                };
            };
            var _local_3:IItemListWindow = IItemListWindow(_SafeStr_3882.findChildByName("totalprice_container"));
            if (_local_3)
            {
                _local_3.arrangeListItems();
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3226 = "_-G14" (String#4868, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_3814 = "_-H1d" (String#3176, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_8358 = "_-5u" (String#30995, DoABC#4)


