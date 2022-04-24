// by nota

//com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoViewManager;
    import flash.utils.Timer;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.UpdateableExtraInfoListItem;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import flash.events.TimerEvent;

    public class BundlePurchaseExtraInfoWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private static const PROMO_ITEM_DROP_DELAY_MS:uint = 4000;

        private var _catalog:HabboCatalog;
        private var _SafeStr_6892:ExtraInfoViewManager;
        private var _SafeStr_6894:int = 1;
        private var _SafeStr_6856:int;
        private var _SafeStr_6857:int;
        private var _SafeStr_6862:int;
        private var _SafeStr_8346:String;
        private var _SafeStr_6895:int = -1;
        private var _SafeStr_6896:int = -1;
        private var _SafeStr_6897:int = -1;
        private var _SafeStr_6898:Boolean = false;
        private var _SafeStr_6893:Timer;

        public function BundlePurchaseExtraInfoWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                _SafeStr_6892.dispose();
                _SafeStr_6892 = null;
                _catalog = null;
                _SafeStr_6893.stop();
                _SafeStr_6893.removeEventListener("timerComplete", onPromoItemDropDownTimerEvent);
                _SafeStr_6893 = null;
                events.removeEventListener("CWPPEIE_RESET", onResetEvent);
                events.removeEventListener("CWPPEIE_HIDE", onHideEvent);
                events.removeEventListener("CWSE_VALUE_CHANGED", onSpinnerEvent);
                events.removeEventListener("CWPPEIE_ITEM_CLICKED", onExtraInfoItemClickedEvent);
                super.dispose();
            };
        }

        override public function init():Boolean
        {
            if (!_catalog.multiplePurchaseEnabled)
            {
                return (true);
            };
            _SafeStr_6892 = new ExtraInfoViewManager(this, _catalog);
            events.addEventListener("CWPPEIE_RESET", onResetEvent);
            events.addEventListener("CWPPEIE_HIDE", onHideEvent);
            events.addEventListener("CWSE_VALUE_CHANGED", onSpinnerEvent);
            events.addEventListener("CWPPEIE_ITEM_CLICKED", onExtraInfoItemClickedEvent);
            _SafeStr_6893 = new Timer(4000, 1);
            _SafeStr_6893.addEventListener("timerComplete", onPromoItemDropDownTimerEvent);
            return (true);
        }

        private function createPromoItem():void
        {
            var _local_1:ExtraInfoItemData = new ExtraInfoItemData(0);
            _local_1.quantity = _SafeStr_6894;
            _SafeStr_6895 = _SafeStr_6892.addItem(_local_1);
        }

        private function updatePromoItem(_arg_1:int):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (_SafeStr_6895 != -1)
            {
                _local_3 = UpdateableExtraInfoListItem(_SafeStr_6892.getItem(_SafeStr_6895));
                _local_2 = _local_3.data;
                _local_2.quantity = _arg_1;
                _local_3.update(_local_2);
            };
        }

        private function removePromoItem():void
        {
            if (_SafeStr_6895 != -1)
            {
                _SafeStr_6892.removeItem(_SafeStr_6895);
                _SafeStr_6895 = -1;
            };
        }

        private function createDiscountValueItem():void
        {
            var _local_1:ExtraInfoItemData = new ExtraInfoItemData(2);
            _local_1.quantity = _SafeStr_6894;
            _local_1.priceActivityPoints = _SafeStr_6857;
            _local_1.activityPointType = _SafeStr_6862;
            _local_1.priceCredits = _SafeStr_6856;
            _SafeStr_6896 = _SafeStr_6892.addItem(_local_1);
            _catalog.utils.discountShownEventTrack();
        }

        private function updateDiscountValueItem(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_SafeStr_6896 != -1)
            {
                _local_2 = UpdateableExtraInfoListItem(_SafeStr_6892.getItem(_SafeStr_6896));
                _local_3 = _local_2.data;
                _local_3.quantity = _arg_1;
                _local_3.discountPriceCredits = _catalog.utils.calculateBundlePrice(true, _SafeStr_6856, _arg_1);
                _local_3.discountPriceActivityPoints = _catalog.utils.calculateBundlePrice(true, _SafeStr_6857, _arg_1);
                _local_2.update(_local_3);
            };
        }

        private function removeDiscountValueItem():void
        {
            if (_SafeStr_6896 != -1)
            {
                _SafeStr_6892.removeItem(_SafeStr_6896);
                _SafeStr_6896 = -1;
            };
        }

        private function createBundleInfoItem():void
        {
            var _local_1:ExtraInfoItemData = new ExtraInfoItemData(1);
            _SafeStr_6897 = _SafeStr_6892.addItem(_local_1);
            _catalog.utils.bundlesInfoShownEventTrack();
        }

        private function removeBundleInfoItem():void
        {
            if (_SafeStr_6897 != -1)
            {
                _SafeStr_6892.removeItem(_SafeStr_6897);
                _SafeStr_6897 = -1;
            };
        }

        private function onResetEvent(_arg_1:CatalogWidgetBundleDisplayExtraInfoEvent):void
        {
            if (disposed)
            {
                return;
            };
            window.visible = true;
            _SafeStr_6856 = _arg_1.data.priceCredits;
            _SafeStr_6857 = _arg_1.data.priceActivityPoints;
            _SafeStr_6862 = _arg_1.data.activityPointType;
            _SafeStr_8346 = _arg_1.data.badgeCode;
            _SafeStr_6892.clear();
            _SafeStr_6896 = -1;
            _SafeStr_6895 = -1;
            _SafeStr_6893.start();
        }

        private function onSpinnerEvent(_arg_1:CatalogWidgetSpinnerEvent):void
        {
            if (disposed)
            {
                return;
            };
            if (!_catalog.bundleDiscountEnabled)
            {
                return;
            };
            if (_arg_1.type == "CWSE_VALUE_CHANGED")
            {
                if (_arg_1.value != _SafeStr_6894)
                {
                    if (((_arg_1.value >= _catalog.bundleDiscountRuleset.bundleSize) && (_SafeStr_6896 == -1)))
                    {
                        createDiscountValueItem();
                    }
                    else
                    {
                        if (_arg_1.value < _catalog.bundleDiscountRuleset.bundleSize)
                        {
                            removeDiscountValueItem();
                        };
                    };
                    updatePromoItem(_arg_1.value);
                    updateDiscountValueItem(_arg_1.value);
                    _SafeStr_6894 = _arg_1.value;
                    removeBundleInfoItem();
                    if (_SafeStr_6894 >= _catalog.utils.bundleDiscountHighestFlatPriceStep)
                    {
                        removePromoItem();
                        _SafeStr_6898 = true;
                    }
                    else
                    {
                        if (_SafeStr_6898)
                        {
                            createPromoItem();
                            _SafeStr_6898 = false;
                        };
                    };
                    _catalog.utils.spinnerValueChangedEventTrack();
                };
            };
        }

        private function onHideEvent(_arg_1:CatalogWidgetBundleDisplayExtraInfoEvent):void
        {
            window.visible = false;
        }

        private function onExtraInfoItemClickedEvent(_arg_1:CatalogWidgetBundleDisplayExtraInfoEvent):void
        {
            switch (_arg_1.id)
            {
                case _SafeStr_6895:
                    if (_SafeStr_6897 == -1)
                    {
                        createBundleInfoItem();
                    };
                    return;
                case _SafeStr_6897:
                    removeBundleInfoItem();
                    return;
            };
        }

        private function onPromoItemDropDownTimerEvent(_arg_1:TimerEvent):void
        {
            createPromoItem();
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_6856 = "_-i1m" (String#7038, DoABC#4)
// _SafeStr_6857 = "_-J14" (String#5942, DoABC#4)
// _SafeStr_6862 = "_-v3" (String#10018, DoABC#4)
// _SafeStr_6892 = "_-T1J" (String#5009, DoABC#4)
// _SafeStr_6893 = "_-MD" (String#7952, DoABC#4)
// _SafeStr_6894 = "_-Zh" (String#10501, DoABC#4)
// _SafeStr_6895 = "_-k1g" (String#6235, DoABC#4)
// _SafeStr_6896 = "_-ty" (String#6031, DoABC#4)
// _SafeStr_6897 = "_-XR" (String#7887, DoABC#4)
// _SafeStr_6898 = "_-b1S" (String#13532, DoABC#4)
// _SafeStr_8346 = "_-32X" (String#23281, DoABC#4)


