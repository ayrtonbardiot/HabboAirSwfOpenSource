// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.TrophyCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.catalog.viewer.ProductImageConfiguration;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.TextInputEvent;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class TrophyCatalogWidget extends CatalogWidget implements _SafeStr_3303, _SafeStr_3140 
    {

        private static const gold:int = 0xFFCC00;
        private static const silver:int = 0xCCCCCC;
        private static const bronze:int = 0xCC6600;

        private var _SafeStr_6549:_SafeStr_3264;
        private var _trophyOffers:_SafeStr_24;
        private var _SafeStr_6745:int = 0;
        private var _SafeStr_6746:String = "g";
        private var _catalog:HabboCatalog;
        private var _SafeStr_6546:_SafeStr_3109;

        public function TrophyCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (_trophyOffers != null)
            {
                _trophyOffers.dispose();
            };
            _trophyOffers = null;
            _catalog = null;
            _SafeStr_6546 = null;
            super.dispose();
        }

        override public function init():Boolean
        {
            var _local_7:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_3:* = null;
            if (!super.init())
            {
                return (false);
            };
            _SafeStr_6549 = (window.findChildByName("ctlg_teaserimg_1") as _SafeStr_3264);
            events.addEventListener("SELECT_PRODUCT", onSelectProduct);
            events.addEventListener("COLOUR_INDEX", onColourIndex);
            events.addEventListener("TEXT_INPUT", onTextInput);
            var _local_5:_SafeStr_3240 = (window.findChildByName("ctlg_nextmodel_button") as _SafeStr_3240);
            var _local_4:_SafeStr_3240 = (window.findChildByName("ctlg_prevmodel_button") as _SafeStr_3240);
            if (_local_5 != null)
            {
                _local_5.addEventListener("WME_CLICK", onClickNext);
            };
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onClickPrev);
            };
            _trophyOffers = new _SafeStr_24();
            var _local_1:Offer;
            for each (_local_1 in page.offers)
            {
                _local_7 = getBaseNameFromProduct(_local_1.localizationId);
                _local_6 = getTrophyTypeFromProduct(_local_1.localizationId);
                if (_trophyOffers.getValue(_local_7) == null)
                {
                    _trophyOffers.add(_local_7, new _SafeStr_24());
                };
                _local_2 = (_trophyOffers.getValue(_local_7) as _SafeStr_24);
                _local_2.add(_local_6, _local_1);
            };
            if (page.offers.length == 1)
            {
                var _local_9:* = false;
                _local_4.visible = _local_9;
                _local_5.visible = _local_9;
                if (page.offers[0].product.isColorable == false)
                {
                    if (_SafeStr_3133(window.parent))
                    {
                        _local_3 = (_SafeStr_3133(window.parent).findChildByName("colourGridWidget") as _SafeStr_3133);
                        if (_local_3)
                        {
                            _local_3.visible = false;
                        };
                    };
                };
            };
            events.addEventListener("WIDGETS_INITIALIZED", onWidgetsInitialized);
            return (true);
        }

        private function onWidgetsInitialized(_arg_1:CatalogWidgetEvent):void
        {
            var _local_3:* = null;
            var _local_4:Array = [];
            _local_4.push(0xFFCC00);
            _local_4.push(0xCCCCCC);
            _local_4.push(0xCC6600);
            var _local_2:_SafeStr_24 = _trophyOffers.getWithIndex(_SafeStr_6745);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getValue(_SafeStr_6746);
                if (_local_3 == null)
                {
                    _local_3 = _local_2.getWithIndex(0);
                };
                if (_local_3 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_3));
                };
            };
            events.dispatchEvent(new CatalogWidgetColoursEvent(_local_4, "ctlg_clr_40x32_1", "ctlg_clr_40x32_2", "ctlg_clr_40x32_3"));
        }

        private function onSelectProduct(_arg_1:SelectProductEvent):void
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3141 = _arg_1.offer;
            var _local_6:_SafeStr_3182 = page.viewer.catalog.getProductData(_local_2.localizationId);
            if (ProductImageConfiguration.hasProductImage(_local_2.localizationId))
            {
                setPreviewFromAsset(ProductImageConfiguration.PRODUCT_IMAGES[_local_2.localizationId]);
            }
            else
            {
                _local_3 = _local_2.product;
                _local_4 = page.viewer.roomEngine.getFurnitureImage(_local_3.productClassId, new Vector3d(2, 0, 0), 64, this, 0, _local_3.extraParam);
                _local_2.previewCallbackId = _local_4.id;
                if (_local_4 != null)
                {
                    _local_5 = _local_4.data;
                };
                setPreviewImage(_local_5, true);
            };
            _SafeStr_6546 = _catalog.utils.showPriceOnProduct(_local_2, _window, _SafeStr_6546, _SafeStr_6549, 0, false, 0);
        }

        private function onColourIndex(_arg_1:CatalogWidgetColourIndexEvent):void
        {
            var _local_3:* = null;
            if (_arg_1.index == 0)
            {
                _SafeStr_6746 = "g";
            };
            if (_arg_1.index == 1)
            {
                _SafeStr_6746 = "s";
            };
            if (_arg_1.index == 2)
            {
                _SafeStr_6746 = "b";
            };
            var _local_2:_SafeStr_24 = _trophyOffers.getWithIndex(_SafeStr_6745);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getValue(_SafeStr_6746);
                if (_local_3 == null)
                {
                    _local_3 = _local_2.getWithIndex(0);
                };
                if (_local_3 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_3));
                };
            };
            _SafeStr_6546 = _catalog.utils.showPriceOnProduct(_local_3, _window, _SafeStr_6546, _SafeStr_6549, 0, false, 0);
        }

        public function onTextInput(_arg_1:TextInputEvent):void
        {
            events.dispatchEvent(new SetExtraPurchaseParameterEvent(_arg_1.text));
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if ((((disposed) || (page == null)) || (page.offers == null)))
            {
                return;
            };
            for each (var _local_3:Offer in page.offers)
            {
                if (_local_3.previewCallbackId == _arg_1)
                {
                    _local_3.previewCallbackId = 0;
                    setPreviewImage(_arg_2, true);
                    return;
                };
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function getBaseNameFromProduct(_arg_1:String):String
        {
            var _local_2:String = getTrophyTypeFromProduct(_arg_1);
            if (_local_2.length > 0)
            {
                return (_arg_1.slice(0, ((_arg_1.length - 1) - _local_2.length)));
            };
            return (_arg_1);
        }

        private function getTrophyTypeFromProduct(_arg_1:String):String
        {
            var _local_3:int = _arg_1.indexOf("prizetrophy_2011_");
            if (_local_3 != -1)
            {
                return ("");
            };
            var _local_2:int = (_arg_1.lastIndexOf("_") + 1);
            if (_local_2 <= 0)
            {
                return ("");
            };
            var _local_4:String = _arg_1.substr(_local_2);
            if (((_local_4.length > 1) || (((!(_local_4 == "g")) && (!(_local_4 == "s"))) && (!(_local_4 == "b")))))
            {
                return ("");
            };
            return (_local_4);
        }

        private function onClickNext(_arg_1:WindowMouseEvent):void
        {
            var _local_3:* = null;
            _SafeStr_6745++;
            if (_SafeStr_6745 >= _trophyOffers.length)
            {
                _SafeStr_6745 = 0;
            };
            var _local_2:_SafeStr_24 = _trophyOffers.getWithIndex(_SafeStr_6745);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getValue(_SafeStr_6746);
                if (_local_3 == null)
                {
                    _local_3 = _local_2.getWithIndex(0);
                };
                if (_local_3 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_3));
                };
            };
        }

        private function onClickPrev(_arg_1:WindowMouseEvent):void
        {
            var _local_3:* = null;
            _SafeStr_6745--;
            if (_SafeStr_6745 < 0)
            {
                _SafeStr_6745 = (_trophyOffers.length - 1);
            };
            var _local_2:_SafeStr_24 = _trophyOffers.getWithIndex(_SafeStr_6745);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getValue(_SafeStr_6746);
                if (_local_3 == null)
                {
                    _local_3 = _local_2.getWithIndex(0);
                };
                if (_local_3 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_3));
                };
            };
        }

        private function setPreviewImage(_arg_1:BitmapData, _arg_2:Boolean):void
        {
            var _local_3:* = null;
            if (((!(window.disposed)) && (!(_SafeStr_6549 == null))))
            {
                if (_arg_1 == null)
                {
                    _arg_1 = new BitmapData(1, 1);
                    _arg_2 = true;
                };
                if (_SafeStr_6549.bitmap == null)
                {
                    _SafeStr_6549.bitmap = new BitmapData(_SafeStr_6549.width, _SafeStr_6549.height, true, 0xFFFFFF);
                };
                _SafeStr_6549.bitmap.fillRect(_SafeStr_6549.bitmap.rect, 0xFFFFFF);
                _local_3 = new Point(((_SafeStr_6549.width - _arg_1.width) / 2), ((_SafeStr_6549.height - _arg_1.height) / 2));
                _SafeStr_6549.bitmap.copyPixels(_arg_1, _arg_1.rect, _local_3, null, null, true);
                _SafeStr_6549.invalidate();
            };
            if (((_arg_2) && (!(_arg_1 == null))))
            {
                _arg_1.dispose();
            };
        }

        private function setPreviewFromAsset(_arg_1:String):void
        {
            var _local_2:BitmapDataAsset = (page.viewer.catalog.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_2 == null)
            {
                retrievePreviewAsset(_arg_1);
                return;
            };
            setPreviewImage((_local_2.content as BitmapData), false);
        }

        private function retrievePreviewAsset(_arg_1:String):void
        {
            var _local_4:String = ((page.viewer.catalog.imageGalleryHost + _arg_1) + ".gif");
            _SafeStr_14.log(("[TrophyCatalogWidget] Retrieve Product Preview Asset: " + _local_4));
            var _local_2:URLRequest = new URLRequest(_local_4);
            var _local_3:AssetLoaderStruct = page.viewer.catalog.assets.loadAssetFromFile(_arg_1, _local_2, "image/gif");
            _local_3.addEventListener("AssetLoaderEventComplete", onPreviewImageReady);
        }

        private function onPreviewImageReady(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                setPreviewFromAsset(_local_2.assetName);
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_6546 = "_-z1B" (String#2055, DoABC#4)
// _SafeStr_6549 = "_-n1a" (String#1466, DoABC#4)
// _SafeStr_6745 = "_-q1f" (String#4472, DoABC#4)
// _SafeStr_6746 = "_-C1q" (String#7020, DoABC#4)


