// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.marketplace.MarketPlaceLogic

package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.localization._SafeStr_18;
    import _-CH._SafeStr_238;
    import _-qw._SafeStr_598;
    import _-kC._SafeStr_1265;
    import _-qw._SafeStr_1590;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-qw._SafeStr_522;
    import _-kC._SafeStr_1233;
    import _-qw._SafeStr_1008;
    import _-kC._SafeStr_1385;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-qw._SafeStr_868;
    import _-kC._SafeStr_1423;

    public class MarketPlaceLogic implements IMarketPlace 
    {

        private static const TYPE_POSTER:String = "poster";

        public const PURCHASE_CONFIRM_TYPE_NORMAL:int = 1;
        public const PURCHASE_CONFIRM_TYPE_HIGHER:int = 2;
        public const _SafeStr_8316:int = 3;

        private var _catalog:HabboCatalog;
        private var _windowManager:_SafeStr_1695;
        private var _roomEngine:IRoomEngine;
        private var _visualization:IMarketPlaceVisualization;
        private var _SafeStr_3842:MarketplaceConfirmationDialog;
        private var _latestOffers:_SafeStr_24;
        private var _latestOwnOffers:_SafeStr_24;
        private var _SafeStr_4797:int;
        private var _SafeStr_4522:int = -1;
        private var _SafeStr_4796:_SafeStr_3209;
        private var _SafeStr_4520:int;
        private var _SafeStr_4521:int;
        private var _SafeStr_4795:int;
        private var _minPrice:int = 0;
        private var _maxPrice:int = 0;
        private var _searchString:String = "";
        private var _SafeStr_4794:int = -1;
        private var _disposed:Boolean = false;

        public function MarketPlaceLogic(_arg_1:HabboCatalog, _arg_2:_SafeStr_1695, _arg_3:IRoomEngine)
        {
            _catalog = _arg_1;
            _windowManager = _arg_2;
            _roomEngine = _arg_3;
            getConfiguration();
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _catalog = null;
            _windowManager = null;
            if (_latestOffers != null)
            {
                disposeOffers(_latestOffers);
                _latestOffers = null;
            };
            if (_latestOwnOffers != null)
            {
                disposeOffers(_latestOwnOffers);
                _latestOwnOffers = null;
            };
            _disposed = true;
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get localization():_SafeStr_18
        {
            return (_catalog.localization);
        }

        public function registerVisualization(_arg_1:IMarketPlaceVisualization=null):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _visualization = _arg_1;
        }

        private function getConfiguration():void
        {
            if (((!(_catalog)) || (!(_catalog.connection))))
            {
                return;
            };
            _catalog.connection.send(new _SafeStr_238());
        }

        private function showConfirmation(_arg_1:int, _arg_2:MarketPlaceOfferData):void
        {
            if (!_SafeStr_3842)
            {
                _SafeStr_3842 = new MarketplaceConfirmationDialog(this, _catalog, _roomEngine);
            };
            _SafeStr_3842.showConfirmation(_arg_1, _arg_2);
        }

        public function requestOffersByName(_arg_1:String):void
        {
            if (_catalog)
            {
                _catalog.getPublicMarketPlaceOffers(-1, -1, _arg_1, -1);
            };
        }

        public function requestOffersByPrice(_arg_1:int):void
        {
            if (_catalog)
            {
                _catalog.getPublicMarketPlaceOffers(_arg_1, -1, "", -1);
            };
        }

        public function requestOffers(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):void
        {
            _minPrice = _arg_1;
            _maxPrice = _arg_2;
            _searchString = _arg_3;
            _SafeStr_4794 = _arg_4;
            if (_catalog)
            {
                _catalog.getPublicMarketPlaceOffers(_arg_1, _arg_2, _arg_3, _arg_4);
            };
        }

        public function refreshOffers():void
        {
            requestOffers(_minPrice, _maxPrice, _searchString, _SafeStr_4794);
        }

        public function requestOwnItems():void
        {
            if (_catalog)
            {
                _catalog.getOwnMarketPlaceOffers();
            };
        }

        public function requestItemStats(_arg_1:int, _arg_2:int):void
        {
            if (_catalog)
            {
                _SafeStr_4521 = _arg_2;
                _SafeStr_4520 = _arg_1;
                _catalog.getMarketplaceItemStats(_arg_1, _arg_2);
            };
        }

        public function buyOffer(_arg_1:int):void
        {
            if ((((!(_latestOffers)) || (!(_catalog))) || (!(_catalog.getPurse()))))
            {
                return;
            };
            var _local_2:MarketPlaceOfferData = (_latestOffers.getValue(_arg_1) as MarketPlaceOfferData);
            if (!_local_2)
            {
                return;
            };
            if (_catalog.getPurse().credits < _local_2.price)
            {
                _catalog.showNotEnoughCreditsAlert();
                return;
            };
            showConfirmation(1, _local_2);
        }

        public function redeemExpiredOffer(_arg_1:int):void
        {
            if (_catalog)
            {
                _catalog.redeemExpiredMarketPlaceOffer(_arg_1);
            };
        }

        private function disposeOffers(_arg_1:_SafeStr_24):void
        {
            if (_arg_1 != null)
            {
                for each (var _local_2:MarketPlaceOfferData in _arg_1)
                {
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    };
                };
                _arg_1.dispose();
            };
        }

        public function onOffers(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_4:_SafeStr_598 = (_arg_1 as _SafeStr_598);
            if (_local_4 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1265 = (_local_4.getParser() as _SafeStr_1265);
            if (_local_2 == null)
            {
                return;
            };
            disposeOffers(_latestOffers);
            _latestOffers = new _SafeStr_24();
            for each (var _local_5:_SafeStr_1590 in _local_2.offers)
            {
                _local_3 = new MarketPlaceOfferData(_local_5.offerId, _local_5.furniId, _local_5.furniType, _local_5.extraData, _local_5.stuffData, _local_5.price, _local_5.status, _local_5.averagePrice, _local_5.offerCount);
                _local_3.timeLeftMinutes = _local_5.timeLeftMinutes;
                _latestOffers.add(_local_5.offerId, _local_3);
            };
            _SafeStr_4795 = _local_2.totalItemsFound;
            if (_visualization != null)
            {
                _visualization.listUpdatedNotify();
            };
        }

        public function onOwnOffers(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_4:_SafeStr_522 = (_arg_1 as _SafeStr_522);
            if (_local_4 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1233 = (_local_4.getParser() as _SafeStr_1233);
            if (_local_2 == null)
            {
                return;
            };
            disposeOffers(_latestOwnOffers);
            _latestOwnOffers = new _SafeStr_24();
            _SafeStr_4797 = _local_2.creditsWaiting;
            for each (var _local_5:_SafeStr_1590 in _local_2.offers)
            {
                _local_3 = new MarketPlaceOfferData(_local_5.offerId, _local_5.furniId, _local_5.furniType, _local_5.extraData, _local_5.stuffData, _local_5.price, _local_5.status, _local_5.averagePrice);
                _local_3.timeLeftMinutes = _local_5.timeLeftMinutes;
                _latestOwnOffers.add(_local_5.offerId, _local_3);
            };
            if (_visualization != null)
            {
                _visualization.listUpdatedNotify();
            };
        }

        public function onBuyResult(_arg_1:IMessageEvent):void
        {
            var event = _arg_1;
            var buyEvent:_SafeStr_1008 = (event as _SafeStr_1008);
            if (event == null)
            {
                return;
            };
            var parser:_SafeStr_1385 = (buyEvent.getParser() as _SafeStr_1385);
            if (parser == null)
            {
                return;
            };
            if (parser.result == 1)
            {
                refreshOffers();
            }
            else
            {
                if (parser.result == 2)
                {
                    var item:MarketPlaceOfferData = _latestOffers.remove(parser.requestedOfferId);
                    if (item != null)
                    {
                        item.dispose();
                    };
                    if (_visualization != null)
                    {
                        _visualization.listUpdatedNotify();
                    };
                    if (_windowManager != null)
                    {
                        _windowManager.alert("${catalog.marketplace.not_available_title}", "${catalog.marketplace.not_available_header}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                        {
                            _arg_1.dispose();
                        });
                    };
                }
                else
                {
                    if (parser.result == 3)
                    {
                        var updateItem:MarketPlaceOfferData = (_latestOffers.getValue(parser.requestedOfferId) as MarketPlaceOfferData);
                        if (updateItem)
                        {
                            updateItem.offerId = parser.offerId;
                            updateItem.price = parser.newPrice;
                            updateItem.offerCount--;
                            _latestOffers.add(parser.offerId, updateItem);
                        };
                        _latestOffers.remove(parser.requestedOfferId);
                        showConfirmation(2, updateItem);
                        if (_visualization != null)
                        {
                            _visualization.listUpdatedNotify();
                        };
                    }
                    else
                    {
                        if (parser.result == 4)
                        {
                            if (_windowManager != null)
                            {
                                _windowManager.alert("${catalog.alert.notenough.title}", "${catalog.alert.notenough.credits.description}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                                {
                                    _arg_1.dispose();
                                });
                            };
                        };
                    };
                };
            };
        }

        public function onCancelResult(_arg_1:IMessageEvent):void
        {
            var event = _arg_1;
            var cancelEvent:_SafeStr_868 = (event as _SafeStr_868);
            if (event == null)
            {
                return;
            };
            var parser:_SafeStr_1423 = (cancelEvent.getParser() as _SafeStr_1423);
            if (parser == null)
            {
                return;
            };
            if (parser.success)
            {
                var item:MarketPlaceOfferData = _latestOwnOffers.remove(parser.offerId);
                if (item != null)
                {
                    item.dispose();
                };
                if (_visualization != null)
                {
                    _visualization.listUpdatedNotify();
                };
            }
            else
            {
                if (_windowManager != null)
                {
                    _windowManager.alert("${catalog.marketplace.operation_failed.topic}", "${catalog.marketplace.cancel_failed}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                    {
                        _arg_1.dispose();
                    });
                };
            };
        }

        public function latestOffers():_SafeStr_24
        {
            return (_latestOffers);
        }

        public function latestOwnOffers():_SafeStr_24
        {
            return (_latestOwnOffers);
        }

        public function totalItemsFound():int
        {
            return (_SafeStr_4795);
        }

        public function set itemStats(_arg_1:_SafeStr_3209):void
        {
            if (((!(_arg_1.furniCategoryId == _SafeStr_4520)) || (!(_arg_1.furniTypeId == _SafeStr_4521))))
            {
                return;
            };
            _SafeStr_4796 = _arg_1;
            if (_visualization != null)
            {
                _visualization.updateStats();
            };
        }

        public function get itemStats():_SafeStr_3209
        {
            return (_SafeStr_4796);
        }

        public function get creditsWaiting():int
        {
            return (_SafeStr_4797);
        }

        public function get averagePricePeriod():int
        {
            return (_SafeStr_4522);
        }

        public function set averagePricePeriod(_arg_1:int):void
        {
            _SafeStr_4522 = _arg_1;
        }

        private function isPosterItem(_arg_1:IMarketPlaceOfferData):Boolean
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:Boolean;
            if (((_arg_1.furniType == 2) && (!(_arg_1.extraData == null))))
            {
                _local_2 = _catalog.getFurnitureData(_arg_1.furniId, "i");
                if (_local_2)
                {
                    _local_3 = _local_2.className;
                    if (((!(_local_3 == null)) && (_local_3 == "poster")))
                    {
                        _local_4 = true;
                    };
                };
            };
            return (_local_4);
        }

        public function getNameLocalizationKey(_arg_1:IMarketPlaceOfferData):String
        {
            var _local_2:String = "";
            if (_arg_1 != null)
            {
                if (isPosterItem(_arg_1))
                {
                    _local_2 = (("poster_" + _arg_1.extraData) + "_name");
                }
                else
                {
                    if (_arg_1.furniType == 1)
                    {
                        _local_2 = ("roomItem.name." + _arg_1.furniId);
                    }
                    else
                    {
                        if (_arg_1.furniType == 2)
                        {
                            _local_2 = ("wallItem.name." + _arg_1.furniId);
                        };
                    };
                };
            };
            return (_local_2);
        }

        public function getDescriptionLocalizationKey(_arg_1:IMarketPlaceOfferData):String
        {
            var _local_2:String = "";
            if (_arg_1 != null)
            {
                if (isPosterItem(_arg_1))
                {
                    _local_2 = (("poster_" + _arg_1.extraData) + "_desc");
                }
                else
                {
                    if (_arg_1.furniType == 1)
                    {
                        _local_2 = ("roomItem.desc." + _arg_1.furniId);
                    }
                    else
                    {
                        if (_arg_1.furniType == 2)
                        {
                            _local_2 = ("wallItem.desc." + _arg_1.furniId);
                        };
                    };
                };
            };
            return (_local_2);
        }

        public function isAccountSafetyLocked():Boolean
        {
            if (_catalog)
            {
                return (_catalog.sessionDataManager.isAccountSafetyLocked());
            };
            return (false);
        }


    }
}//package com.sulake.habbo.catalog.marketplace

// _SafeStr_1008 = "_-ej" (String#14348, DoABC#4)
// _SafeStr_1233 = "_-nY" (String#29257, DoABC#4)
// _SafeStr_1265 = "_-x1B" (String#30177, DoABC#4)
// _SafeStr_1385 = "_-F1u" (String#27923, DoABC#4)
// _SafeStr_1423 = "_-X2" (String#24471, DoABC#4)
// _SafeStr_1590 = "_-X1g" (String#30726, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_238 = "_-ql" (String#18024, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3209 = "_-02T" (String#6368, DoABC#4)
// _SafeStr_3842 = "_-413" (String#1546, DoABC#4)
// _SafeStr_4520 = "_-yV" (String#9403, DoABC#4)
// _SafeStr_4521 = "_-K1H" (String#9281, DoABC#4)
// _SafeStr_4522 = "_-S12" (String#9420, DoABC#4)
// _SafeStr_4794 = "_-Wt" (String#19164, DoABC#4)
// _SafeStr_4795 = "_-dR" (String#19123, DoABC#4)
// _SafeStr_4796 = "_-93" (String#22219, DoABC#4)
// _SafeStr_4797 = "_-iv" (String#18085, DoABC#4)
// _SafeStr_522 = "_-FG" (String#22487, DoABC#4)
// _SafeStr_598 = "_-5R" (String#22358, DoABC#4)
// _SafeStr_8316 = "_-x1J" (String#33012, DoABC#4)
// _SafeStr_868 = "_-2z" (String#15231, DoABC#4)


