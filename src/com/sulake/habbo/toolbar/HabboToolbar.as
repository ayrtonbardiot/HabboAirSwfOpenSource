// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.HabboToolbar

package com.sulake.habbo.toolbar
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.toolbar.extensions.PurseAreaExtension;
    import com.sulake.habbo.toolbar.extensions.SettingsExtension;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.messenger._SafeStr_1700;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.toolbar.extensions.purse.indicators.SeasonalCurrencyIndicator;
    import com.sulake.habbo.toolbar.extensions.ClubDiscountPromoExtension;
    import com.sulake.habbo.toolbar.extensions.CitizenshipVipQuestsPromoExtension;
    import com.sulake.habbo.toolbar.extensions.CitizenshipVipDiscountPromoExtension;
    import com.sulake.habbo.toolbar.extensions.VideoOfferExtension;
    import com.sulake.core.localization._SafeStr_17;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.quest._SafeStr_2046;
    import com.sulake.habbo.freeflowchat._SafeStr_1703;
    import com.sulake.habbo.ui.IRoomUI;
    import com.sulake.habbo.toolbar.offers.OfferExtension;
    import flash.utils.Timer;
    import com.sulake.habbo.phonenumber.HabboPhoneNumber;
    import com.sulake.iid.IIDHabboPhoneNumber;
    import com.sulake.habbo.nux.HabboNuxDialogs;
    import com.sulake.iid.IIDHabboNuxDialogs;
    import com.sulake.habbo.campaign.HabboCampaigns;
    import com.sulake.iid.IIDHabboCampaigns;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDCoreLocalizationManager;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboFreeFlowChat;
    import com.sulake.iid.IIDHabboRoomUI;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboQuestEngine;
    import com.sulake.iid.IIDHabboMessenger;
    import com.sulake.iid.IIDHabboGroupForumController;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboNewNavigator;
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import _-yL._SafeStr_142;
    import com.sulake.habbo.session.events.PerksUpdatedEvent;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.events.TimerEvent;
    import com.sulake.room.utils.RoomEnterEffect;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import _-qv._SafeStr_895;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.motion.Motion;
    import com.sulake.habbo.messenger.events.MiniMailMessageEvent;
    import com.sulake.habbo.quest.events.UnseenAchievementsCountUpdateEvent;
    import com.sulake.habbo.friendbar.groupforums.UnseenForumsCountUpdatedEvent;
    import com.sulake.habbo.inventory.events.HabboUnseenItemsUpdatedEvent;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import com.sulake.core.runtime._SafeStr_800;

    public class HabboToolbar extends _SafeStr_20 implements IHabboToolbar 
    {

        private var _windowManager:_SafeStr_1695;
        private var _communicationManager:_SafeStr_25;
        private var _SafeStr_3882:BottomBarLeft;
        private var _bottomBarBackground:BottomBackgroundBorder;
        private var _SafeStr_3883:Boolean;
        private var _purseExtension:PurseAreaExtension;
        private var _settingsExtension:SettingsExtension;
        private var _connection:IConnection;
        private var _catalog:IHabboCatalog;
        private var _messenger:_SafeStr_1700;
        private var _navigator:_SafeStr_1696;
        private var _newNavigator:IHabboNewNavigator;
        private var _seasonalCurrencyExtension:SeasonalCurrencyIndicator;
        private var _clubDiscountPromoExtension:ClubDiscountPromoExtension;
        private var _SafeStr_3916:CitizenshipVipQuestsPromoExtension;
        private var _SafeStr_3917:CitizenshipVipDiscountPromoExtension;
        private var _videoOfferExtension:VideoOfferExtension;
        private var _localization:_SafeStr_17;
        private var _inventory:_SafeStr_1708;
        private var _SafeStr_3915:ExtensionView;
        private var _soundManager:_SafeStr_2088;
        private var _sessionDataManager:ISessionDataManager;
        private var _habboHelp:IHabboHelp;
        private var _avatarRenderManager:_SafeStr_1701;
        private var _questEngine:_SafeStr_2046;
        private var _freeFlowChat:_SafeStr_1703;
        private var _roomUI:IRoomUI;
        private var _offerExtension:OfferExtension;
        private var _SafeStr_3920:Timer;
        private var _SafeStr_3918:Timer;
        private var _SafeStr_3919:Timer;

        public function HabboToolbar(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _arg_1.attachComponent(new HabboPhoneNumber(_arg_1, 0, _arg_3), [new IIDHabboPhoneNumber()]);
            _arg_1.attachComponent(new HabboNuxDialogs(_arg_1, 0, _arg_3), [new IIDHabboNuxDialogs()]);
            _arg_1.attachComponent(new HabboCampaigns(_arg_1, 0, _arg_3), [new IIDHabboCampaigns()]);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
                "type":"complete",
                "callback":onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communicationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }, true), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }, true, [{
                "type":"CATALOG_INITIALIZED",
                "callback":onCatalogEvent
            }, {
                "type":"CATALOG_NOT_READY",
                "callback":onCatalogEvent
            }, {
                "type":"CATALOG_NEW_ITEMS_SHOW",
                "callback":onCatalogEvent
            }, {
                "type":"CATALOG_NEW_ITEMS_HIDE",
                "callback":onCatalogEvent
            }]), new ComponentDependency(new IIDCoreLocalizationManager(), function (_arg_1:_SafeStr_17):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboInventory(), function (_arg_1:_SafeStr_1708):void
            {
                _inventory = _arg_1;
            }, false, [{
                "type":"HUIUE_UNSEEN_ITEMS_CHANGED",
                "callback":onUnseenItemsUpdate
            }, {
                "type":"HIHCE_HABBO_CLUB_CHANGED",
                "callback":onClubChanged
            }]), new ComponentDependency(new IIDHabboSoundManager(), function (_arg_1:_SafeStr_2088):void
            {
                _soundManager = _arg_1;
            }), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }, true, [{
                "type":"PUE_perks_updated",
                "callback":onPerksUpdated
            }]), new ComponentDependency(new IIDHabboHelp(), function (_arg_1:IHabboHelp):void
            {
                _habboHelp = _arg_1;
            }, false), new ComponentDependency(new IIDHabboFreeFlowChat(), function (_arg_1:_SafeStr_1703):void
            {
                _freeFlowChat = _arg_1;
            }, false), new ComponentDependency(new IIDHabboRoomUI(), function (_arg_1:IRoomUI):void
            {
                _roomUI = _arg_1;
            }, false), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarRenderManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboQuestEngine(), function (_arg_1:_SafeStr_2046):void
            {
                _questEngine = _arg_1;
            }, false, [{
                "type":"qe_uacue",
                "callback":onUnseenAchievementsCountUpdate
            }]), new ComponentDependency(new IIDHabboMessenger(), function (_arg_1:_SafeStr_1700):void
            {
                _messenger = _arg_1;
            }, false, [{
                "type":"MMME_new",
                "callback":onMiniMailUpdate
            }, {
                "type":"MMME_unread",
                "callback":onMiniMailUpdate
            }, {
                "type":"HUIUE_UNSEEN_ITEMS_CHANGED",
                "callback":onUnseenItemsUpdate
            }]), new ComponentDependency(new IIDHabboGroupForumController(), null, false, [{
                "type":"UNSEEN_FORUMS_COUNT",
                "callback":onUnseenForumsCountUpdate
            }]), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _navigator = _arg_1;
            }, false), new ComponentDependency(new IIDHabboNewNavigator(), function (_arg_1:IHabboNewNavigator):void
            {
                _newNavigator = _arg_1;
            }, false)]));
        }

        override public function dispose():void
        {
            _SafeStr_3883 = false;
            _connection = null;
            destroyClientPromoTimer();
            destroyDimmerTimer();
            destroyOwnRoomPromoTimer();
            if (_SafeStr_3915)
            {
                _SafeStr_3915.dispose();
                _SafeStr_3915 = null;
            };
            if (_purseExtension)
            {
                _purseExtension.dispose();
                _purseExtension = null;
            };
            if (_settingsExtension)
            {
                _settingsExtension.dispose();
                _settingsExtension = null;
            };
            if (_offerExtension != null)
            {
                _offerExtension.dispose();
                _offerExtension = null;
            };
            if (_clubDiscountPromoExtension)
            {
                _clubDiscountPromoExtension.dispose();
                _clubDiscountPromoExtension = null;
            };
            if (_SafeStr_3916)
            {
                _SafeStr_3916.dispose();
                _SafeStr_3916 = null;
            };
            if (_SafeStr_3917)
            {
                _SafeStr_3917.dispose();
                _SafeStr_3917 = null;
            };
            if (_videoOfferExtension)
            {
                _videoOfferExtension.dispose();
                _videoOfferExtension = null;
            };
            if (_messenger != null)
            {
                if (_messenger.events)
                {
                    _messenger.events.removeEventListener("MMME_new", onMiniMailUpdate);
                    _messenger.events.removeEventListener("MMME_unread", onMiniMailUpdate);
                };
                _messenger = null;
            };
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            super.dispose();
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
        }

        override protected function initComponent():void
        {
            var _local_1:int;
            var _local_2:int;
            _connection = _communicationManager.connection;
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_142(onUserRights));
            _bottomBarBackground = new BottomBackgroundBorder(this);
            _SafeStr_3882 = new BottomBarLeft(this, _windowManager, assets, events);
            _SafeStr_3882.window.visible = false;
            initRoomEnterEffect();
            _SafeStr_3915 = new ExtensionView(_windowManager, assets, this);
            if (_SafeStr_3882 == null)
            {
                _SafeStr_14.log("Error, toolbar view was not available");
                return;
            };
            var _local_3:String = getProperty("new.user.wing");
            if (_local_3 != "")
            {
                _local_1 = (getInteger("new.user.promo.delay", 10) * 1000);
                if (((_local_1 > 0) && (_SafeStr_3918 == null)))
                {
                    _SafeStr_3918 = new Timer(_local_1, 1);
                    _SafeStr_3918.addEventListener("timerComplete", onShowClientPromo);
                    _SafeStr_3918.start();
                };
                if (((((_local_3 == "social") || (_local_3 == "quest")) || (_local_3 == "group")) || (_local_3 == "game")))
                {
                    _local_2 = (getInteger("new.user.promo.room.delay", 180) * 1000);
                    if (((_local_2 > 0) && (_SafeStr_3919 == null)))
                    {
                        _SafeStr_3919 = new Timer(_local_2, 1);
                        _SafeStr_3919.addEventListener("timerComplete", onShowOwnRoomPromo);
                        _SafeStr_3919.start();
                    };
                };
            };
        }

        private function onPerksUpdated(_arg_1:PerksUpdatedEvent):void
        {
            if (((_SafeStr_3915) && (!(_SafeStr_3883))))
            {
                initPurseAreaExtension();
                initSeasonalCurrencyExtension();
                initVipExtendExtension();
                initCitizenshipVipExtendExtension();
                initCitizenshipVipQuestsExtension();
                initVideoOfferExtension();
                initOfferExtension();
                initSettingsExtension();
                _SafeStr_3883 = true;
            };
        }

        private function onCatalogEvent(_arg_1:CatalogEvent):void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.onCatalogEvent(_arg_1);
            };
        }

        private function onUserRights(_arg_1:IMessageEvent):void
        {
            if (!_videoOfferExtension)
            {
                initVideoOfferExtension();
            };
        }

        private function onShowClientPromo(_arg_1:TimerEvent):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            destroyClientPromoTimer();
            var _local_5:String = getProperty("new.user.wing");
            var _local_4:int;
            var _local_6:String;
            switch (_local_5)
            {
                case "social":
                    _local_3 = "new.user.promo.social";
                    _local_2 = "HTIE_ICON_NAVIGATOR";
                    _local_6 = "NAVIGATOR";
                    break;
                case "group":
                    _local_3 = "new.user.promo.group";
                    _local_2 = "HTIE_EXT_GROUP";
                    _local_4 = 1;
                    break;
                case "quest":
                    _local_3 = "new.user.promo.quest";
                    _local_2 = "HTIE_ICON_QUESTS";
                    _local_6 = "QUESTS";
                    break;
                case "game":
                    _local_3 = "new.user.promo.game";
                    _local_2 = "HTIE_ICON_GAMES";
                    _local_6 = "GAMES";
                    break;
                default:
                    return;
            };
            if (getIconLocation(_local_2) != null)
            {
                _habboHelp.showWelcomeScreen(_local_2, _local_3, _local_4, _local_6);
            };
        }

        private function onShowOwnRoomPromo(_arg_1:TimerEvent):void
        {
            destroyOwnRoomPromoTimer();
            _habboHelp.showWelcomeScreen("HTIE_ICON_NAVIGATOR", "new.user.promo.room", 0, "NAVIGATOR_ME_TAB");
        }

        private function initRoomEnterEffect():void
        {
            var _local_1:int;
            var _local_2:int;
            if (!isNewIdentity())
            {
                return;
            };
            if (getBoolean("room.enter.effect.enabled"))
            {
                _local_1 = getInteger("room.enter.effect.delay", 4000);
                _local_2 = getInteger("room.enter.effect.duration", 2000);
                RoomEnterEffect.init(_local_1, _local_2);
                createAndAttachDimmerWindow(_SafeStr_3133(_SafeStr_3882.window));
                if (_SafeStr_3920 == null)
                {
                    _SafeStr_3920 = new Timer((_local_1 + _local_2), 1);
                    _SafeStr_3920.addEventListener("timerComplete", onRemoveDimmer);
                    _SafeStr_3920.start();
                };
            };
        }

        private function initPurseAreaExtension():void
        {
            _purseExtension = new PurseAreaExtension(this, _catalog);
            _purseExtension.getClubArea().onClubChanged();
        }

        private function initSettingsExtension():void
        {
            _settingsExtension = new SettingsExtension(this);
        }

        private function initSeasonalCurrencyExtension():void
        {
            var _local_1:* = null;
            if (getBoolean("seasonalcurrencyindicator.enabled"))
            {
                _seasonalCurrencyExtension = new SeasonalCurrencyIndicator(this, _windowManager, assets, _catalog, _localization);
                _local_1 = new PurseEvent("catalog_purse_activity_point_balance", _catalog.getPurse().getActivityPointsForType(101), 101);
                _seasonalCurrencyExtension.onBalance(_local_1);
            };
        }

        private function initVipExtendExtension():void
        {
            if (getBoolean("club.membership.extend.vip.promotion.enabled"))
            {
                _clubDiscountPromoExtension = new ClubDiscountPromoExtension(this);
            };
        }

        private function initCitizenshipVipQuestsExtension():void
        {
            if (getBoolean("citizenship.vip.quest.promotion.enabled"))
            {
                _SafeStr_3916 = new CitizenshipVipQuestsPromoExtension(this, _windowManager, assets, events, _localization, _connection);
            };
        }

        private function initCitizenshipVipExtendExtension():void
        {
            if (getBoolean("club.membership.extend.vip.promotion.enabled"))
            {
                _SafeStr_3917 = new CitizenshipVipDiscountPromoExtension(this);
            };
        }

        private function initVideoOfferExtension():void
        {
            var _local_1:Boolean = ((!(isNewIdentity())) || (!(getBoolean("new.identity.hide.ui"))));
            if ((((_catalog.videoOffers.enabled) && (getBoolean("toolbar.extension.video.promo.enabled"))) && (_local_1)))
            {
                _videoOfferExtension = new VideoOfferExtension(this);
            };
        }

        private function initOfferExtension():void
        {
            var _local_1:Boolean = ((!(isNewIdentity())) || (!(getBoolean("new.identity.hide.ui"))));
            if ((((getBoolean("offers.enabled")) && (_local_1)) && (!(getBoolean("offers.habboclub.enabled")))))
            {
                _offerExtension = new OfferExtension(this, _windowManager, assets, _catalog);
            };
        }

        public function toggleSettingVisibility():void
        {
            if (((_settingsExtension) && (_settingsExtension.window)))
            {
                _settingsExtension.window.visible = (!(_settingsExtension.window.visible));
            };
            extensionView.refreshItemWindow();
        }

        private function onRemoveDimmer(_arg_1:TimerEvent):void
        {
            destroyDimmerTimer();
            if (_SafeStr_3882)
            {
                removeDimmer((_SafeStr_3882.window as _SafeStr_3133));
            };
            if (_SafeStr_3915)
            {
                _SafeStr_3915.removeDimmers();
            };
        }

        public function createAndAttachDimmerWindow(_arg_1:_SafeStr_3133):void
        {
            var _local_2:* = null;
            if (RoomEnterEffect.isRunning())
            {
                if (_arg_1 == null)
                {
                    return;
                };
                _local_2 = _windowManager.createWindow("toolbar_dimmer", "", 30, 1, ((0x80 | 0x0800) | 0x01), new Rectangle(0, 0, _arg_1.width, _arg_1.height), null, 0);
                _local_2.color = 0;
                _local_2.blend = 0.3;
                _arg_1.addChild(_local_2);
                _arg_1.invalidate();
            };
        }

        public function removeDimmer(_arg_1:_SafeStr_3133):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _arg_1.findChildByName("toolbar_dimmer");
            if (_local_2 != null)
            {
                _arg_1.removeChild(_local_2);
                _arg_1.invalidate();
                _windowManager.destroy(_local_2);
            };
        }

        public function toggleWindowVisibility(_arg_1:String):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_2:String = HabboToolbarIconEnum[_arg_1];
            if (_local_2 == "HTIE_ICON_CAMERA")
            {
                _local_4 = new HabboToolbarEvent("HTE_ICON_CAMERA");
                _local_4.iconName = "toolBarCameraIcon";
                events.dispatchEvent(_local_4);
            }
            else
            {
                _local_5 = new HabboToolbarEvent("HTE_TOOLBAR_CLICK");
                _local_5.iconId = _local_2;
                _local_5.iconName = _arg_1;
                events.dispatchEvent(_local_5);
            };
            var _local_3:_SafeStr_895 = new _SafeStr_895("Toolbar", _arg_1, "client.toolbar.clicked");
            if (_connection)
            {
                _connection.send(_local_3);
            };
        }

        public function getIconLocation(_arg_1:String):Rectangle
        {
            var _local_2:* = null;
            if (_arg_1 == "HTIE_EXT_GROUP")
            {
                _local_2 = _SafeStr_3915.getIconLocation(_arg_1);
            }
            else
            {
                if (_SafeStr_3882)
                {
                    _local_2 = _SafeStr_3882.getIconLocation(_arg_1);
                };
            };
            if (((!(_local_2)) && (_purseExtension)))
            {
                _local_2 = _purseExtension.getIconLocation(_arg_1);
            };
            return (_local_2);
        }

        public function getIcon(_arg_1:String):_SafeStr_3109
        {
            var _local_2:* = null;
            if (_arg_1 == "HTIE_EXT_GROUP")
            {
                _local_2 = _SafeStr_3915.getIcon(_arg_1);
            }
            else
            {
                if (_SafeStr_3882)
                {
                    _local_2 = _SafeStr_3882.geIcon(_arg_1);
                    (trace(_arg_1, _local_2));
                    if ((_local_2 as IStaticBitmapWrapperWindow))
                    {
                        _local_2 = _local_2.parent;
                    };
                    (trace("toka", _local_2));
                };
            };
            if (((!(_local_2)) && (_purseExtension)))
            {
                _local_2 = _purseExtension.getIcon(_arg_1);
            };
            return (_local_2);
        }

        public function setUnseenItemCount(_arg_1:String, _arg_2:int):void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.setUnseenItemCount(_arg_1, _arg_2);
            };
        }

        public function setToolbarState(_arg_1:String):void
        {
            switch (_arg_1)
            {
                case "HTE_STATE_HOTEL_VIEW":
                case "HTE_STATE_GAME_CENTER_VIEW":
                    showExtensions(true);
                    break;
                case "HTE_STATE_ROOM_VIEW":
                    showExtensions(true);
                    break;
                case "HTE_STATE_HIDDEN":
                    showExtensions(false);
            };
            if (_SafeStr_3915 != null)
            {
                _SafeStr_3915.landingView = (_arg_1 == "HTE_STATE_HOTEL_VIEW");
            };
            if (_SafeStr_3882)
            {
                _SafeStr_3882.setToolbarState(_arg_1);
                _SafeStr_3882.window.visible = true;
            };
            if (_habboHelp != null)
            {
                _habboHelp.outsideRoom = (!(_arg_1 == "HTE_STATE_ROOM_VIEW"));
            };
            var _local_2:HabboToolbarEvent = new HabboToolbarEvent("HTE_RESIZED");
            events.dispatchEvent(_local_2);
        }

        private function showExtensions(_arg_1:Boolean):void
        {
            if (_SafeStr_3915)
            {
                _SafeStr_3915.visible = _arg_1;
            };
        }

        public function setIconBitmap(_arg_1:String, _arg_2:BitmapData):void
        {
            var _local_3:* = null;
            if (_arg_2 != null)
            {
                _local_3 = _arg_2.clone();
            };
            if (_SafeStr_3882)
            {
                _SafeStr_3882.setIconBitmap(_arg_1, _arg_2);
            };
        }

        public function getRect():Rectangle
        {
            if (_SafeStr_3882)
            {
                return (_SafeStr_3882.window.rectangle);
            };
            return (new Rectangle());
        }

        public function get extensionView():IExtensionView
        {
            return (_SafeStr_3915);
        }

        public function get soundManager():_SafeStr_2088
        {
            return (_soundManager);
        }

        public function createTransitionToIcon(_arg_1:String, _arg_2:BitmapData, _arg_3:int, _arg_4:int):Motion
        {
            if (((_SafeStr_3882) && (!(_SafeStr_3882.disposed))))
            {
                return (_SafeStr_3882.animateToIcon(_arg_1, _arg_2, _arg_3, _arg_4));
            };
            _arg_2.dispose();
            return (null);
        }

        public function isXmasEnabled():Boolean
        {
            return (getBoolean("xmas11.enabled"));
        }

        public function isValentinesEnabled():Boolean
        {
            return (getBoolean("valentines.enabled"));
        }

        public function isNewIdentity():Boolean
        {
            return (getInteger("new.identity", 0) > 0);
        }

        public function setIconVisibility(_arg_1:String, _arg_2:Boolean):void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.iconVisibility(_arg_1, _arg_2);
            };
        }

        private function destroyDimmerTimer():void
        {
            if (_SafeStr_3920)
            {
                _SafeStr_3920.removeEventListener("timerComplete", onRemoveDimmer);
                _SafeStr_3920.stop();
                _SafeStr_3920 = null;
            };
        }

        private function destroyClientPromoTimer():void
        {
            if (_SafeStr_3918)
            {
                _SafeStr_3918.removeEventListener("timerComplete", onShowClientPromo);
                _SafeStr_3918.stop();
                _SafeStr_3918 = null;
            };
        }

        private function destroyOwnRoomPromoTimer():void
        {
            if (_SafeStr_3919)
            {
                _SafeStr_3919.removeEventListener("timerComplete", onShowOwnRoomPromo);
                _SafeStr_3919.stop();
                _SafeStr_3919 = null;
            };
        }

        private function onMiniMailUpdate(_arg_1:MiniMailMessageEvent):void
        {
            if (((!(_messenger)) || (!(_SafeStr_3882))))
            {
                return;
            };
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.unseenMiniMailMessageCount = _messenger.getUnseenMiniMailMessageCount();
                _SafeStr_3882.memenu.unseenMinimailsCount = _messenger.getUnseenMiniMailMessageCount();
                setUnseenItemCount("HTIE_ICON_MEMENU", _SafeStr_3882.unseenMeMenuCount);
            };
        }

        private function onUnseenAchievementsCountUpdate(_arg_1:UnseenAchievementsCountUpdateEvent):void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.unseenAchievementCount = _arg_1.count;
                _SafeStr_3882.memenu.unseenAchievementsCount = _arg_1.count;
                setUnseenItemCount("HTIE_ICON_MEMENU", _SafeStr_3882.unseenMeMenuCount);
            };
        }

        private function onUnseenForumsCountUpdate(_arg_1:UnseenForumsCountUpdatedEvent):void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.unseenForumsCount = _arg_1.unseenForumsCount;
                _SafeStr_3882.memenu.unseenForumsCount = _arg_1.unseenForumsCount;
                setUnseenItemCount("HTIE_ICON_MEMENU", _SafeStr_3882.unseenMeMenuCount);
            };
        }

        public function set onDuty(_arg_1:Boolean):void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.onDuty = _arg_1;
            };
        }

        private function onUnseenItemsUpdate(_arg_1:HabboUnseenItemsUpdatedEvent):void
        {
            setUnseenItemCount("HTIE_ICON_INVENTORY", _arg_1.inventoryCount);
            setUnseenItemCount("HTIE_ICON_GAMES", _arg_1.getCategoryCount(6));
        }

        public function onClubChanged(_arg_1:HabboInventoryHabboClubEvent):void
        {
            if (_purseExtension != null)
            {
                _purseExtension.getClubArea().onClubChanged(_arg_1);
            };
            if (_SafeStr_3917 != null)
            {
                _SafeStr_3917.onClubChanged(_arg_1);
            };
            if (_videoOfferExtension != null)
            {
                _videoOfferExtension.onClubChanged(_arg_1);
            };
            if (_clubDiscountPromoExtension != null)
            {
                _clubDiscountPromoExtension.onClubChanged(_arg_1);
            };
        }

        public function get toolBarAreaWidth():int
        {
            if (_SafeStr_3882)
            {
                return (_SafeStr_3882.getToolbarAreaWidth());
            };
            return (0);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get avatarRenderManager():_SafeStr_1701
        {
            return (_avatarRenderManager);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get communicationManager():_SafeStr_25
        {
            return (_communicationManager);
        }

        public function get connection():IConnection
        {
            return (_connection);
        }

        public function get navigator():_SafeStr_1696
        {
            if (_newNavigator != null)
            {
                return (_newNavigator.legacyNavigator);
            };
            return (null);
        }

        public function get questEngine():_SafeStr_2046
        {
            return (_questEngine);
        }

        public function get freeFlowChat():_SafeStr_1703
        {
            return (_freeFlowChat);
        }

        public function get roomUI():IRoomUI
        {
            return (_roomUI);
        }

        public function get inventory():_SafeStr_1708
        {
            return (_inventory);
        }

        public function get localization():_SafeStr_17
        {
            return (_localization);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function get messenger():_SafeStr_1700
        {
            return (_messenger);
        }

        public function reboot():void
        {
            (context as _SafeStr_800).reboot();
        }


    }
}//package com.sulake.habbo.toolbar

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_142 = "_-Fc" (String#3612, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_17 = "_-94" (String#5077, DoABC#4)
// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1703 = "_-Q1U" (String#4333, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2046 = "_-y13" (String#3747, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3915 = "_-c1K" (String#3110, DoABC#4)
// _SafeStr_3916 = "_-h1I" (String#11012, DoABC#4)
// _SafeStr_3917 = "_-r14" (String#8420, DoABC#4)
// _SafeStr_3918 = "_-Cn" (String#6616, DoABC#4)
// _SafeStr_3919 = "_-nG" (String#6725, DoABC#4)
// _SafeStr_3920 = "_-V4" (String#2294, DoABC#4)
// _SafeStr_800 = "_-t11" (String#28496, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


