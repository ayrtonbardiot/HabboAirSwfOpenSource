// by nota

//com.sulake.habbo.inventory.marketplace.MarketplaceModel

package com.sulake.habbo.inventory.marketplace
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import _-CH._SafeStr_479;
    import _-CH._SafeStr_262;
    import _-CH._SafeStr_869;
    import _-CH._SafeStr_387;
    import _-CH._SafeStr_238;
    import com.sulake.habbo.inventory.items._SafeStr_3154;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class MarketplaceModel implements IInventoryModel 
    {

        private var _SafeStr_4360:HabboInventory;
        private var _assets:_SafeStr_21;
        private var _windowManager:_SafeStr_1695;
        private var _roomEngine:IRoomEngine;
        private var _communication:IHabboCommunicationManager;
        private var _disposed:Boolean = false;
        private var _SafeStr_4519:FurnitureItem;
        private var _SafeStr_4513:Boolean;
        private var _commission:int;
        private var _SafeStr_4514:int;
        private var _SafeStr_4515:int;
        private var _offerMinPrice:int;
        private var _offerMaxPrice:int;
        private var _expirationHours:int;
        private var _SafeStr_4522:int;
        private var _SafeStr_4516:int;
        private var _SafeStr_4517:int;
        private var _SafeStr_4518:int;
        private var _SafeStr_4520:int;
        private var _SafeStr_4521:int;
        private var _SafeStr_3882:MarketplaceView;
        private var _SafeStr_4523:Boolean = false;

        public function MarketplaceModel(_arg_1:HabboInventory, _arg_2:_SafeStr_1695, _arg_3:IHabboCommunicationManager, _arg_4:_SafeStr_21, _arg_5:IRoomEngine, _arg_6:_SafeStr_18)
        {
            _SafeStr_4360 = _arg_1;
            _communication = _arg_3;
            _windowManager = _arg_2;
            _assets = _arg_4;
            _roomEngine = _arg_5;
            _SafeStr_3882 = new MarketplaceView(this, _windowManager, _assets, _arg_5, _arg_6, _arg_1);
        }

        public function get id():String
        {
            return ("marketplace");
        }

        public function set isEnabled(_arg_1:Boolean):void
        {
            _SafeStr_4513 = _arg_1;
        }

        public function set commission(_arg_1:int):void
        {
            _commission = _arg_1;
        }

        public function set tokenBatchPrice(_arg_1:int):void
        {
            _SafeStr_4514 = _arg_1;
        }

        public function set tokenBatchSize(_arg_1:int):void
        {
            _SafeStr_4515 = _arg_1;
        }

        public function set offerMinPrice(_arg_1:int):void
        {
            _offerMinPrice = _arg_1;
        }

        public function set offerMaxPrice(_arg_1:int):void
        {
            _offerMaxPrice = _arg_1;
        }

        public function set expirationHours(_arg_1:int):void
        {
            _expirationHours = _arg_1;
        }

        public function set averagePricePeriod(_arg_1:int):void
        {
            _SafeStr_4522 = _arg_1;
        }

        public function set sellingFeePercentage(_arg_1:int):void
        {
            _SafeStr_4516 = _arg_1;
        }

        public function set revenueLimit(_arg_1:int):void
        {
            _SafeStr_4517 = _arg_1;
        }

        public function set halfTaxLimit(_arg_1:int):void
        {
            _SafeStr_4518 = _arg_1;
        }

        public function get isEnabled():Boolean
        {
            return (_SafeStr_4513);
        }

        public function get commission():int
        {
            return (_commission);
        }

        public function get tokenBatchPrice():int
        {
            return (_SafeStr_4514);
        }

        public function get tokenBatchSize():int
        {
            return (_SafeStr_4515);
        }

        public function get offerMinPrice():int
        {
            return (_offerMinPrice);
        }

        public function get offerMaxPrice():int
        {
            return (_offerMaxPrice);
        }

        public function get expirationHours():int
        {
            return (_expirationHours);
        }

        public function get sellingFeePercentage():int
        {
            return (_SafeStr_4516);
        }

        public function get revenueLimit():int
        {
            return (_SafeStr_4517);
        }

        public function get halfTaxLimit():int
        {
            return (_SafeStr_4518);
        }

        public function get controller():HabboInventory
        {
            return (_SafeStr_4360);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            _SafeStr_4360 = null;
            _communication = null;
            _windowManager = null;
            _assets = null;
            _roomEngine = null;
        }

        public function releaseItem():void
        {
            if ((((!(_SafeStr_4360 == null)) && (!(_SafeStr_4360.furniModel == null))) && (!(_SafeStr_4519 == null))))
            {
                _SafeStr_4360.furniModel.removeLockFrom(_SafeStr_4519.id);
                _SafeStr_4519 = null;
            };
        }

        public function startOfferMaking(_arg_1:FurnitureItem):void
        {
            if (((!(_SafeStr_4519 == null)) || (_arg_1 == null)))
            {
                return;
            };
            if (_SafeStr_4360 == null)
            {
                return;
            };
            var _local_2:FurniModel = _SafeStr_4360.furniModel;
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_4519 = _arg_1;
            _local_2.addLockTo(_arg_1.id);
            send(new _SafeStr_479());
        }

        public function buyMarketplaceTokens():void
        {
            send(new _SafeStr_262());
            _SafeStr_4523 = true;
        }

        public function makeOffer(_arg_1:int):void
        {
            if (_SafeStr_4519 == null)
            {
                return;
            };
            var _local_2:int = ((_SafeStr_4519.isWallItem) ? 2 : 1);
            send(new _SafeStr_869(_arg_1, _local_2, _SafeStr_4519.ref));
            releaseItem();
        }

        public function getItemStats():void
        {
            if (_SafeStr_4519 == null)
            {
                return;
            };
            var _local_1:int = ((_SafeStr_4519.isWallItem) ? 2 : 1);
            _SafeStr_4520 = _local_1;
            _SafeStr_4521 = _SafeStr_4519.type;
            send(new _SafeStr_387(_local_1, _SafeStr_4519.type));
        }

        public function proceedOfferMaking(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_4523 = false;
            switch (_arg_1)
            {
                case 1:
                    _SafeStr_3882.showMakeOffer(_SafeStr_4519);
                    return;
                case 2:
                    _SafeStr_3882.showAlert("${inventory.marketplace.no_trading_privilege.title}", "${inventory.marketplace.no_trading_privilege.info}");
                    return;
                case 3:
                    _SafeStr_3882.showAlert("${inventory.marketplace.no_trading_pass.title}", "${inventory.marketplace.no_trading_pass.info}");
                    return;
                case 4:
                    _SafeStr_3882.showBuyTokens(_SafeStr_4514, _SafeStr_4515);
                    return;
                case 5:
                    return;
                case 6:
                    _SafeStr_3882.showAlert("${inventory.marketplace.trading_lock.title}", "${inventory.marketplace.trading_lock.info}");
                default:
            };
        }

        public function endOfferMaking(_arg_1:int):void
        {
            if (!_SafeStr_3882)
            {
                return;
            };
            _SafeStr_3882.showResult(_arg_1);
        }

        public function setAveragePrice(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            if (((!(_arg_1 == _SafeStr_4520)) || (!(_arg_2 == _SafeStr_4521))))
            {
                return;
            };
            if (!_SafeStr_3882)
            {
                return;
            };
            _SafeStr_3882.updateAveragePrice(_arg_3, _SafeStr_4522);
        }

        public function onNotEnoughCredits():void
        {
            if (_SafeStr_4523)
            {
                _SafeStr_4523 = false;
                releaseItem();
            };
        }

        public function requestInitialization():void
        {
            send(new _SafeStr_238());
        }

        public function getOfferItem():_SafeStr_3154
        {
            return (_SafeStr_4519);
        }

        public function getWindowContainer():_SafeStr_3133
        {
            return (null);
        }

        public function categorySwitch(_arg_1:String):void
        {
        }

        public function subCategorySwitch(_arg_1:String):void
        {
        }

        public function closingInventoryView():void
        {
        }

        public function updateView():void
        {
        }

        private function send(_arg_1:IMessageComposer):void
        {
            if (((!(_communication == null)) && (!(_communication.connection == null))))
            {
                _communication.connection.send(_arg_1);
            };
        }

        public function selectItemById(_arg_1:String):void
        {
            _SafeStr_14.log("NOT SUPPORTED: MARKETPLACE SELECT BY ID");
        }


    }
}//package com.sulake.habbo.inventory.marketplace

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_238 = "_-ql" (String#18024, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_262 = "_-V1R" (String#28927, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_387 = "_-Vj" (String#19303, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4513 = "_-fy" (String#4293, DoABC#4)
// _SafeStr_4514 = "_-x5" (String#14343, DoABC#4)
// _SafeStr_4515 = "_-ro" (String#15358, DoABC#4)
// _SafeStr_4516 = "_-E1v" (String#19099, DoABC#4)
// _SafeStr_4517 = "_-JI" (String#22529, DoABC#4)
// _SafeStr_4518 = "_-x3" (String#18495, DoABC#4)
// _SafeStr_4519 = "_-yg" (String#3063, DoABC#4)
// _SafeStr_4520 = "_-yV" (String#9403, DoABC#4)
// _SafeStr_4521 = "_-K1H" (String#9281, DoABC#4)
// _SafeStr_4522 = "_-S12" (String#9420, DoABC#4)
// _SafeStr_4523 = "_-11I" (String#10090, DoABC#4)
// _SafeStr_479 = "_-7u" (String#30765, DoABC#4)
// _SafeStr_869 = "_-81M" (String#29628, DoABC#4)


