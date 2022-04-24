// by nota

//com.sulake.habbo.catalog.club.ClubBuyController

package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog.viewer.widgets.IVipBuyCatalogWidget;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.communication.connection.IConnection;
    import _-AE._SafeStr_1540;
    import _-g1G._SafeStr_1381;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;

    public class ClubBuyController 
    {

        private var _visualization:IVipBuyCatalogWidget;
        private var _catalog:HabboCatalog;
        private var _offers:Array;
        private var _SafeStr_3842:ClubBuyConfirmationDialog;
        private var _connection:IConnection;
        private var _disposed:Boolean = false;

        public function ClubBuyController(_arg_1:HabboCatalog, _arg_2:IConnection)
        {
            _catalog = _arg_1;
            _connection = _arg_2;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (_visualization != null)
            {
                _visualization.dispose();
                _visualization = null;
            };
            reset();
            closeConfirmation();
            _catalog = null;
            _disposed = true;
        }

        public function get catalog():HabboCatalog
        {
            return (_catalog);
        }

        public function reset():void
        {
            for each (var _local_1:ClubBuyOfferData in _offers)
            {
                _local_1.dispose();
            };
            _offers = [];
        }

        public function onOffers(_arg_1:_SafeStr_1381):void
        {
            var _local_9:* = null;
            var _local_6:* = null;
            var _local_7:Boolean;
            var _local_3:* = null;
            var _local_8:int;
            if (_disposed)
            {
                return;
            };
            reset();
            var _local_5:int;
            for each (var _local_2:_SafeStr_1540 in _arg_1.offers)
            {
                _local_6 = new ClubBuyOfferData(_local_2.offerId, _local_2.productCode, _local_2.priceCredits, _local_2.priceActivityPoints, _local_2.priceActivityPointType, _local_2.vip, _local_2.months, _local_2.extraDays, _local_2.daysLeftAfterPurchase, _local_2.year, _local_2.month, _local_2.day, _local_2.isGiftable);
                _offers.push(_local_6);
                if (_local_2.vip)
                {
                    _local_5++;
                    _local_9 = _local_6;
                };
            };
            if (_local_5 == 1)
            {
                _local_9.upgradeHcPeriodToVip = true;
            };
            _offers.sort(orderByPrecedence);
            if (_visualization != null)
            {
                _visualization.reset();
                _visualization.initClubType(getClubType());
                _local_7 = _visualization.isGift;
                _local_3 = getPromotedMonths(_local_7);
                for each (var _local_4:ClubBuyOfferData in _offers)
                {
                    if (_local_4.months > 0)
                    {
                        if (_local_3.length > 0)
                        {
                            _local_8 = _local_4.months;
                            if (_local_3.indexOf(_local_8) == -1) continue;
                        };
                        _visualization.showOffer(_local_4);
                    };
                };
            };
        }

        private function getPromotedMonths(_arg_1:Boolean):Array
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_6:Number;
            var _local_2:Array = [];
            var _local_7:String = ((_arg_1) ? "catalog.vip.gift.promo" : "catalog.vip.buy.promo");
            if (_catalog.propertyExists(_local_7))
            {
                _local_4 = _catalog.getProperty(_local_7, null);
                if (((!(_local_4 == null)) && (_local_4.length > 0)))
                {
                    _local_3 = _local_4.split(",");
                    if (_local_3.length > 0)
                    {
                        for each (var _local_5:String in _local_3)
                        {
                            _local_6 = parseInt(_local_5);
                            if (((!(isNaN(_local_6))) && (_local_6 > 0)))
                            {
                                _local_2.push(_local_6);
                            };
                        };
                    };
                };
            };
            return (_local_2);
        }

        public function unRegisterVisualization(_arg_1:IVipBuyCatalogWidget):void
        {
            if (_visualization == _arg_1)
            {
                _visualization = null;
            };
        }

        public function registerVisualization(_arg_1:IVipBuyCatalogWidget):void
        {
            _visualization = _arg_1;
        }

        public function requestOffers(_arg_1:int):void
        {
            _catalog.getHabboClubOffers(_arg_1);
        }

        public function showConfirmation(_arg_1:ClubBuyOfferData, _arg_2:int):void
        {
            closeConfirmation();
            _SafeStr_3842 = new ClubBuyConfirmationDialog(this, _arg_1, _arg_2);
        }

        public function confirmSelection(_arg_1:ClubBuyOfferData, _arg_2:int):void
        {
            if (((!(_catalog)) || (!(_catalog.connection))))
            {
                return;
            };
            _catalog.purchaseProduct(_arg_2, _arg_1.offerId);
            closeConfirmation();
        }

        public function closeConfirmation():void
        {
            if (_SafeStr_3842)
            {
                _SafeStr_3842.dispose();
                _SafeStr_3842 = null;
            };
        }

        public function getClubType():int
        {
            var _local_1:int;
            if (_catalog.getPurse().hasClubLeft)
            {
                _local_1 = ((_catalog.getPurse().isVIP) ? 2 : 1);
            };
            return (_local_1);
        }

        public function get hasClub():Boolean
        {
            if (((!(_catalog)) || (!(_catalog.getPurse()))))
            {
                return (false);
            };
            return (_catalog.getPurse().clubDays > 0);
        }

        public function get windowManager():_SafeStr_1695
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.windowManager);
        }

        public function get localization():_SafeStr_18
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.localization);
        }

        public function get assets():_SafeStr_21
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.assets);
        }

        public function get roomEngine():IRoomEngine
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.roomEngine);
        }

        public function getProductData(_arg_1:String):_SafeStr_3182
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.getProductData(_arg_1));
        }

        public function getPurse():_SafeStr_3142
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.getPurse());
        }

        private function orderByPrecedence(_arg_1:ClubBuyOfferData, _arg_2:ClubBuyOfferData):Number
        {
            var _local_3:Number = _arg_1.months;
            var _local_4:Number = _arg_2.months;
            if (_local_3 < _local_4)
            {
                return (-1);
            };
            if (_local_3 > _local_4)
            {
                return (1);
            };
            return (0);
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_1381 = "_-86" (String#28730, DoABC#4)
// _SafeStr_1540 = "_-E1Y" (String#32379, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3842 = "_-413" (String#1546, DoABC#4)


