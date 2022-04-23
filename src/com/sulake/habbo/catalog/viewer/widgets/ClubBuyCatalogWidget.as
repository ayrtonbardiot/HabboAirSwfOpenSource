// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.club.ClubBuyController;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.club.ClubBuyItem;
    import com.sulake.habbo.catalog.viewer._SafeStr_3229;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.catalog.viewer.CatalogPage;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;

    public class ClubBuyCatalogWidget extends CatalogWidget implements _SafeStr_3303, IVipBuyCatalogWidget 
    {

        private var _SafeStr_4360:ClubBuyController;
        private var _offers:Array;

        public function ClubBuyCatalogWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function dispose():void
        {
            if (_SafeStr_4360 != null)
            {
                _SafeStr_4360.unRegisterVisualization(this);
            };
            _SafeStr_4360 = null;
            reset();
            super.dispose();
        }

        public function get isGift():Boolean
        {
            return (false);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            _offers = [];
            attachWidgetView("clubBuyWidget");
            _SafeStr_4360 = (page.viewer.catalog as HabboCatalog).getClubBuyController();
            _SafeStr_4360.registerVisualization(this);
            _SafeStr_4360.requestOffers(0);
            return (true);
        }

        public function reset():void
        {
            for each (var _local_1:ClubBuyItem in _offers)
            {
                _local_1.dispose();
            };
            _offers = [];
        }

        public function initClubType(_arg_1:int):void
        {
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_8:* = null;
            var _local_7:int;
            var _local_6:int;
            var _local_4:int;
            if (disposed)
            {
                return;
            };
            var _local_3:_SafeStr_3229 = page.viewer;
            if (_local_3)
            {
                _local_5 = (_local_3.catalog as HabboCatalog);
                if (_local_5)
                {
                    _local_2 = _local_5.localization;
                    _local_8 = _local_5.getPurse();
                    if (((_local_8) && (_local_2)))
                    {
                        _local_7 = _local_8.clubDays;
                        _local_6 = _local_8.clubPeriods;
                        _local_4 = ((_local_6 * 31) + _local_7);
                        _local_2.registerParameter("catalog.club.buy.remaining.hc", "days", _local_4);
                        _local_2.registerParameter("catalog.club.buy.remaining.vip", "days", _local_4);
                    };
                };
            };
            try
            {
                if (_window)
                {
                    switch (_arg_1)
                    {
                        case 0:
                            _window.findChildByName("club_header").caption = "${catalog.club.buy.header.none}";
                            _window.findChildByName("club_info").caption = "${catalog.club.buy.info.none}";
                            _window.findChildByName("club_remaining").visible = false;
                            _window.findChildByName("club_remaining_bg").visible = false;
                            break;
                        case 1:
                            _window.findChildByName("club_header").caption = "${catalog.club.buy.header.hc}";
                            _window.findChildByName("club_info").caption = "${catalog.club.buy.info.hc}";
                            _window.findChildByName("club_remaining").caption = "${catalog.club.buy.remaining.hc}";
                            break;
                        case 2:
                            _window.findChildByName("club_header").caption = "${catalog.club.buy.header.vip}";
                            _window.findChildByName("club_info").caption = "${catalog.club.buy.info.vip}";
                            _window.findChildByName("club_remaining").caption = "${catalog.club.buy.remaining.vip}";
                            showClubInfo();
                        default:
                    };
                };
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("ClubBuyCatalogWidget", "initClubType - Window not properly constructed!");
            };
            initLinks();
        }

        private function initLinks():void
        {
            var _local_1:* = null;
            if (_window)
            {
                _local_1 = _window.findChildByName("club_link");
                if (_local_1)
                {
                    _local_1.setParamFlag(1);
                    _local_1.mouseThreshold = 0;
                    _local_1.addEventListener("WME_CLICK", onClickLink);
                };
            };
        }

        public function showOffer(_arg_1:ClubBuyOfferData):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (disposed)
            {
                return;
            };
            _SafeStr_14.log(("Offer: " + [_arg_1.offerId, _arg_1.productCode, _arg_1.priceCredits, _arg_1.vip, _arg_1.months, _arg_1.daysLeftAfterPurchase, _arg_1.year, _arg_1.month, _arg_1.day, _arg_1.upgradeHcPeriodToVip]));
            _arg_1.page = page;
            try
            {
                _local_2 = new ClubBuyItem(_arg_1, (page as CatalogPage));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("ClubBuyCatalogWidget", (((("showOffer - new ClubBuyItem(" + String(_arg_1)) + ", ") + (page as CatalogPage)) + ") crashed!"));
                return;
            };
            if (_arg_1.vip)
            {
                _local_3 = (_window.findChildByName("item_list_vip") as IItemListWindow);
            }
            else
            {
                _local_3 = (_window.findChildByName("item_list_hc") as IItemListWindow);
            };
            if (_local_3 != null)
            {
                _local_3.addListItem(_local_2.window);
            };
            _offers.push(_local_2);
        }

        private function onClickLink(_arg_1:WindowMouseEvent):void
        {
            var _local_3:* = null;
            var _local_4:String = _SafeStr_3109(_arg_1.target).name;
            var _local_2:_SafeStr_19 = (page.viewer.catalog as HabboCatalog);
            switch (_local_4)
            {
                case "club_link":
                    _local_3 = _local_2.getProperty("link.format.club");
                    openExternalLink(_local_3);
                    return;
                default:
                    return;
            };
        }

        private function openExternalLink(_arg_1:String):void
        {
            if (_arg_1 != "")
            {
                page.viewer.catalog.windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, onExternalLink);
                HabboWebTools.navigateToURL(_arg_1, "habboMain");
            };
        }

        private function onExternalLink(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        private function showClubInfo():void
        {
            var _local_2:* = null;
            var _local_1:* = null;
            var _local_3:IItemListWindow = (_window.findChildByName("item_list_hc") as IItemListWindow);
            if (_local_3 != null)
            {
                _local_2 = getAssetXML("club_buy_info_item");
                _local_1 = page.viewer.catalog.windowManager.buildFromXML(_local_2);
                _local_3.addListItem(_local_1);
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3229 = "_-a1p" (String#8259, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)


