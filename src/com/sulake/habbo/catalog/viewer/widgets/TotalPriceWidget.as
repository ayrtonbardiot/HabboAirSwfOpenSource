// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.TotalPriceWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window._SafeStr_3133;
    import flash.events.Event;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.purse._SafeStr_3226;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IItemListWindow;

    public class TotalPriceWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private static const ELEMENT_TOTAL_PRICE_CONTAINER:String = "totalprice_container";
        private static const ELEMENT_PLUS:String = "plus";
        private static const _SafeStr_8358:String = "amount_text_left";
        private static const ELEMENT_AMOUNT_TEXT_RIGHT:String = "amount_text_right";
        private static const _SafeStr_8359:String = "total_left";
        private static const ELEMENT_TOTAL_RIGHT:String = "total_right";
        private static const _SafeStr_8360:String = "currency_indicator_bitmap_left";
        private static const ELEMENT_CURRENCY_INDICATOR_BITMAP_RIGHT:String = "currency_indicator_bitmap_right";

        private var _catalog:HabboCatalog;
        private var _SafeStr_6856:int;
        private var _SafeStr_6857:int;
        private var _SafeStr_6862:int;
        private var _SafeStr_6858:_SafeStr_3109;
        private var _SafeStr_6859:_SafeStr_3109;
        private var _SafeStr_6860:_SafeStr_3133;
        private var _SafeStr_6861:_SafeStr_3133;
        private var _SafeStr_4892:int = 1;

        public function TotalPriceWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                _catalog = null;
                events.removeEventListener("CWSE_VALUE_CHANGED", onSpinnerValueChangedEvent);
                events.removeEventListener("SELECT_PRODUCT", onSelectProductEvent);
                clear();
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            attachWidgetView("totalPriceWidget");
            window.visible = false;
            if (!_catalog.multiplePurchaseEnabled)
            {
                return (true);
            };
            events.addEventListener("CWSE_VALUE_CHANGED", onSpinnerValueChangedEvent);
            events.addEventListener("SELECT_PRODUCT", onSelectProductEvent);
            events.dispatchEvent(new Event("TOTAL_PRICE_WIDGET_INITIALIZED"));
            return (true);
        }

        private function onSpinnerValueChangedEvent(_arg_1:CatalogWidgetSpinnerEvent):void
        {
            _SafeStr_4892 = _arg_1.value;
            updateCurrencyIndicators();
        }

        private function onSelectProductEvent(_arg_1:SelectProductEvent):void
        {
            window.visible = _arg_1.offer.bundlePurchaseAllowed;
            _SafeStr_6856 = _arg_1.offer.priceInCredits;
            _SafeStr_6857 = _arg_1.offer.priceInActivityPoints;
            _SafeStr_6862 = _arg_1.offer.activityPointType;
            _SafeStr_4892 = 1;
            clear();
            createCurrencyIndicators();
            updateCurrencyIndicators();
        }

        private function clear():void
        {
            _SafeStr_6858 = null;
            _SafeStr_6859 = null;
            _SafeStr_6860 = null;
            _SafeStr_6861 = null;
            _window.findChildByName("plus").visible = false;
            _window.findChildByName("amount_text_left").visible = false;
            if (_window.findChildByName("total_left"))
            {
                _window.findChildByName("total_left").visible = false;
            };
            if (_window.findChildByName("total_right"))
            {
                _window.findChildByName("total_right").visible = false;
            };
            _window.findChildByName("currency_indicator_bitmap_left").visible = false;
        }

        private function updateCurrencyIndicators():void
        {
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_3:int = (_SafeStr_4892 * _SafeStr_6856);
            var _local_5:int = (_SafeStr_4892 * _SafeStr_6857);
            var _local_1:* = _local_3;
            var _local_2:* = _local_5;
            if (_catalog.bundleDiscountEnabled)
            {
                _local_1 = _catalog.utils.calculateBundlePrice(true, _SafeStr_6856, _SafeStr_4892);
                _local_2 = _catalog.utils.calculateBundlePrice(true, _SafeStr_6857, _SafeStr_4892);
            };
            if (_SafeStr_6858 != null)
            {
                _SafeStr_6858.caption = ((_catalog.bundleDiscountEnabled) ? _local_1.toString() : _local_3.toString());
            };
            if (_SafeStr_6859 != null)
            {
                _SafeStr_6859.caption = ((_catalog.bundleDiscountEnabled) ? _local_2.toString() : _local_5.toString());
            };
            if (_SafeStr_6860)
            {
                _SafeStr_6860.visible = (!(_local_3 == _local_1));
                _local_4 = _SafeStr_6860.findChildByName("text");
                _local_4.caption = ((_SafeStr_6860.visible) ? _local_3.toString() : "0");
                _SafeStr_6860.findChildByName("strike").width = _local_4.width;
            };
            if (_SafeStr_6861)
            {
                _SafeStr_6861.visible = (!(_local_5 == _local_2));
                _local_6 = _SafeStr_6861.findChildByName("text");
                _local_6.caption = ((_SafeStr_6861.visible) ? _local_5.toString() : "0");
                _SafeStr_6861.findChildByName("strike").width = _local_6.width;
            };
        }

        private function createCurrencyIndicators():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (_SafeStr_6856 > 0)
            {
                if (_SafeStr_6857 > 0)
                {
                    _SafeStr_6858 = _window.findChildByName("amount_text_left");
                    _SafeStr_6858.visible = true;
                    _SafeStr_6860 = (_window.findChildByName("total_left") as _SafeStr_3133);
                    if (_SafeStr_6860)
                    {
                        _SafeStr_6860.visible = false;
                    };
                    _local_1 = _window.findChildByName("currency_indicator_bitmap_left");
                    _local_1.visible = true;
                    _window.findChildByName("plus").visible = true;
                }
                else
                {
                    _SafeStr_6858 = _window.findChildByName("amount_text_right");
                    _SafeStr_6860 = (_window.findChildByName("total_right") as _SafeStr_3133);
                    if (_SafeStr_6860)
                    {
                        _SafeStr_6860.visible = false;
                    };
                    _local_1 = _window.findChildByName("currency_indicator_bitmap_right");
                };
                if (page.acceptSeasonCurrencyAsCredits)
                {
                    _local_1.style = _SafeStr_3226.getIconStyleFor(_catalog.getSeasonalCurrencyActivityPointType(), _catalog, true, true);
                    _local_1.width = 53;
                }
                else
                {
                    _local_1.style = _SafeStr_3226.getIconStyleFor(-1, _catalog, true);
                    _local_1.width = 22;
                };
            };
            if (_SafeStr_6857 > 0)
            {
                _SafeStr_6859 = ITextWindow(_window.findChildByName("amount_text_right"));
                _SafeStr_6861 = (_window.findChildByName("total_left") as _SafeStr_3133);
                if (_SafeStr_6861)
                {
                    _SafeStr_6861.visible = false;
                };
                _local_2 = _window.findChildByName("currency_indicator_bitmap_right");
                _local_2.style = _SafeStr_3226.getIconStyleFor(_SafeStr_6862, _catalog, true);
            };
            IItemListWindow(_window.findChildByName("totalprice_container")).arrangeListItems();
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3226 = "_-G14" (String#4868, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_4892 = "_-P1m" (String#1893, DoABC#4)
// _SafeStr_6856 = "_-i1m" (String#7038, DoABC#4)
// _SafeStr_6857 = "_-J14" (String#5942, DoABC#4)
// _SafeStr_6858 = "_-6x" (String#7267, DoABC#4)
// _SafeStr_6859 = "_-418" (String#10949, DoABC#4)
// _SafeStr_6860 = "_-1g" (String#4744, DoABC#4)
// _SafeStr_6861 = "_-n1I" (String#5938, DoABC#4)
// _SafeStr_6862 = "_-v3" (String#10018, DoABC#4)
// _SafeStr_8358 = "_-5u" (String#30995, DoABC#4)
// _SafeStr_8359 = "_-9W" (String#38764, DoABC#4)
// _SafeStr_8360 = "_-P1z" (String#41296, DoABC#4)


