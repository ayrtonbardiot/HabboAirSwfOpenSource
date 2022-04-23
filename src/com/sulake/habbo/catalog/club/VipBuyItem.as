// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.club.VipBuyItem

package com.sulake.habbo.catalog.club
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window._SafeStr_3109;

    public class VipBuyItem implements _SafeStr_13 
    {

        private var _offer:ClubBuyOfferData;
        private var _window:_SafeStr_3133;
        private var _catalog:HabboCatalog;
        private var _disposed:Boolean = false;
        private var _SafeStr_8311:String;

        public function VipBuyItem(_arg_1:ClubBuyOfferData, _arg_2:HabboCatalog, _arg_3:String)
        {
            var _local_4:* = null;
            super();
            _offer = _arg_1;
            _catalog = _arg_2;
            _SafeStr_8311 = _arg_3;
            _window = (_catalog.utils.createWindow("vip_buy_item") as _SafeStr_3133);
            var _local_5:_SafeStr_18 = _catalog.localization;
            if (_arg_1.months > 0)
            {
                _local_5.registerParameter("catalog.vip.item.header.months", "num_months", _arg_1.months);
                _local_4 = _local_5.getLocalizationRaw("catalog.vip.item.header.months");
            }
            else
            {
                _local_5.registerParameter("catalog.vip.item.header.days", "num_days", _arg_1.extraDays);
                _local_4 = _local_5.getLocalizationRaw("catalog.vip.item.header.days");
            };
            _window.findChildByName("item_header").caption = ((_local_4 != null) ? _local_4.value : "-");
            _catalog.utils.showPriceInContainer((_window.findChildByName("item_price") as _SafeStr_3133), _offer);
            _window.findChildByName("item_buy").addEventListener("WME_CLICK", onBuy);
            if (_arg_1.giftable)
            {
                _window.findChildByName("item_gift").addEventListener("WME_CLICK", onGift);
            }
            else
            {
                _window.findChildByName("item_gift").visible = false;
            };
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _window.dispose();
                _window = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function onBuy(_arg_1:WindowMouseEvent):void
        {
            _catalog.purchaseWillBeGift(false);
            _catalog.showPurchaseConfirmation(_offer, ((_offer.page == null) ? -1 : _offer.page.pageId));
        }

        private function onGift(_arg_1:WindowMouseEvent):void
        {
            _catalog.purchaseWillBeGift(true);
            _catalog.showPurchaseConfirmation(_offer, ((_offer.page == null) ? -1 : _offer.page.pageId));
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_8311 = "_-K1R" (String#25986, DoABC#4)


