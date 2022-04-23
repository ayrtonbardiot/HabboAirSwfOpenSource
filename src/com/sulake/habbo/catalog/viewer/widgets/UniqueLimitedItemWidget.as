// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.UniqueLimitedItemWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.window.utils.ILimitedItemOverlay;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import flash.utils.Timer;
    import com.sulake.habbo.window.widgets.ILimitedItemSupplyLeftOverlayWidget;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.ProductOfferUpdatedEvent;
    import flash.events.TimerEvent;

    public class UniqueLimitedItemWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private static const SUPPLY_REFRESH_PERIOD_MS:int = 20000;

        private var _catalog:HabboCatalog;
        private var _overlay:ILimitedItemOverlay;
        private var _SafeStr_6678:_SafeStr_3141;
        private var _SafeStr_6677:Timer;
        private var _overlayWidget:ILimitedItemSupplyLeftOverlayWidget;

        public function UniqueLimitedItemWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_6677 != null)
                {
                    _SafeStr_6677.stop();
                    _SafeStr_6677.removeEventListener("timer", onSupplyLeftTimer);
                    _SafeStr_6677 = null;
                };
                window.visible = false;
                _catalog = null;
                _SafeStr_6678 = null;
                if (_overlay)
                {
                    _overlay.dispose();
                    _overlay = null;
                };
                events.removeEventListener("SELECT_PRODUCT", onSelectProduct);
                events.removeEventListener("CWE_PRODUCT_OFFER_UPDATED", onOfferUpdated);
                super.dispose();
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            var _local_1:_SafeStr_3199 = _SafeStr_3199(_window.findChildByName("unique_item_overlay_container"));
            _overlayWidget = ILimitedItemSupplyLeftOverlayWidget(_local_1.widget);
            window.visible = false;
            events.addEventListener("SELECT_PRODUCT", onSelectProduct);
            events.addEventListener("CWE_PRODUCT_OFFER_UPDATED", onOfferUpdated);
            _SafeStr_6677 = new Timer(20000);
            _SafeStr_6677.addEventListener("timer", onSupplyLeftTimer);
            return (true);
        }

        private function onSelectProduct(_arg_1:SelectProductEvent):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_6678 = _arg_1.offer;
            update(_arg_1.offer, true);
        }

        private function onOfferUpdated(_arg_1:ProductOfferUpdatedEvent):void
        {
            _SafeStr_6678 = _arg_1.offer;
            update(_arg_1.offer);
        }

        private function update(_arg_1:_SafeStr_3141, _arg_2:Boolean=false):void
        {
            var _local_3:* = null;
            if (((_arg_1.pricingModel == "pricing_model_single") && (_arg_1.product.isUniqueLimitedItem)))
            {
                _local_3 = _arg_1.product;
                _overlayWidget.supplyLeft = _local_3.uniqueLimitedItemsLeft;
                _overlayWidget.seriesSize = _local_3.uniqueLimitedItemSeriesSize;
                window.visible = true;
                if (_arg_2)
                {
                    _catalog.sendGetProductOffer(_arg_1.offerId);
                };
                _SafeStr_6677.start();
            }
            else
            {
                window.visible = false;
                _SafeStr_6677.stop();
            };
        }

        private function onSupplyLeftTimer(_arg_1:TimerEvent):void
        {
            if (((_window.visible) && (!(_SafeStr_6678 == null))))
            {
                update(_SafeStr_6678, true);
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_6677 = "_-i1q" (String#6986, DoABC#4)
// _SafeStr_6678 = "_-W1r" (String#8129, DoABC#4)


