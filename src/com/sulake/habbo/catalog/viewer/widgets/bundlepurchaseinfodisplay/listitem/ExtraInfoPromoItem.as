// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoPromoItem

package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.UpdateableExtraInfoListItem;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget;
    import flash.utils.Timer;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.catalog.HabboCatalogUtils;
    import flash.display.BitmapData;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class ExtraInfoPromoItem extends UpdateableExtraInfoListItem 
    {

        private static const _SafeStr_8337:String = "catalog.bundlewidget.discount.promo";

        private var _window:_SafeStr_3133 = null;
        private var _SafeStr_6974:Boolean = true;
        private var _catalog:HabboCatalog;
        private var _SafeStr_6991:_SafeStr_24;
        private var _SafeStr_6990:int = 0;
        private var _SafeStr_4981:BundlePurchaseExtraInfoWidget;
        private var _SafeStr_6992:Number = 0;
        private var _SafeStr_6989:Timer;

        public function ExtraInfoPromoItem(_arg_1:BundlePurchaseExtraInfoWidget, _arg_2:int, _arg_3:ExtraInfoItemData, _arg_4:HabboCatalog)
        {
            super(null, _arg_2, _arg_3, 0);
            _SafeStr_4981 = _arg_1;
            _catalog = _arg_4;
            createNextDiscountMap();
            resolveNextDiscountLevel();
            _SafeStr_6989 = new Timer(50);
            _SafeStr_6989.addEventListener("timer", onEffectTimer);
            _SafeStr_6989.start();
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                _SafeStr_6989.stop();
                _SafeStr_6989.removeEventListener("timer", onEffectTimer);
                _SafeStr_6989 = null;
                _SafeStr_6991 = null;
                _catalog = null;
                super.dispose();
            };
        }

        override public function update(_arg_1:ExtraInfoItemData):void
        {
            super.update(_arg_1);
            var _local_2:int = _SafeStr_6990;
            resolveNextDiscountLevel();
            if (_SafeStr_6990 != _local_2)
            {
                _SafeStr_6992 = 1;
            };
            _SafeStr_6974 = true;
            render();
        }

        override public function getRenderedWindow():_SafeStr_3133
        {
            if (_window == null)
            {
                createWindow();
            };
            if (_SafeStr_6974)
            {
                render();
            };
            return (_window);
        }

        private function createWindow():void
        {
            _window = _SafeStr_3133(_catalog.utils.createWindow("discountPromoItem"));
            _window.procedure = windowProcedure;
            var _local_1:_SafeStr_3264 = _SafeStr_3264(_window.findChildByName("icon_bitmap"));
            HabboCatalogUtils.replaceCenteredImage(_local_1, BitmapData(_catalog.assets.getAssetByName("thumb_up").content).clone());
        }

        private function render():void
        {
            _catalog.localization.registerParameter("catalog.bundlewidget.discount.promo", "quantity", _SafeStr_6990.toString());
            _catalog.localization.registerParameter("catalog.bundlewidget.discount.promo", "discount", _SafeStr_6991.getValue(_SafeStr_6990));
            var _local_1:String = _catalog.localization.getLocalizationRaw("catalog.bundlewidget.discount.promo").value;
            _window.findChildByName("promo_text").caption = _local_1;
            _window.findChildByName("promo_text_effect").caption = _local_1;
            _SafeStr_6974 = false;
        }

        private function resolveNextDiscountLevel():void
        {
            var _local_2:int;
            var _local_1:Array = _SafeStr_6991.getKeys();
            _local_2 = 0;
            while (_local_2 < _local_1.length)
            {
                if (_local_1[_local_2] > data.quantity)
                {
                    _SafeStr_6990 = _local_1[_local_2];
                    return;
                };
                _local_2++;
            };
        }

        private function createNextDiscountMap():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_1:int;
            _SafeStr_6991 = new _SafeStr_24();
            _local_2 = 1;
            _local_3 = 0;
            while (_local_2 <= 100)
            {
                _local_4 = _catalog.utils.calculateBundlePrice(true, 1, _local_2);
                _local_1 = (_local_2 - _local_4);
                if (((_local_1 > _local_3) && (_catalog.utils.bundleDiscountFlatPriceSteps.indexOf(_local_2) == -1)))
                {
                    _SafeStr_6991.add(_local_2, _local_1);
                    _local_3 = _local_1;
                };
                _local_2++;
            };
        }

        private function onEffectTimer(_arg_1:TimerEvent):void
        {
            if (_SafeStr_6992 > 0)
            {
                _SafeStr_6992 = (_SafeStr_6992 - 0.1);
                if (_SafeStr_6992 < 0)
                {
                    _SafeStr_6992 = 0;
                };
                _window.findChildByName("promo_text_effect").blend = _SafeStr_6992;
            };
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_2.name == "click_region")
            {
                switch (_arg_1.type)
                {
                    case "WME_CLICK":
                        _SafeStr_4981.events.dispatchEvent(new CatalogWidgetBundleDisplayExtraInfoEvent("CWPPEIE_ITEM_CLICKED", data, id));
                        return;
                    case "WME_OVER":
                        ITextWindow(_window.findChildByName("promo_text")).textColor = 12582911;
                        return;
                    case "WME_OUT":
                        ITextWindow(_window.findChildByName("promo_text")).textColor = 0xFFFFFF;
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6974 = "_-41T" (String#6033, DoABC#4)
// _SafeStr_6989 = "_-Q1N" (String#8058, DoABC#4)
// _SafeStr_6990 = "_-Z1g" (String#10509, DoABC#4)
// _SafeStr_6991 = "_-f18" (String#10171, DoABC#4)
// _SafeStr_6992 = "_-21u" (String#6799, DoABC#4)
// _SafeStr_8337 = "_-qp" (String#31660, DoABC#4)


