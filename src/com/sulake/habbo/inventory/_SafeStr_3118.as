// by nota

//com.sulake.habbo.inventory._SafeStr_3118

package com.sulake.habbo.inventory
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.utils._SafeStr_24;
    import _-Go._SafeStr_268;
    import _-61W._SafeStr_256;
    import _-221._SafeStr_1447;
    import _-Z1z._SafeStr_676;
    import _-61W._SafeStr_942;
    import _-221._SafeStr_1331;
    import _-qg._SafeStr_555;
    import _-AE._SafeStr_639;
    import _-W1K._SafeStr_990;
    import _-61W._SafeStr_390;
    import _-221._SafeStr_1120;
    import _-qw._SafeStr_243;
    import _-Go._SafeStr_216;
    import _-yL._SafeStr_142;
    import _-Z1z._SafeStr_259;
    import _-61W._SafeStr_501;
    import _-221._SafeStr_1049;
    import _-qw._SafeStr_845;
    import _-61W._SafeStr_339;
    import _-221._SafeStr_1448;
    import _-a2._SafeStr_954;
    import _-Ja._SafeStr_972;
    import _-y1x._SafeStr_1035;
    import _-61W._SafeStr_508;
    import _-221._SafeStr_1054;
    import _-qw._SafeStr_883;
    import _-61W._SafeStr_665;
    import _-221._SafeStr_1327;
    import _-a2._SafeStr_589;
    import _-EK._SafeStr_201;
    import _-w19._SafeStr_1038;
    import _-w19._SafeStr_317;
    import _-61W._SafeStr_183;
    import _-221._SafeStr_1251;
    import _-Go._SafeStr_366;
    import _-qg._SafeStr_244;
    import _-61W._SafeStr_821;
    import _-221._SafeStr_1262;
    import _-a2._SafeStr_495;
    import _-p1o._SafeStr_1039;
    import _-Ol._SafeStr_484;
    import _-Z1z._SafeStr_272;
    import _-w19._SafeStr_1004;
    import _-y1x._SafeStr_605;
    import _-Go._SafeStr_330;
    import _-Go._SafeStr_424;
    import _-qw._SafeStr_412;
    import _-w19._SafeStr_242;
    import _-i9._SafeStr_1005;
    import _-W1K._SafeStr_797;
    import _-Z1z._SafeStr_568;
    import _-61W._SafeStr_302;
    import _-221._SafeStr_1408;
    import _-qg._SafeStr_559;
    import _-61Z._SafeStr_1444;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.inventory.events.HabboInventoryFurniListParsedEvent;
    import _-61Z._SafeStr_1396;
    import _-Go._SafeStr_1599;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-61Z._SafeStr_1508;
    import com.sulake.habbo.inventory.items.GroupItem;
    import _-61Z._SafeStr_1149;
    import com.sulake.habbo.inventory.effects.EffectsModel;
    import _-lk._SafeStr_1323;
    import _-w19._SafeStr_1582;
    import com.sulake.habbo.inventory.effects.Effect;
    import _-lk._SafeStr_1175;
    import _-lk._SafeStr_1057;
    import _-lk._SafeStr_1074;
    import _-NF._SafeStr_1274;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import _-Ad._SafeStr_1106;
    import com.sulake.habbo.inventory.badges.BadgesModel;
    import flash.utils.getTimer;
    import _-Ad._SafeStr_1146;
    import _-Ad._SafeStr_1542;
    import _-28._SafeStr_1189;
    import _-Ad._SafeStr_1098;
    import _-IV._SafeStr_1340;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.habbo.inventory.trading.TradingModel;
    import _-61W._SafeStr_1595;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import _-31H._SafeStr_1438;
    import com.sulake.habbo.inventory.pets.PetsModel;
    import _-Zz._SafeStr_1136;
    import _-Zz._SafeStr_1119;
    import _-Zz._SafeStr_1419;
    import com.sulake.habbo.inventory.bots.BotsModel;
    import _-Lc._SafeStr_1379;
    import _-Lc._SafeStr_1335;
    import _-Lc._SafeStr_1355;
    import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
    import _-kC._SafeStr_1353;
    import _-kC._SafeStr_1500;
    import _-kC._SafeStr_1421;
    import _-kC._SafeStr_1051;

    [SecureSWF(rename="true")]
    public class _SafeStr_3118 
    {

        private static const GROUPED_FURNI_TYPE:String = "credit_groupitem_type_id";

        private var _inventory:HabboInventory;
        private var _com:IHabboCommunicationManager;
        private var _SafeStr_4987:Vector.<_SafeStr_24>;
        private var _SafeStr_4984:Vector.<_SafeStr_24>;
        private var _SafeStr_8634:Vector.<_SafeStr_24>;
        private var _SafeStr_4985:Vector.<_SafeStr_24>;
        private var _SafeStr_4986:int;

        public function _SafeStr_3118(_arg_1:HabboInventory)
        {
            _inventory = _arg_1;
            _com = _inventory.communication;
            _com.addHabboConnectionMessageEvent(new _SafeStr_268(onPostItPlaced));
            _com.addHabboConnectionMessageEvent(new _SafeStr_256(onTradingOtherNotAllowed, _SafeStr_1447));
            _com.addHabboConnectionMessageEvent(new _SafeStr_676(onPetRemoved));
            _com.addHabboConnectionMessageEvent(new _SafeStr_942(onTradingOpen, _SafeStr_1331));
            _com.addHabboConnectionMessageEvent(new _SafeStr_555(onBots));
            _com.addHabboConnectionMessageEvent(new _SafeStr_639(onNotEnoughCredits));
            _com.addHabboConnectionMessageEvent(new _SafeStr_990(onClubStatus));
            _com.addHabboConnectionMessageEvent(new _SafeStr_390(onTradingNotOpen, _SafeStr_1120));
            _com.addHabboConnectionMessageEvent(new _SafeStr_243(onMarketplaceConfiguration));
            _com.addHabboConnectionMessageEvent(new _SafeStr_216(onFurniList));
            _com.addHabboConnectionMessageEvent(new _SafeStr_142(onUserRights));
            _com.addHabboConnectionMessageEvent(new _SafeStr_259(onGoToBreedingNestFailure));
            _com.addHabboConnectionMessageEvent(new _SafeStr_501(onTradingClose, _SafeStr_1049));
            _com.addHabboConnectionMessageEvent(new _SafeStr_845(onMarketplaceMakeOfferResult));
            _com.addHabboConnectionMessageEvent(new _SafeStr_339(onTradingYouAreNotAllowed, _SafeStr_1448));
            _com.addHabboConnectionMessageEvent(new _SafeStr_954(onBadgeReceived));
            _com.addHabboConnectionMessageEvent(new _SafeStr_972(onFlatAccessDenied));
            _com.addHabboConnectionMessageEvent(new _SafeStr_1035(onRoomLeft));
            _com.addHabboConnectionMessageEvent(new _SafeStr_508(onTradingCompleted, _SafeStr_1054));
            _com.addHabboConnectionMessageEvent(new _SafeStr_883(onMarketplaceCanMakeOfferResult));
            _com.addHabboConnectionMessageEvent(new _SafeStr_665(onTradingOpenFailed, _SafeStr_1327));
            _com.addHabboConnectionMessageEvent(new _SafeStr_589(onBadgePointLimits));
            _com.addHabboConnectionMessageEvent(new _SafeStr_201(onAchievementReceived));
            _com.addHabboConnectionMessageEvent(new _SafeStr_1038(onAvatarEffectActivated));
            _com.addHabboConnectionMessageEvent(new _SafeStr_317(onAvatarEffectExpired));
            _com.addHabboConnectionMessageEvent(new _SafeStr_183(onTradingConfirmation, _SafeStr_1251));
            _com.addHabboConnectionMessageEvent(new _SafeStr_366(onFurnitureAddOrUpdate));
            _com.addHabboConnectionMessageEvent(new _SafeStr_244(onBotRemoved));
            _com.addHabboConnectionMessageEvent(new _SafeStr_821(onTradingItemList, _SafeStr_1262));
            _com.addHabboConnectionMessageEvent(new _SafeStr_495(onBadges));
            _com.addHabboConnectionMessageEvent(new _SafeStr_1039(onAchievementsScore));
            _com.addHabboConnectionMessageEvent(new _SafeStr_484(onRoomEnter));
            _com.addHabboConnectionMessageEvent(new _SafeStr_272(onPetAdded));
            _com.addHabboConnectionMessageEvent(new _SafeStr_1004(onAvatarEffects));
            _com.addHabboConnectionMessageEvent(new _SafeStr_605(onRoomLeft));
            _com.addHabboConnectionMessageEvent(new _SafeStr_330(onFurniListInvalidate));
            _com.addHabboConnectionMessageEvent(new _SafeStr_424(onFurniListRemove));
            _com.addHabboConnectionMessageEvent(new _SafeStr_412(onMarketplaceItemStats));
            _com.addHabboConnectionMessageEvent(new _SafeStr_242(onAvatarEffectAdded));
            _com.addHabboConnectionMessageEvent(new _SafeStr_1005(onFigureSetIds));
            _com.addHabboConnectionMessageEvent(new _SafeStr_797(onUserBadges));
            _com.addHabboConnectionMessageEvent(new _SafeStr_568(onPets));
            _com.addHabboConnectionMessageEvent(new _SafeStr_302(onTradingAccepted, _SafeStr_1408));
            _com.addHabboConnectionMessageEvent(new _SafeStr_559(onBotAdded));
        }

        public function dispose():void
        {
            _inventory = null;
            _com = null;
        }

        public function onFurniList(_arg_1:_SafeStr_216):void
        {
            var _local_4:_SafeStr_1444 = _arg_1.getParser();
            if (_local_4 == null)
            {
                return;
            };
            if (!_inventory.isMainViewInitialized)
            {
                _inventory.initializeFurniturePage();
            };
            var _local_2:FurniModel = _inventory.furniModel;
            if (_local_2 == null)
            {
                return;
            };
            if (_SafeStr_4984 == null)
            {
                _SafeStr_4984 = new Vector.<_SafeStr_24>(_local_4.totalFragments, true);
            };
            var _local_5:_SafeStr_24 = new _SafeStr_24();
            _local_5.concatenate(_local_4.furniFragment);
            var _local_3:_SafeStr_24 = addMessageFragment(_local_5, _local_4.totalFragments, _local_4.fragmentNo, _SafeStr_4984);
            if (!_local_3)
            {
                return;
            };
            _local_2.insertFurniture(_local_3);
            _SafeStr_4984 = null;
            _inventory.events.dispatchEvent(new HabboInventoryFurniListParsedEvent("furni"));
        }

        public function onFurnitureAddOrUpdate(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_3:_SafeStr_1396 = (_arg_1 as _SafeStr_366).getParser();
            if (_local_3 == null)
            {
                return;
            };
            var _local_7:FurniModel = _inventory.furniModel;
            if (((_local_7 == null) || (!(_local_7.isListInited()))))
            {
                return;
            };
            var _local_6:Vector.<_SafeStr_1599> = _local_3.getFurni();
            for each (var _local_4:_SafeStr_1599 in _local_6)
            {
                _local_5 = _local_7.getItemWithStripId(_local_4.itemId);
                if (_local_5)
                {
                    _local_2 = _local_5.getItem(_local_4.itemId);
                    if (_local_2)
                    {
                        _local_2.update(_local_4);
                        _local_5.hasUnseenItems = true;
                    };
                }
                else
                {
                    _local_2 = new FurnitureItem(_local_4);
                    _local_7.addOrUpdateItem(_local_2, false);
                };
            };
            _local_7.setViewToState();
            _local_7.updateView();
        }

        public function onFurniListRemove(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1508 = (_arg_1 as _SafeStr_424).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_5:FurniModel = _inventory.furniModel;
            if (_local_5 == null)
            {
                return;
            };
            var _local_4:int = _local_2.stripId;
            var _local_3:GroupItem = _local_5.removeFurni(_local_4);
            if (_local_3)
            {
                _local_5.resetUnseenItems();
            };
        }

        public function onFurniListInvalidate(_arg_1:IMessageEvent):void
        {
            _inventory.setInventoryCategoryInit("furni", false);
            _inventory.setInventoryCategoryInit("rentables", false);
        }

        public function onPostItPlaced(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1149 = (_arg_1 as _SafeStr_268).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:FurniModel = _inventory.furniModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:int = _local_2.id;
            var _local_5:int = _local_2.itemsLeft;
            _local_3.updatePostItCount(_local_4, _local_5);
        }

        public function onAvatarEffects(_arg_1:IMessageEvent):void
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_7:* = null;
            if (_inventory == null)
            {
                return;
            };
            var _local_6:EffectsModel = _inventory.effectsModel;
            if (_local_6 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1323 = (_arg_1 as _SafeStr_1004).getParser();
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:Array = _local_3.effects;
            _local_5 = 0;
            while (_local_5 < _local_2.length)
            {
                _local_4 = (_local_2[_local_5] as _SafeStr_1582);
                _local_7 = new Effect();
                _local_7.type = _local_4.type;
                _local_7.subType = _local_4.subType;
                _local_7.duration = _local_4.duration;
                _local_7.isPermanent = _local_4.isPermanent;
                _local_7.amountInInventory = _local_4.inactiveEffectsInInventory;
                if (_local_4.secondsLeftIfActive >= 0)
                {
                    _local_7.isActive = true;
                    _local_7.secondsLeft = _local_4.secondsLeftIfActive;
                    _local_7.amountInInventory++;
                }
                else
                {
                    if (_local_4.secondsLeftIfActive == -1)
                    {
                        _local_7.isActive = false;
                        _local_7.secondsLeft = _local_4.duration;
                    };
                };
                _local_6.addEffect(_local_7, false);
                _local_5++;
            };
            _inventory.setInventoryCategoryInit("effects");
            _local_6.refreshViews();
            _inventory.notifyChangedEffects();
        }

        public function onAvatarEffectAdded(_arg_1:IMessageEvent):void
        {
            var _local_5:EffectsModel = _inventory.effectsModel;
            if (_local_5 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1175 = (_arg_1 as _SafeStr_242).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_7:int = _local_2.type;
            var _local_6:int = _local_2.subType;
            var _local_8:int = _local_2.duration;
            var _local_3:Boolean = _local_2.isPermanent;
            var _local_4:Effect = new Effect();
            _local_4.type = _local_7;
            _local_4.subType = _local_6;
            _local_4.duration = _local_8;
            _local_4.isPermanent = _local_3;
            _local_4.secondsLeft = _local_8;
            _local_5.addEffect(_local_4);
            _inventory.notifyChangedEffects();
        }

        public function onAvatarEffectActivated(_arg_1:IMessageEvent):void
        {
            var _local_3:EffectsModel = _inventory.effectsModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1057 = (_arg_1 as _SafeStr_1038).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:int = _local_2.type;
            _local_3.setEffectActivated(_local_4);
            _inventory.notifyChangedEffects();
        }

        public function onAvatarEffectExpired(_arg_1:IMessageEvent):void
        {
            var _local_3:EffectsModel = _inventory.effectsModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1074 = (_arg_1 as _SafeStr_317).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:int = _local_2.type;
            _local_3.setEffectExpired(_local_4);
            _inventory.notifyChangedEffects();
        }

        public function onClubStatus(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1274 = (_arg_1 as _SafeStr_990).getParser();
            if (((_local_2.productName == "habbo_club") || (_local_2.productName == "club_habbo")))
            {
                _inventory.setClubStatus(_local_2.periodsSubscribedAhead, _local_2.daysToPeriodEnd, _local_2.hasEverBeenMember, _local_2.isVIP, (_local_2.responseType == 3), (_local_2.responseType == 4), _local_2.minutesUntilExpiration, _local_2.minutesSinceLastModified);
                _inventory.events.dispatchEvent(new HabboInventoryHabboClubEvent());
            };
        }

        public function onBadges(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_1106 = (_arg_1 as _SafeStr_495).getParser();
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:BadgesModel = _inventory.badgesModel;
            if (_local_4 == null)
            {
                return;
            };
            if (_SafeStr_4985 == null)
            {
                _SafeStr_4986 = getTimer();
                _SafeStr_4985 = new Vector.<_SafeStr_24>(_local_3.totalFragments, true);
            };
            var _local_5:_SafeStr_24 = new _SafeStr_24();
            _local_5.concatenate(_local_3.currentFragment);
            var _local_2:_SafeStr_24 = addMessageFragment(_local_5, _local_3.totalFragments, _local_3.fragmentNo, _SafeStr_4985);
            if (!_local_2)
            {
                return;
            };
            _SafeStr_4985 = null;
            var _local_6:int = (getTimer() - _SafeStr_4986);
            _SafeStr_4986 = 0;
            _SafeStr_14.log((("Parsing badges took: " + _local_6) + "ms"));
            _SafeStr_4986 = getTimer();
            _local_4.initBadges(_local_2);
            _local_6 = (getTimer() - _SafeStr_4986);
            _SafeStr_4986 = 0;
            _SafeStr_14.log((("Initializing badges took: " + _local_6) + "ms"));
            _local_4.updateView();
            _inventory.setInventoryCategoryInit("badges");
        }

        public function onBadgePointLimits(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1146 = (_arg_1 as _SafeStr_589).getParser();
            for each (var _local_3:_SafeStr_1542 in _local_2.data)
            {
                _inventory.localization.setBadgePointLimit(_local_3.badgeId, _local_3.limit);
            };
        }

        public function onUserBadges(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_797 = (_arg_1 as _SafeStr_797);
            if (_local_3.userId != _inventory.sessionData.userId)
            {
                return;
            };
            var _local_4:BadgesModel = _inventory.badgesModel;
            if (_local_4 == null)
            {
                return;
            };
            _SafeStr_4986 = getTimer();
            for each (var _local_2:String in _local_3.badges)
            {
                _local_4.updateBadge(_local_2, true);
            };
            var _local_5:int = (getTimer() - _SafeStr_4986);
            _SafeStr_4986 = 0;
            _SafeStr_14.log((((("Updating badges " + _local_3.badges.length) + "took: ") + _local_5) + "ms"));
            _SafeStr_4986 = getTimer();
            _local_4.updateView();
            _local_5 = (getTimer() - _SafeStr_4986);
            _SafeStr_4986 = 0;
            _SafeStr_14.log((("Updating badge view took: " + _local_5) + "ms"));
        }

        public function onAchievementReceived(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_201 = (_arg_1 as _SafeStr_201);
            var _local_3:_SafeStr_1189 = _local_4.getParser();
            var _local_2:BadgesModel = _inventory.badgesModel;
            if (_local_2 != null)
            {
                _local_2.updateBadge(_local_3.data.badgeCode, false, _local_3.data.badgeId);
                _local_2.removeBadge(_local_3.data.removedBadgeCode);
                _local_2.updateView();
            };
        }

        public function onBadgeReceived(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_1098 = _SafeStr_954(_arg_1).getParser();
            var _local_2:BadgesModel = _inventory.badgesModel;
            if (_local_2 != null)
            {
                _local_2.updateBadge(_local_3.badgeCode, false, _local_3.badgeId);
                _local_2.updateView();
            };
        }

        public function onAchievementsScore(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1039 = (_arg_1 as _SafeStr_1039);
            var _local_3:_SafeStr_1340 = (_local_2.getParser() as _SafeStr_1340);
            if (_local_3 == null)
            {
                return;
            };
            _inventory.localization.registerParameter("achievements_score_description", "score", _local_3.score.toString());
        }

        private function onTradingOpen(_arg_1:IMessageEvent):void
        {
            var _local_13:int;
            if (!_inventory)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - inventory is null!");
                return;
            };
            var _local_2:ISessionDataManager = _inventory.sessionData;
            var _local_16:IRoomSession = _inventory.roomSession;
            if (!_local_2)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - sessionData not available!");
                return;
            };
            if (!_local_16)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - roomSession not available!");
                return;
            };
            _inventory.toggleInventorySubPage("trading");
            var _local_5:_SafeStr_942 = (_arg_1 as _SafeStr_942);
            if (!_local_5)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", (("event is of unknown type:" + _arg_1) + "!"));
                return;
            };
            var _local_8:int = _local_5.userID;
            var _local_3:_SafeStr_3241 = _local_16.userDataManager.getUserData(_local_8);
            if (!_local_3)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - failed to retrieve own user data!");
                return;
            };
            var _local_6:String = _local_3.name;
            var _local_4:* = (_local_5.userCanTrade > 0);
            var _local_14:int = _local_5.otherUserID;
            var _local_15:_SafeStr_3241 = _local_16.userDataManager.getUserData(_local_14);
            if (!_local_15)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - failed to retrieve other user data!");
                return;
            };
            var _local_11:String = _local_15.name;
            var _local_10:* = (_local_5.otherUserCanTrade > 0);
            if (_local_14 == _local_2.userId)
            {
                _local_13 = _local_8;
                var _local_9:* = _local_6;
                var _local_7:* = _local_4;
                _local_8 = _local_14;
                _local_6 = _local_11;
                _local_4 = _local_10;
                _local_4;
                _local_14 = _local_13;
                _local_11 = _local_9;
                _local_10 = _local_7;
                _local_10;
            };
            var _local_12:TradingModel = _inventory.tradingModel;
            if (_local_12 != null)
            {
                _local_12.startTrading(_local_8, _local_6, _local_4, _local_14, _local_11, _local_10);
            };
        }

        private function onTradingOpenFailed(_arg_1:IMessageEvent):void
        {
            var _local_2:TradingModel = _inventory.tradingModel;
            if (_local_2 != null)
            {
                _local_2.handleMessageEvent(_arg_1);
            };
        }

        private function onTradingClose(_arg_1:IMessageEvent):void
        {
            var _local_2:TradingModel = _inventory.tradingModel;
            if (_local_2 != null)
            {
                _local_2.handleMessageEvent(_arg_1);
            };
        }

        private function onTradingCompleted(_arg_1:IMessageEvent):void
        {
            var _local_2:TradingModel = _inventory.tradingModel;
            if (_local_2 != null)
            {
                _local_2.handleMessageEvent(_arg_1);
            };
        }

        private function onTradingAccepted(_arg_1:IMessageEvent):void
        {
            var _local_2:TradingModel = _inventory.tradingModel;
            if (_local_2 != null)
            {
                _local_2.handleMessageEvent(_arg_1);
            };
        }

        private function onTradingConfirmation(_arg_1:IMessageEvent):void
        {
            var _local_2:TradingModel = _inventory.tradingModel;
            if (_local_2 != null)
            {
                _local_2.handleMessageEvent(_arg_1);
            };
        }

        private function onTradingItemList(_arg_1:IMessageEvent):void
        {
            var _local_8:* = null;
            var _local_2:_SafeStr_821 = (_arg_1 as _SafeStr_821);
            var _local_4:_SafeStr_24 = new _SafeStr_24();
            var _local_5:_SafeStr_24 = new _SafeStr_24();
            var _local_6:int = _inventory.sessionData.userId;
            var _local_3:FurniModel = _inventory.furniModel;
            if (_local_3 == null)
            {
                return;
            };
            if (((_inventory.getBoolean("trading.warning.enabled")) && (_local_2.secondUserNumCredits > 0)))
            {
                _local_8 = _inventory.furniModel.createCreditGroupItem(_local_2.secondUserNumCredits);
                _local_5.add("credit_groupitem_type_id", _local_8);
            };
            populateItemGroups(_local_2.firstUserItemArray, _local_4, (_local_2.firstUserID == _local_6));
            populateItemGroups(_local_2.secondUserItemArray, _local_5, (_local_2.secondUserID == _local_6));
            var _local_7:TradingModel = _inventory.tradingModel;
            if (_local_7 != null)
            {
                _local_7.updateItemGroupMaps(_local_2, _local_4, _local_5);
            };
        }

        private function populateItemGroups(_arg_1:Array, _arg_2:_SafeStr_24, _arg_3:Boolean):void
        {
            var _local_9:* = null;
            var _local_7:int;
            var _local_8:int;
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_6:int;
            var _local_10:uint = _arg_1.length;
            _local_6 = 0;
            while (_local_6 < _local_10)
            {
                _local_4 = (_arg_1[_local_6] as _SafeStr_1595);
                _local_7 = _local_4.itemTypeId;
                _local_8 = _local_4.category;
                _local_5 = (_local_4.itemType + _local_7);
                if (((!(_local_4.isGroupable)) || (isFurniExternalImage(_local_4.itemTypeId))))
                {
                    _local_5 = ("itemid" + _local_4.itemId);
                };
                if (_local_4.category == 6)
                {
                    _local_5 = ((_local_7 + "poster") + _local_4.stuffData.getLegacyString());
                }
                else
                {
                    if (_local_4.category == 17)
                    {
                        _local_5 = TradingModel.getGuildFurniType(_local_7, _local_4.stuffData);
                    };
                };
                _local_9 = (((_local_4.isGroupable) && (!(isFurniExternalImage(_local_4.itemTypeId)))) ? (_arg_2.getValue(_local_5) as GroupItem) : null);
                if (_local_9 == null)
                {
                    _local_9 = _inventory.furniModel.createGroupItem(_local_7, _local_8, _local_4.stuffData);
                    _arg_2.add(_local_5, _local_9);
                };
                _local_9.push(new FurnitureItem(_local_4));
                _local_6++;
            };
        }

        private function isFurniExternalImage(_arg_1:int):Boolean
        {
            var _local_2:_SafeStr_3130 = _inventory.getFurnitureData(_arg_1, "i");
            return ((_local_2) && (_local_2.isExternalImageType));
        }

        private function onTradingNotOpen(_arg_1:IMessageEvent):void
        {
            var _local_2:TradingModel = _inventory.tradingModel;
            if (_local_2 != null)
            {
                _local_2.handleMessageEvent(_arg_1);
            };
        }

        private function onTradingOtherNotAllowed(_arg_1:IMessageEvent):void
        {
            var _local_2:TradingModel = _inventory.tradingModel;
            if (_local_2 != null)
            {
                _local_2.handleMessageEvent(_arg_1);
            };
        }

        private function onTradingYouAreNotAllowed(_arg_1:IMessageEvent):void
        {
            var _local_2:TradingModel = _inventory.tradingModel;
            if (_local_2 != null)
            {
                _local_2.handleMessageEvent(_arg_1);
            };
        }

        private function onRoomLeft(_arg_1:IMessageEvent):void
        {
            _inventory.closeView();
            _inventory.furniModel.roomLeft();
        }

        private function onFlatAccessDenied(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1438 = (_arg_1 as _SafeStr_972).getParser();
            if (((_inventory.sessionData == null) || (!(_local_2.userName == _inventory.sessionData.userName))))
            {
                return;
            };
            _inventory.closeView();
            _inventory.furniModel.roomLeft();
        }

        private function onPets(_arg_1:_SafeStr_568):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_4:PetsModel = _inventory.petsModel;
            if (_local_4 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1136 = _arg_1.getParser();
            if (_SafeStr_4987 == null)
            {
                _SafeStr_4987 = new Vector.<_SafeStr_24>(_local_3.totalFragments, true);
            };
            var _local_5:_SafeStr_24 = new _SafeStr_24();
            _local_5.concatenate(_local_3.petListFragment);
            var _local_2:_SafeStr_24 = addMessageFragment(_local_5, _local_3.totalFragments, _local_3.fragmentNo, _SafeStr_4987);
            if (!_local_2)
            {
                return;
            };
            _inventory.petsModel.updatePets(_local_2);
            _SafeStr_4987 = null;
        }

        private function onPetAdded(_arg_1:_SafeStr_272):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_3:PetsModel = _inventory.petsModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1119 = _arg_1.getParser();
            _local_3.addPet(_local_2.pet);
            if (_local_2.openInventory())
            {
            };
        }

        private function onGoToBreedingNestFailure(_arg_1:_SafeStr_259):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_2:String = "${gotobreedingnestfailure.getnest}";
            var _local_3:Function = getNest;
            if (_arg_1.getParser().reason == 6)
            {
                _local_2 = "${gotobreedingnestfailure.getfood}";
                _local_3 = getFood;
            };
            _inventory.windowManager.simpleAlert("${gotobreedingnestfailure.caption}", "${gotobreedingnestfailure.subtitle}", (("${gotobreedingnestfailure.message." + _arg_1.getParser().reason) + "}"), _local_2, "", null, null, _local_3);
        }

        private function getNest():void
        {
            var _local_1:String = _inventory.getProperty("gotobreedingnestfailure.catalogpage.nests");
            _inventory.catalog.openCatalogPage(_local_1);
        }

        private function getFood():void
        {
            var _local_1:String = _inventory.getProperty("gotobreedingnestfailure.catalogpage.food");
            _inventory.catalog.openCatalogPage(_local_1);
        }

        private function onPetRemoved(_arg_1:_SafeStr_676):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_3:PetsModel = _inventory.petsModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1419 = _arg_1.getParser();
            _local_3.removePet(_local_2.petId);
        }

        private function onBots(_arg_1:_SafeStr_555):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_3:BotsModel = _inventory.botsModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1379 = _arg_1.getParser();
            _local_3.updateItems(_local_2.items);
            _inventory.setInventoryCategoryInit("bots");
            _local_3.setListInitialized();
        }

        private function onBotRemoved(_arg_1:_SafeStr_244):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_3:BotsModel = _inventory.botsModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1335 = _arg_1.getParser();
            _local_3.removeItem(_local_2.itemId);
        }

        private function onBotAdded(_arg_1:_SafeStr_559):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_3:BotsModel = _inventory.botsModel;
            if (_local_3 == null)
            {
                return;
            };
            if (_local_3.items.length >= _inventory.botsMax)
            {
                return;
            };
            var _local_2:_SafeStr_1355 = _arg_1.getParser();
            _local_3.addItem(_local_2.item);
        }

        private function onMarketplaceConfiguration(_arg_1:_SafeStr_243):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_4:MarketplaceModel = _inventory.marketplaceModel;
            if (_local_4 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1353 = _arg_1.getParser();
            _local_4.isEnabled = _local_3.isEnabled;
            _local_4.commission = _local_3.commission;
            _local_4.tokenBatchPrice = _local_3.tokenBatchPrice;
            _local_4.tokenBatchSize = _local_3.tokenBatchSize;
            _local_4.offerMinPrice = _local_3.offerMinPrice;
            _local_4.offerMaxPrice = _local_3.offerMaxPrice;
            _local_4.expirationHours = _local_3.expirationHours;
            _local_4.averagePricePeriod = _local_3.averagePricePeriod;
            _local_4.sellingFeePercentage = _local_3.sellingFeePercentage;
            _local_4.revenueLimit = _local_3.revenueLimit;
            _local_4.halfTaxLimit = _local_3.halfTaxLimit;
            _inventory.setInventoryCategoryInit("marketplace");
            var _local_2:FurniModel = _inventory.furniModel;
            if (_local_2 != null)
            {
                _local_2.updateView();
            };
        }

        private function onMarketplaceCanMakeOfferResult(_arg_1:_SafeStr_883):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_3:MarketplaceModel = _inventory.marketplaceModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1500 = _arg_1.getParser();
            _local_3.proceedOfferMaking(_local_2.resultCode, _local_2.tokenCount);
        }

        private function onMarketplaceMakeOfferResult(_arg_1:_SafeStr_845):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_3:MarketplaceModel = _inventory.marketplaceModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1421 = _arg_1.getParser();
            _local_3.endOfferMaking(_local_2.result);
        }

        private function onMarketplaceItemStats(_arg_1:_SafeStr_412):void
        {
            if (((_arg_1 == null) || (_inventory == null)))
            {
                return;
            };
            var _local_3:MarketplaceModel = _inventory.marketplaceModel;
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1051 = _arg_1.getParser();
            _local_3.setAveragePrice(_local_2.furniCategoryId, _local_2.furniTypeId, _local_2.averagePrice);
        }

        private function onNotEnoughCredits(_arg_1:_SafeStr_639):void
        {
            if (((!(_arg_1)) || (!(_inventory))))
            {
                return;
            };
            var _local_2:MarketplaceModel = _inventory.marketplaceModel;
            if (_local_2 == null)
            {
                return;
            };
            _local_2.onNotEnoughCredits();
        }

        private function onUserRights(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            if (_inventory.isInventoryCategoryInit("marketplace"))
            {
                _local_2 = _inventory.marketplaceModel;
                if (_local_2 == null)
                {
                    return;
                };
                _local_2.requestInitialization();
            };
        }

        private function onFigureSetIds(_arg_1:_SafeStr_1005):void
        {
            _inventory.updatePurchasedFigureSetIds(_arg_1.getParser().figureSetIds, _arg_1.getParser().boundFurnitureNames);
        }

        private function onRoomEnter(_arg_1:IMessageEvent):void
        {
            if (_inventory.getBoolean("effects.reactivate.on.room.entry"))
            {
                _inventory.effectsModel.reactivateLastEffect();
            };
            _inventory.furniModel.roomEntered();
        }

        private function addMessageFragment(_arg_1:_SafeStr_24, _arg_2:int, _arg_3:int, _arg_4:Vector.<_SafeStr_24>):_SafeStr_24
        {
            if (_arg_2 == 1)
            {
                return (_arg_1);
            };
            _arg_4[_arg_3] = _arg_1;
            for each (var _local_5:_SafeStr_24 in _arg_4)
            {
                if (_local_5 == null)
                {
                    return (null);
                };
            };
            var _local_6:_SafeStr_24 = new _SafeStr_24();
            for each (var _local_7:_SafeStr_24 in _arg_4)
            {
                _local_6.concatenate(_local_7);
                _local_7.dispose();
            };
            _arg_4 = null;
            return (_local_6);
        }


    }
}//package com.sulake.habbo.inventory

// _SafeStr_1004 = "_-G1V" (String#14578, DoABC#4)
// _SafeStr_1005 = "_-O1s" (String#28149, DoABC#4)
// _SafeStr_1035 = "_-9B" (String#10355, DoABC#4)
// _SafeStr_1038 = "_-BG" (String#13270, DoABC#4)
// _SafeStr_1039 = "_-aE" (String#10070, DoABC#4)
// _SafeStr_1049 = "_-o1S" (String#40180, DoABC#4)
// _SafeStr_1051 = "_-a1F" (String#31051, DoABC#4)
// _SafeStr_1054 = "_-K1X" (String#39634, DoABC#4)
// _SafeStr_1057 = "_-6X" (String#38753, DoABC#4)
// _SafeStr_1074 = "_-v1Z" (String#34170, DoABC#4)
// _SafeStr_1098 = "_-k12" (String#35696, DoABC#4)
// _SafeStr_1106 = "_-WU" (String#29046, DoABC#4)
// _SafeStr_1119 = "_-Me" (String#39326, DoABC#4)
// _SafeStr_1120 = "_-O6" (String#39306, DoABC#4)
// _SafeStr_1136 = "_-41G" (String#32943, DoABC#4)
// _SafeStr_1146 = "_-Hg" (String#39941, DoABC#4)
// _SafeStr_1149 = "_-i1s" (String#36097, DoABC#4)
// _SafeStr_1175 = "_-a1X" (String#37100, DoABC#4)
// _SafeStr_1189 = "_-9l" (String#22603, DoABC#4)
// _SafeStr_1251 = "_-WD" (String#39414, DoABC#4)
// _SafeStr_1262 = "_-f1G" (String#37865, DoABC#4)
// _SafeStr_1274 = "_-I1o" (String#18905, DoABC#4)
// _SafeStr_1323 = "_-21L" (String#24212, DoABC#4)
// _SafeStr_1327 = "_-a1q" (String#37301, DoABC#4)
// _SafeStr_1331 = "_-N18" (String#40783, DoABC#4)
// _SafeStr_1335 = "_-g1L" (String#38420, DoABC#4)
// _SafeStr_1340 = "_-e1r" (String#17663, DoABC#4)
// _SafeStr_1353 = "_-D1X" (String#30303, DoABC#4)
// _SafeStr_1355 = "_-Q1s" (String#41327, DoABC#4)
// _SafeStr_1379 = "_-l1q" (String#40419, DoABC#4)
// _SafeStr_1396 = "_-S1i" (String#40557, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1408 = "_-O1G" (String#40991, DoABC#4)
// _SafeStr_1419 = "_-f1j" (String#38004, DoABC#4)
// _SafeStr_142 = "_-Fc" (String#3612, DoABC#4)
// _SafeStr_1421 = "_-51B" (String#28803, DoABC#4)
// _SafeStr_1438 = "_-1v" (String#22414, DoABC#4)
// _SafeStr_1444 = "_-Gd" (String#39643, DoABC#4)
// _SafeStr_1447 = "_-zD" (String#34331, DoABC#4)
// _SafeStr_1448 = "_-py" (String#32271, DoABC#4)
// _SafeStr_1500 = "_-Di" (String#39675, DoABC#4)
// _SafeStr_1508 = "_-z1O" (String#32731, DoABC#4)
// _SafeStr_1542 = "_-k1d" (String#35614, DoABC#4)
// _SafeStr_1582 = "_-K1L" (String#29928, DoABC#4)
// _SafeStr_1595 = "_-Wz" (String#29089, DoABC#4)
// _SafeStr_1599 = "_-v1l" (String#20369, DoABC#4)
// _SafeStr_183 = "_-z1I" (String#23056, DoABC#4)
// _SafeStr_201 = "_-w1t" (String#4981, DoABC#4)
// _SafeStr_216 = "_-Jh" (String#11263, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_242 = "_-SW" (String#15763, DoABC#4)
// _SafeStr_243 = "_-br" (String#11960, DoABC#4)
// _SafeStr_244 = "_-F1I" (String#27690, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_256 = "_-Xj" (String#24885, DoABC#4)
// _SafeStr_259 = "_-t1M" (String#23697, DoABC#4)
// _SafeStr_268 = "_-j18" (String#23279, DoABC#4)
// _SafeStr_272 = "_-mH" (String#24026, DoABC#4)
// _SafeStr_302 = "_-N6" (String#13809, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_317 = "_-A1D" (String#10436, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_330 = "_-HH" (String#14644, DoABC#4)
// _SafeStr_339 = "_-s1F" (String#23563, DoABC#4)
// _SafeStr_366 = "_-g1u" (String#10462, DoABC#4)
// _SafeStr_390 = "_-sf" (String#23806, DoABC#4)
// _SafeStr_412 = "_-12a" (String#13209, DoABC#4)
// _SafeStr_424 = "_-O1b" (String#14726, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_495 = "_-hc" (String#9010, DoABC#4)
// _SafeStr_4984 = "_-Rp" (String#11007, DoABC#4)
// _SafeStr_4985 = "_-p1B" (String#5252, DoABC#4)
// _SafeStr_4986 = "_-o1i" (String#3632, DoABC#4)
// _SafeStr_4987 = "_-e1k" (String#10562, DoABC#4)
// _SafeStr_501 = "_-n13" (String#15540, DoABC#4)
// _SafeStr_508 = "_-Z12" (String#24937, DoABC#4)
// _SafeStr_555 = "_-H1p" (String#25954, DoABC#4)
// _SafeStr_559 = "_-9K" (String#24489, DoABC#4)
// _SafeStr_568 = "_-hh" (String#24150, DoABC#4)
// _SafeStr_589 = "_-O2" (String#23751, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_639 = "_-91d" (String#10781, DoABC#4)
// _SafeStr_665 = "_-r12" (String#10679, DoABC#4)
// _SafeStr_676 = "_-eL" (String#23948, DoABC#4)
// _SafeStr_797 = "_-Ax" (String#6747, DoABC#4)
// _SafeStr_821 = "_-41v" (String#15339, DoABC#4)
// _SafeStr_845 = "_-H1e" (String#13308, DoABC#4)
// _SafeStr_8634 = "_-61B" (String#33882, DoABC#4)
// _SafeStr_883 = "_-F5" (String#23781, DoABC#4)
// _SafeStr_942 = "_-Rv" (String#18712, DoABC#4)
// _SafeStr_954 = "_-91G" (String#25604, DoABC#4)
// _SafeStr_972 = "_-aI" (String#6424, DoABC#4)
// _SafeStr_990 = "_-D1i" (String#4238, DoABC#4)


