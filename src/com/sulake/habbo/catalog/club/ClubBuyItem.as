// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.club.ClubBuyItem

package com.sulake.habbo.catalog.club
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer._SafeStr_3211;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;

    public class ClubBuyItem 
    {

        private var _offer:ClubBuyOfferData;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4715:_SafeStr_3211;

        public function ClubBuyItem(_arg_1:ClubBuyOfferData, _arg_2:_SafeStr_3211)
        {
            var _local_5:* = null;
            var _local_3:* = null;
            super();
            _offer = _arg_1;
            _SafeStr_4715 = _arg_2;
            if (_arg_1.vip)
            {
                _local_5 = getAssetXML("club_buy_vip_item");
            }
            else
            {
                _local_5 = getAssetXML("club_buy_hc_item");
            };
            _window = (_SafeStr_4715.viewer.catalog.windowManager.buildFromXML(_local_5) as _SafeStr_3133);
            var _local_4:_SafeStr_18 = (_arg_2.viewer.catalog as HabboCatalog).localization;
            _local_4.registerParameter("catalog.club.item.header", "months", _arg_1.months);
            _local_3 = _local_4.getLocalizationRaw("catalog.club.item.header");
            _window.findChildByName("item_header").caption = _local_3.value;
            _local_4.registerParameter("catalog.club.price", "price", _arg_1.priceCredits);
            _local_3 = _local_4.getLocalizationRaw("catalog.club.price");
            _window.findChildByName("item_price").caption = _local_3.value;
            var _local_6:_SafeStr_3122 = (_window.findChildByName("item_buy") as _SafeStr_3122);
            if (_local_6 != null)
            {
                _local_6.addEventListener("WME_CLICK", onBuy);
            };
        }

        public function dispose():void
        {
            _window.dispose();
        }

        private function onBuy(_arg_1:WindowMouseEvent):void
        {
            HabboCatalog(_SafeStr_4715.viewer.catalog).showPurchaseConfirmation(_offer, _SafeStr_4715.pageId);
        }

        private function getAssetXML(_arg_1:String):XML
        {
            if (((((!(_SafeStr_4715)) || (!(_SafeStr_4715.viewer))) || (!(_SafeStr_4715.viewer.catalog))) || (!(_SafeStr_4715.viewer.catalog.assets))))
            {
                return (null);
            };
            var _local_2:XmlAsset = (_SafeStr_4715.viewer.catalog.assets.getAssetByName(_arg_1) as XmlAsset);
            if (_local_2 == null)
            {
                return (null);
            };
            return (_local_2.content as XML);
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_4715 = "_-Oe" (String#1538, DoABC#4)


