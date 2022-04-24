// by nota

//com.sulake.habbo.catalog.viewer.widgets.VipBuyCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.club.ClubBuyController;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.club.VipBuyItem;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;
    import com.sulake.core.window.components.ITextWindow;
    import flash.text.TextFormat;
    import flash.text.StyleSheet;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.catalog.viewer.CatalogPage;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;

    public class VipBuyCatalogWidget extends CatalogWidget implements _SafeStr_3303, IVipBuyCatalogWidget 
    {

        private var _SafeStr_4360:ClubBuyController;
        private var _offers:Array;
        private var _catalog:HabboCatalog;
        private var _SafeStr_6573:Boolean;

        public function VipBuyCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog, _arg_3:Boolean=false)
        {
            super(_arg_1);
            _catalog = _arg_2;
            _SafeStr_6573 = _arg_3;
        }

        public function get isGift():Boolean
        {
            return (_SafeStr_6573);
        }

        override public function dispose():void
        {
            if (_SafeStr_4360 != null)
            {
                _SafeStr_4360.unRegisterVisualization(this);
                _SafeStr_4360 = null;
            };
            reset();
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            _offers = [];
            _SafeStr_4360 = _catalog.getClubBuyController();
            _SafeStr_4360.registerVisualization(this);
            _SafeStr_4360.requestOffers(((_SafeStr_6573) ? 2 : 1));
            return (true);
        }

        public function reset():void
        {
            for each (var _local_1:VipBuyItem in _offers)
            {
                _local_1.dispose();
            };
            _offers = [];
        }

        public function initClubType(_arg_1:int):void
        {
            var _local_5:int;
            var _local_4:int;
            var _local_3:int;
            if (disposed)
            {
                return;
            };
            var _local_2:_SafeStr_18 = _catalog.localization;
            var _local_6:_SafeStr_3142 = _catalog.getPurse();
            if (((!(_local_6 == null)) && (!(_local_2 == null))))
            {
                _local_5 = _local_6.clubDays;
                _local_4 = _local_6.clubPeriods;
                _local_3 = ((_local_4 * 31) + _local_5);
                _local_2.registerParameter("catalog.vip.extend.info", "days", _local_3);
            };
            if ((((!(_window == null)) && (_arg_1 == 2)) && (!(_SafeStr_6573))))
            {
                _window.findChildByName("vip_title").caption = "${catalog.vip.extend.title}";
                _window.findChildByName("vip_info").caption = "${catalog.vip.extend.info}";
            };
            if (_window != null)
            {
                fixFormatting((_window.findChildByName("vip_title") as ITextWindow));
                fixFormatting((_window.findChildByName("vip_info") as ITextWindow), 3);
            };
            initLinks();
        }

        private function fixFormatting(_arg_1:ITextWindow, _arg_2:Number=0):void
        {
            var _local_3:TextFormat = _arg_1.getTextFormat();
            _local_3.align = "center";
            _local_3.leading = _arg_2;
            _arg_1.setTextFormat(_local_3);
        }

        private function initLinks():void
        {
            var _local_2:* = null;
            var _local_1:* = null;
            if (_window)
            {
                _local_2 = _window.findChildByName("vip_link");
                if (_local_2)
                {
                    _local_2.addEventListener("WME_CLICK", onBenefits);
                    _local_2.mouseThreshold = 0;
                };
                _local_1 = (_window.findChildByName("hccenter_link") as ITextWindow);
                if (((_local_1) && (_SafeStr_4360)))
                {
                    _local_1.text = _SafeStr_4360.localization.getLocalization("catalog.vip.buy.hccenter", "catalog.vip.buy.hccenter");
                    setLinkStyle(_local_1);
                };
            };
        }

        private function setLinkStyle(_arg_1:ITextWindow):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_3:StyleSheet = new StyleSheet();
            var _local_2:Object = {};
            _local_2.textDecoration = "underline";
            _local_3.setStyle("a:link", _local_2);
            _arg_1.styleSheet = _local_3;
        }

        public function onBenefits(_arg_1:WindowMouseEvent):void
        {
            _catalog.utils.showVipBenefits();
        }

        public function showOffer(_arg_1:ClubBuyOfferData):void
        {
            var _local_2:* = null;
            if (((disposed) || (!(_arg_1.vip))))
            {
                return;
            };
            _SafeStr_14.log(("Offer: " + [_arg_1.offerId, _arg_1.productCode, _arg_1.priceCredits, _arg_1.vip, _arg_1.months, _arg_1.daysLeftAfterPurchase, _arg_1.year, _arg_1.month, _arg_1.day, _arg_1.upgradeHcPeriodToVip]));
            _arg_1.page = page;
            try
            {
                _local_2 = new VipBuyItem(_arg_1, _catalog, ((_SafeStr_6573) ? "HabboCatalogGift" : "HabboCatalogBuy"));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("ClubBuyCatalogWidget", (((("showOffer - new ClubBuyItem(" + String(_arg_1)) + ", ") + (page as CatalogPage)) + ") crashed!"));
                return;
            };
            var _local_3:IItemListWindow = (_window.findChildByName("item_list_vip") as IItemListWindow);
            if (_local_3 != null)
            {
                _local_3.addListItem(_local_2.window);
            };
            _offers.push(_local_2);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_6573 = "_-oS" (String#10737, DoABC#4)


