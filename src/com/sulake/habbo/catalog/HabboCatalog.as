// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.HabboCatalog

package com.sulake.habbo.catalog
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.session.product._SafeStr_1706;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.session.furniture._SafeStr_1707;
    import flash.geom.Point;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.avatar._SafeStr_1758;
    import com.sulake.habbo.quest._SafeStr_2046;
    import com.sulake.habbo.catalog.viewer.CatalogViewer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.catalog.purse.Purse;
    import com.sulake.habbo.catalog.marketplace.IMarketPlace;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.purchase.PurchaseConfirmationDialog;
    import com.sulake.habbo.catalog.purchase.GiftWrappingConfiguration;
    import com.sulake.habbo.catalog.club.ClubGiftController;
    import com.sulake.habbo.catalog.club.ClubBuyController;
    import com.sulake.habbo.catalog.club.ClubExtendController;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.catalog.viewer._SafeStr_3214;
    import com.sulake.habbo.catalog.purchase.PlacedObjectPurchaseData;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
    import com.sulake.habbo.catalog.targetedoffers.OfferController;
    import com.sulake.habbo.catalog.viewer.GameTokensOffer;
    import _-AE._SafeStr_1533;
    import com.sulake.habbo.catalog.navigation.RequestedPage;
    import com.sulake.habbo.catalog.purchase.RoomAdPurchaseData;
    import com.sulake.habbo.catalog.purchase.RentConfirmationWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import _-AE._SafeStr_1565;
    import flash.utils.Timer;
    import com.sulake.habbo.catalog.offers.OfferCenter;
    import com.sulake.habbo.catalog.clubcenter.HabboClubCenter;
    import com.sulake.iid.IIDHabboClubCenter;
    import com.sulake.habbo.catalog.vault.VaultController;
    import com.sulake.iid.IIDVaultController;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3189;
    import flash.display.Bitmap;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboNewNavigator;
    import com.sulake.iid.IIDHabboFriendBar;
    import com.sulake.iid.IIDHabboGroupsManager;
    import com.sulake.iid.IIDHabboAvatarEditor;
    import com.sulake.iid.IIDHabboQuestEngine;
    import _-W1K._SafeStr_529;
    import _-AE._SafeStr_914;
    import _-AE._SafeStr_148;
    import _-W1K._SafeStr_990;
    import _-AE._SafeStr_743;
    import _-AE._SafeStr_973;
    import _-AE._SafeStr_739;
    import _-qw._SafeStr_243;
    import _-AE._SafeStr_639;
    import _-AE._SafeStr_236;
    import _-EK._SafeStr_446;
    import _-AE._SafeStr_765;
    import _-12y._SafeStr_437;
    import _-qw._SafeStr_412;
    import _-AE._SafeStr_205;
    import _-AE._SafeStr_258;
    import _-AE._SafeStr_289;
    import _-AE._SafeStr_696;
    import _-qw._SafeStr_868;
    import _-AE._SafeStr_582;
    import _-qw._SafeStr_1008;
    import _-AE._SafeStr_842;
    import _-W1K._SafeStr_562;
    import _-AE.SnowWarGameTokensMessageEvent;
    import _-qw._SafeStr_845;
    import _-EK._SafeStr_281;
    import _-AE._SafeStr_277;
    import _-qw._SafeStr_522;
    import _-y1x._SafeStr_605;
    import _-AE._SafeStr_652;
    import _-AE._SafeStr_818;
    import _-AE._SafeStr_166;
    import _-qw._SafeStr_598;
    import _-AE._SafeStr_248;
    import _-AE._SafeStr_749;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import _-q1n._SafeStr_155;
    import com.sulake.habbo.catalog.navigation._SafeStr_3107;
    import com.sulake.core._SafeStr_79;
    import com.sulake.core.communication.messages.IMessageComposer;
    import _-q1n._SafeStr_915;
    import _-q1n.PurchaseSnowWarGameTokensOfferComposer;
    import _-q1n._SafeStr_805;
    import _-q1n._SafeStr_477;
    import _-q1n._SafeStr_879;
    import _-q1n._SafeStr_560;
    import _-q1n._SafeStr_873;
    import _-XO._SafeStr_296;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.catalog.navigation._SafeStr_3170;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;
    import _-CH._SafeStr_126;
    import _-q1n._SafeStr_380;
    import _-q1n._SafeStr_754;
    import _-CH._SafeStr_389;
    import _-CH._SafeStr_755;
    import _-CH._SafeStr_950;
    import _-CH._SafeStr_358;
    import _-CH._SafeStr_387;
    import com.sulake.core.assets.BitmapDataAsset;
    import _-q1n._SafeStr_431;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.utils.WindowToggle;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.tracking.HabboTracking;
    import flash.events.Event;
    import _-q1n._SafeStr_494;
    import _-q1n._SafeStr_828;
    import com.sulake.habbo.catalog.navigation.CatalogNavigator;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetRoomChangedEvent;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.catalog.marketplace.MarketPlaceLogic;
    import _-q1n._SafeStr_832;
    import _-q1n._SafeStr_1030;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-g1G._SafeStr_1209;
    import com.sulake.habbo.catalog.viewer.PageLocalization;
    import com.sulake.habbo.catalog.viewer.IPageLocalization;
    import _-AE._SafeStr_1406;
    import com.sulake.habbo.catalog.viewer._SafeStr_3151;
    import _-AE._SafeStr_1611;
    import com.sulake.habbo.catalog.viewer.Product;
    import _-g1G._SafeStr_1206;
    import _-g1G._SafeStr_1191;
    import _-g1G._SafeStr_1288;
    import com.sulake.habbo.catalog.navigation.events.CatalogFurniPurchaseEvent;
    import _-g1G._SafeStr_1055;
    import _-NF._SafeStr_1243;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
    import _-kx._SafeStr_1117;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import com.sulake.habbo.catalog.purse.PurseUpdateEvent;
    import _-NF._SafeStr_1274;
    import flash.external.ExternalInterface;
    import _-g1G._SafeStr_1484;
    import _-kC._SafeStr_1051;
    import com.sulake.habbo.catalog.marketplace._SafeStr_3209;
    import _-kC._SafeStr_1353;
    import _-kC._SafeStr_1421;
    import _-g1G._SafeStr_1381;
    import _-g1G._SafeStr_1273;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetPalettesEvent;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import _-q1n._SafeStr_409;
    import com.sulake.habbo.catalog.event.CatalogUserEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.friendbar.events.FriendBarSelectionEvent;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedOnUserEvent;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.data._SafeStr_1613;
    import com.sulake.room.object.IRoomObjectController;
    import _-q1n._SafeStr_264;
    import _-q1n._SafeStr_803;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
    import _-t8._SafeStr_922;
    import _-j1G._SafeStr_626;
    import com.sulake.habbo.inventory.events.HabboInventoryItemAddedEvent;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.utils.getTimer;
    import _-g1G.SnowWarGameTokensMessageParser;
    import _-g1G.SnowWarGameTokenOffer;
    import _-q1n.GetSnowWarGameTokensOfferComposer;
    import com.sulake.habbo.groups.events.GuildSettingsChangedInManageEvent;
    import _-q1n._SafeStr_486;
    import _-q1n._SafeStr_493;
    import _-q1n._SafeStr_829;
    import _-g1G._SafeStr_1144;
    import _-g1G._SafeStr_1052;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import _-g1G._SafeStr_1463;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBuilderSubscriptionUpdatedEvent;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.catalog.viewer._SafeStr_3211;
    import com.sulake.habbo.utils._SafeStr_3270;
    import com.sulake.habbo.catalog.offers.IOfferExtension;
    import com.sulake.habbo.catalog.offers.IOfferCenter;
    import com.sulake.iid.*;

    public class HabboCatalog extends _SafeStr_20 implements IHabboCatalog, _SafeStr_1706, _SafeStr_41, ILinkEventTracker, _SafeStr_1707 
    {

        public static const GET_SNOWWAR_TOKENS:String = "GET_SNOWWAR_TOKENS";
        public static const GET_SNOWWAR_TOKENS2:String = "GET_SNOWWAR_TOKENS2";
        public static const GET_SNOWWAR_TOKENS3:String = "GET_SNOWWAR_TOKENS3";
        private static const DESKTOP_WINDOW_LAYER:uint = 1;
        private static const DEFAULT_VIEW_LOCATION:Point = new Point(100, 20);
        private static const DEFAULT_VIEW_LOCATION_LARGE:Point = new Point(100, 5);
        private static const MAX_SEARCH_RESULTS_LENGTH:uint = 200;
        private static const NO_KNOWN_OFFER:int = -1;

        private var _windowManager:_SafeStr_1695;
        private var _communication:_SafeStr_25;
        private var _toolbar:IHabboToolbar;
        private var _roomEngine:IRoomEngine;
        private var _roomSessionManager:IRoomSessionManager;
        private var _roomSession:IRoomSession;
        private var _localization:_SafeStr_18;
        private var _inventory:_SafeStr_1708;
        private var _sessionDataManager:ISessionDataManager;
        private var _avatarRenderManager:_SafeStr_1701;
        private var _soundManager:_SafeStr_2088;
        private var _friendList:_SafeStr_1874;
        private var _newNavigator:IHabboNewNavigator;
        private var _avatarEditor:_SafeStr_1758;
        private var _questEngine:_SafeStr_2046;
        private var _SafeStr_3841:VideoOfferManager;
        private var _SafeStr_3853:Boolean = false;
        private var _SafeStr_3833:Boolean = false;
        private var _SafeStr_3854:CatalogViewer;
        private var _catalogNavigators:Dictionary;
        private var _SafeStr_3857:Purse;
        private var _SafeStr_3862:IMarketPlace;
        private var _SafeStr_3855:_SafeStr_3133;
        private var _SafeStr_3842:PurchaseConfirmationDialog;
        private var _SafeStr_3859:String;
        private var _SafeStr_3858:Boolean;
        private var _SafeStr_3870:Boolean = true;
        private var _SafeStr_3861:Boolean = false;
        private var _giftWrappingConfiguration:GiftWrappingConfiguration;
        private var _SafeStr_3863:ClubGiftController;
        private var _SafeStr_3843:ClubBuyController;
        private var _SafeStr_3844:ClubExtendController;
        private var _SafeStr_3845:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_3869:Boolean = false;
        private var _offerInFurniPlacing:_SafeStr_3141;
        private var _offerPlacingCallbackReceiver:_SafeStr_3214;
        private var _SafeStr_3873:PlacedObjectPurchaseData;
        private var _SafeStr_3865:Boolean;
        private var _SafeStr_3868:Boolean;
        private var _SafeStr_3840:RoomPreviewer;
        private var _SafeStr_3847:GuildMembershipsController;
        private var _SafeStr_3849:OfferController;
        private var _utils:HabboCatalogUtils;
        private var _SafeStr_3874:Boolean = false;
        private var _SafeStr_3871:String = null;
        private var _SafeStr_3850:GameTokensOffer;
        private var _SafeStr_3851:GameTokensOffer;
        private var _SafeStr_3852:GameTokensOffer;
        private var _bundleDiscountRuleset:_SafeStr_1533 = null;
        private var _SafeStr_3848:RequestedPage;
        private var _SafeStr_3860:int;
        private var _SafeStr_3856:RoomAdPurchaseData;
        private var _SafeStr_3846:RentConfirmationWindow;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _SafeStr_3864:String = "NORMAL";
        private var _SafeStr_3867:Vector.<_SafeStr_3130>;
        private var _frontPageItems:Vector.<_SafeStr_1565>;
        private var _SafeStr_3866:Timer;
        private var _SafeStr_8364:Dictionary;
        private var _SafeStr_3872:Boolean;
        private var _SafeStr_3879:int = -1;
        private var _SafeStr_3880:int;
        private var _SafeStr_3881:int;
        private var _SafeStr_3875:int;
        private var _SafeStr_3876:int;
        private var _builderMembershipUpdateTime:int;
        private var _builderMembershipDisplayUpdateTime:int;
        private var _SafeStr_3877:Boolean;
        private var _SafeStr_3878:Boolean;
        private var _offerCenter:OfferCenter;

        public function HabboCatalog(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3857 = new Purse();
            _utils = new HabboCatalogUtils(this);
            registerUpdateReceiver(this, 1);
            _SafeStr_3848 = new RequestedPage();
            _arg_1.attachComponent(new HabboClubCenter(_arg_1, 0, _arg_3), [new IIDHabboClubCenter()]);
            _arg_1.attachComponent(new VaultController(_arg_1, 0, _arg_3), [new IIDVaultController()]);
        }

        public static function setElementImageCentered(_arg_1:_SafeStr_3109, _arg_2:BitmapData, _arg_3:int=0):void
        {
            var _local_7:* = null;
            var _local_4:* = null;
            if (_arg_2 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.disposed)
            {
                return;
            };
            var _local_8:int = ((_arg_3 > 0) ? _arg_3 : _arg_1.height);
            var _local_5:int = int(((_arg_1.width - _arg_2.width) / 2));
            var _local_6:int = int(((_local_8 - _arg_2.height) / 2));
            if ((_arg_1 as _SafeStr_3264) != null)
            {
                _local_7 = _SafeStr_3264(_arg_1);
                if (((_local_7.bitmap == null) || (_arg_3 > 0)))
                {
                    _local_7.bitmap = new BitmapData(_arg_1.width, _local_8, true, 0xFFFFFF);
                };
                _local_7.bitmap.fillRect(_local_7.bitmap.rect, 0xFFFFFF);
                _local_7.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_5, _local_6), null, null, false);
                _arg_1.invalidate();
            }
            else
            {
                if ((_arg_1 as _SafeStr_3189) != null)
                {
                    _local_4 = _SafeStr_3189(_arg_1);
                    _local_4.setDisplayObject(new Bitmap(_arg_2));
                    _arg_1.invalidate();
                };
            };
        }


        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get avatarRenderManager():_SafeStr_1701
        {
            return (_avatarRenderManager);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get connection():IConnection
        {
            return (_communication.connection);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function get giftWrappingConfiguration():GiftWrappingConfiguration
        {
            return (_giftWrappingConfiguration);
        }

        public function get roomEngine():IRoomEngine
        {
            return (_roomEngine);
        }

        public function get soundManager():_SafeStr_2088
        {
            return (_soundManager);
        }

        public function get roomPreviewer():RoomPreviewer
        {
            if (_SafeStr_3840 == null)
            {
                initializeRoomPreviewer();
            };
            return (_SafeStr_3840);
        }

        public function get navigator():_SafeStr_1696
        {
            return (_newNavigator.legacyNavigator);
        }

        public function get utils():HabboCatalogUtils
        {
            return (_utils);
        }

        public function get questEngine():_SafeStr_2046
        {
            return (_questEngine);
        }

        public function get videoOffers():IVideoOfferManager
        {
            return (_SafeStr_3841);
        }

        public function get frontPageItems():Vector.<_SafeStr_1565>
        {
            return (_frontPageItems);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }, false, [{
                "type":"HTE_TOOLBAR_CLICK",
                "callback":onHabboToolbarEvent
            }]), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            }, false, [{
                "type":"REOE_PLACED",
                "callback":onObjectPlacedInRoom
            }, {
                "type":"REOE_PLACED_ON_USER",
                "callback":onObjectPlaceOnUser
            }, {
                "type":"REOE_SELECTED",
                "callback":onObjectSelected
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }, false), new ComponentDependency(new IIDHabboInventory(), function (_arg_1:_SafeStr_1708):void
            {
                _inventory = _arg_1;
            }, false, [{
                "type":"HABBO_INVENTORY_ITEM_ADDED",
                "callback":onItemAddedToInventory
            }]), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarRenderManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboSoundManager(), function (_arg_1:_SafeStr_2088):void
            {
                _soundManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }, false, [{
                "type":"RSE_STARTED",
                "callback":onRoomSessionEvent
            }, {
                "type":"RSE_ENDED",
                "callback":onRoomSessionEvent
            }]), new ComponentDependency(new IIDHabboFriendList(), function (_arg_1:_SafeStr_1874):void
            {
                _friendList = _arg_1;
            }, false), new ComponentDependency(new IIDHabboNewNavigator(), function (_arg_1:IHabboNewNavigator):void
            {
                _newNavigator = _arg_1;
            }, false), new ComponentDependency(new IIDHabboFriendBar(), null, false, [{
                "type":"FBVE_FRIEND_SELECTED",
                "callback":onFriendBarSelectionEvent
            }]), new ComponentDependency(new IIDHabboGroupsManager(), null, false, [{
                "type":"GSCIME_GUILD_VISUAL_SETTINGS_CHANGED",
                "callback":onGuildVisualSettingsChanged
            }]), new ComponentDependency(new IIDHabboAvatarEditor(), function (_arg_1:_SafeStr_1758):void
            {
                _avatarEditor = _arg_1;
            }, false), new ComponentDependency(new IIDHabboQuestEngine(), function (_arg_1:_SafeStr_2046):void
            {
                _questEngine = _arg_1;
            }, false)]));
        }

        override protected function initComponent():void
        {
            _messageEvents = new Vector.<IMessageEvent>(0);
            addMessageEvent(new _SafeStr_529(onApproveNameResult));
            addMessageEvent(new _SafeStr_914(onPurchaseOK));
            addMessageEvent(new _SafeStr_148(onBuildersClubFurniCount));
            addMessageEvent(new _SafeStr_990(onSubscriptionInfo));
            addMessageEvent(new _SafeStr_743(onCatalogPublished));
            addMessageEvent(new _SafeStr_973(onCatalogPage));
            addMessageEvent(new _SafeStr_739(onHabboClubExtendOffer));
            addMessageEvent(new _SafeStr_243(onMarketplaceConfiguration));
            addMessageEvent(new _SafeStr_639(onNotEnoughBalance));
            addMessageEvent(new _SafeStr_236(onVoucherRedeemOk));
            addMessageEvent(new _SafeStr_446(onActivityPointNotification));
            addMessageEvent(new _SafeStr_765(onProductOffer));
            addMessageEvent(new _SafeStr_437(onCreditBalance));
            addMessageEvent(new _SafeStr_412(onMarketplaceItemStats));
            addMessageEvent(new _SafeStr_205(onPurchaseError));
            addMessageEvent(new _SafeStr_258(onCatalogIndex));
            addMessageEvent(new _SafeStr_289(onGiftWrappingConfiguration));
            addMessageEvent(new _SafeStr_696(onGiftReceiverNotFound));
            addMessageEvent(new _SafeStr_868(onMarketPlaceCancelResult));
            addMessageEvent(new _SafeStr_582(onHabboClubOffers));
            addMessageEvent(new _SafeStr_1008(onMarketPlaceBuyResult));
            addMessageEvent(new _SafeStr_842(onClubGiftInfo));
            addMessageEvent(new _SafeStr_562(onGuildMemberships));
            addMessageEvent(new SnowWarGameTokensMessageEvent(onSnowWarGameTokenOffer));
            addMessageEvent(new _SafeStr_845(onMarketplaceMakeOfferResult));
            addMessageEvent(new _SafeStr_281(onActivityPoints));
            addMessageEvent(new _SafeStr_277(onLimitedEditionSoldOut));
            addMessageEvent(new _SafeStr_522(onMarketPlaceOwnOffers));
            addMessageEvent(new _SafeStr_605(onRoomExit));
            addMessageEvent(new _SafeStr_652(onVoucherRedeemError));
            addMessageEvent(new _SafeStr_818(onPurchaseNotAllowed));
            addMessageEvent(new _SafeStr_166(onBuildersClubSubscriptionStatus));
            addMessageEvent(new _SafeStr_598(onMarketPlaceOffers));
            addMessageEvent(new _SafeStr_248(onSellablePalettes));
            addMessageEvent(new _SafeStr_749(onBundleDiscountRulesetMessageEvent));
            context.addLinkEventTracker(this);
            _sessionDataManager.loadProductData(this);
            _SafeStr_3868 = isNewItemsNotificationEnabled();
            _SafeStr_3841 = new VideoOfferManager(this);
            _SafeStr_3849 = new OfferController(this);
            _SafeStr_3867 = _sessionDataManager.getFurniData(this);
            _SafeStr_8364 = null;
        }

        private function addMessageEvent(_arg_1:IMessageEvent):void
        {
            _messageEvents.push(_communication.addHabboConnectionMessageEvent(_arg_1));
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            removeUpdateReceiver(this);
            if (((!(_messageEvents == null)) && (!(_communication == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _communication.removeHabboConnectionMessageEvent(_local_1);
                };
            };
            if (_SafeStr_3841)
            {
                _SafeStr_3841.dispose();
                _SafeStr_3841 = null;
            };
            if (_offerCenter != null)
            {
                _offerCenter.dispose();
                _offerCenter = null;
            };
            reset(true);
            context.removeLinkEventTracker(this);
            if (_SafeStr_3842 != null)
            {
                _SafeStr_3842.dispose();
                _SafeStr_3842 = null;
            };
            _SafeStr_3857 = null;
            _SafeStr_3862 = null;
            if (_SafeStr_3843 != null)
            {
                _SafeStr_3843.dispose();
                _SafeStr_3843 = null;
            };
            if (_SafeStr_3844 != null)
            {
                _SafeStr_3844.dispose();
                _SafeStr_3844 = null;
            };
            if (_SafeStr_3845 != null)
            {
                _SafeStr_3845.dispose();
                _SafeStr_3845 = null;
            };
            _roomSession = null;
            if (_SafeStr_3846 != null)
            {
                _SafeStr_3846.dispose();
                _SafeStr_3846 = null;
            };
            resetPlacedOfferData();
            _SafeStr_3869 = false;
            _offerPlacingCallbackReceiver = null;
            if (_SafeStr_3840 != null)
            {
                _SafeStr_3840.dispose();
                _SafeStr_3840 = null;
            };
            if (_SafeStr_3847 != null)
            {
                _SafeStr_3847.dispose();
                _SafeStr_3847 = null;
            };
            if (_utils != null)
            {
                _utils.dispose();
                _utils = null;
            };
            disposeSnowWarTokens();
            if (_SafeStr_3848)
            {
                _SafeStr_3848 = null;
            };
            if (_SafeStr_3849)
            {
                _SafeStr_3849.dispose();
                _SafeStr_3849 = null;
            };
            super.dispose();
        }

        private function disposeSnowWarTokens():void
        {
            if (_SafeStr_3850 != null)
            {
                _SafeStr_3850.dispose();
                _SafeStr_3850 = null;
            };
            if (_SafeStr_3851 != null)
            {
                _SafeStr_3851.dispose();
                _SafeStr_3851 = null;
            };
            if (_SafeStr_3852 != null)
            {
                _SafeStr_3852.dispose();
                _SafeStr_3852 = null;
            };
        }

        private function init():Boolean
        {
            if (((!(_SafeStr_3853)) && (_SafeStr_3833)))
            {
                createMainWindow();
                createCatalogNavigators();
                createCatalogViewer();
                _SafeStr_3853 = true;
                updatePurse();
                createMarketPlace();
                createClubGiftController();
                getGiftWrappingConfiguration();
                createClubBuyController();
                createClubExtendController();
                createGroupMembershipsController();
                initBundleDiscounts();
                events.dispatchEvent(new CatalogEvent("CATALOG_INITIALIZED"));
                send(new _SafeStr_155());
                return (true);
            };
            return (false);
        }

        private function reset(_arg_1:Boolean=false):void
        {
            var _local_2:Boolean;
            _SafeStr_3853 = false;
            if (_SafeStr_3854 != null)
            {
                _SafeStr_3854.dispose();
                _SafeStr_3854 = null;
            };
            if (_catalogNavigators != null)
            {
                for each (var _local_3:_SafeStr_3107 in _catalogNavigators)
                {
                    _local_3.dispose();
                };
                _catalogNavigators = null;
            };
            if (_SafeStr_3855 != null)
            {
                _SafeStr_3855.dispose();
                _SafeStr_3855 = null;
            };
            if (!_arg_1)
            {
                if (_sessionDataManager == null)
                {
                    _SafeStr_79.crash("Could not reload product data after reset() because _sessionDataManager was null", 7);
                    return;
                };
                _local_2 = _sessionDataManager.loadProductData(this);
                if (_local_2)
                {
                    init();
                }
                else
                {
                    events.dispatchEvent(new CatalogEvent("CATALOG_NOT_READY"));
                };
            };
        }

        private function send(_arg_1:IMessageComposer):void
        {
            if (connection == null)
            {
                return;
            };
            connection.send(_arg_1);
        }

        public function loadCatalogPage(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            isBusy = true;
            _SafeStr_3860 = _arg_1;
            send(new _SafeStr_915(_arg_1, _arg_2, _arg_3));
        }

        public function purchaseGameTokensOffer(_arg_1:String):void
        {
            if (((_arg_1 == "GET_SNOWWAR_TOKENS") && (_SafeStr_3850)))
            {
                send(new PurchaseSnowWarGameTokensOfferComposer(_SafeStr_3850.offerId));
            }
            else
            {
                if (((_arg_1 == "GET_SNOWWAR_TOKENS2") && (_SafeStr_3851)))
                {
                    send(new PurchaseSnowWarGameTokensOfferComposer(_SafeStr_3851.offerId));
                }
                else
                {
                    if (((_arg_1 == "GET_SNOWWAR_TOKENS3") && (_SafeStr_3852)))
                    {
                        send(new PurchaseSnowWarGameTokensOfferComposer(_SafeStr_3852.offerId));
                    };
                };
            };
        }

        public function purchaseOffer(_arg_1:int, _arg_2:String="", _arg_3:int=1):void
        {
            var _local_4:*;
            var _local_5:_SafeStr_3107 = getCatalogNavigator("NORMAL");
            if (_local_5 != null)
            {
                _local_4 = _local_5.getNodesByOfferId(_arg_1, true);
                if (_local_4 != null)
                {
                    purchaseProduct(_local_4[0].pageId, _arg_1, _arg_2, _arg_3);
                };
            };
        }

        public function purchaseProduct(_arg_1:int, _arg_2:int, _arg_3:String="", _arg_4:int=1):void
        {
            if (((roomAdPurchaseData == null) || (!(roomAdPurchaseData.offerId == _arg_2))))
            {
                send(new _SafeStr_805(_arg_1, _arg_2, _arg_3, _arg_4));
            }
            else
            {
                if (((_SafeStr_3856.extended) && (_SafeStr_3856.expirationTime.getTime() < new Date().getTime())))
                {
                    _SafeStr_3856.extended = false;
                };
                send(new _SafeStr_477(_arg_1, _arg_2, roomAdPurchaseData.flatId, roomAdPurchaseData.name, roomAdPurchaseData.extended, roomAdPurchaseData.description, roomAdPurchaseData.categoryId));
            };
        }

        public function purchaseVipMembershipExtension(_arg_1:int):void
        {
            send(new _SafeStr_879(_arg_1));
        }

        public function purchaseBasicMembershipExtension(_arg_1:int):void
        {
            send(new _SafeStr_560(_arg_1));
        }

        public function purchaseProductAsGift(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean=false):void
        {
            send(new _SafeStr_873(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9));
        }

        public function get roomAdPurchaseData():RoomAdPurchaseData
        {
            return (_SafeStr_3856);
        }

        public function set roomAdPurchaseData(_arg_1:RoomAdPurchaseData):void
        {
            _SafeStr_3856 = _arg_1;
        }

        public function approveName(_arg_1:String, _arg_2:int):void
        {
            send(new _SafeStr_296(_arg_1, _arg_2));
        }

        public function set giftReceiver(_arg_1:String):void
        {
            _SafeStr_3859 = _arg_1;
        }

        public function getSeasonalCurrencyActivityPointType():int
        {
            return (getInteger("seasonalcurrencyindicator.currency", 1));
        }

        public function showPurchaseConfirmation(_arg_1:_SafeStr_3141, _arg_2:int, _arg_3:String="", _arg_4:int=1, _arg_5:IStuffData=null, _arg_6:String=null, _arg_7:Boolean=true, _arg_8:BitmapData=null):void
        {
            var _local_14:*;
            var _local_11:* = null;
            var _local_9:* = null;
            var _local_13:* = null;
            if (_arg_2 == -12345678)
            {
                _local_14 = currentCatalogNavigator.getNodesByOfferId(_arg_1.offerId, true);
                if (_local_14 != null)
                {
                    _arg_2 = _local_14[0].pageId;
                };
            };
            _SafeStr_14.log(("buy: " + [_arg_4, _arg_1.offerId, _arg_3]));
            var _local_12:int = _arg_1.priceInCredits;
            var _local_15:int = _arg_1.priceInActivityPoints;
            if (multiplePurchaseEnabled)
            {
                _local_12 = _utils.calculateBundlePrice(true, _arg_1.priceInCredits, _arg_4);
                _local_15 = _utils.calculateBundlePrice(true, _arg_1.priceInActivityPoints, _arg_4);
            };
            var _local_10:* = (_arg_1 is GameTokensOffer);
            if ((((_local_12 > 0) && (_local_12 > _SafeStr_3857.credits)) && (!(_local_10))))
            {
                showNotEnoughCreditsAlert();
                return;
            };
            if ((((_local_15 > 0) && (_local_15 > _SafeStr_3857.getActivityPointsForType(_arg_1.activityPointType))) && (!(_local_10))))
            {
                showNotEnoughActivityPointsAlert(_arg_1.activityPointType);
                return;
            };
            if ((((_arg_1 is Offer) || (_SafeStr_3858)) || (_arg_1 is GameTokensOffer)))
            {
                if (((_SafeStr_3842 == null) || (_SafeStr_3842.disposed)))
                {
                    _SafeStr_3842 = new PurchaseConfirmationDialog(_localization, assets);
                };
                _local_11 = [];
                if (_friendList != null)
                {
                    _local_11 = _friendList.getFriendNames();
                };
                _local_9 = _arg_6;
                if (_local_9 == null)
                {
                    if (_SafeStr_3859 != null)
                    {
                        _local_9 = _SafeStr_3859;
                    };
                };
                _SafeStr_3842.showOffer(this, _roomEngine, _arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _local_11, _local_9, _arg_8);
            }
            else
            {
                if ((_arg_1 is ClubBuyOfferData))
                {
                    if (_arg_2 == -1)
                    {
                        _local_13 = currentCatalogNavigator.getNodeByName("hc_membership");
                        if (_local_13 != null)
                        {
                            _arg_2 = _local_13.pageId;
                        };
                    };
                    if (_arg_2 >= 0)
                    {
                        _SafeStr_3843.showConfirmation((_arg_1 as ClubBuyOfferData), _arg_2);
                    };
                };
            };
            if (_SafeStr_3858)
            {
                _SafeStr_3858 = false;
                _SafeStr_3842.turnIntoGifting();
            };
        }

        public function purchaseWillBeGift(_arg_1:Boolean):void
        {
            _SafeStr_3858 = _arg_1;
        }

        private function initializeRoomPreviewer():void
        {
            if ((((!(_roomEngine == null)) && (_roomEngine.isInitialized)) && (getBoolean("catalog.furniture.animation"))))
            {
                if (_SafeStr_3840 == null)
                {
                    _SafeStr_3840 = new RoomPreviewer(_roomEngine);
                    _SafeStr_3840.createRoomForPreviews();
                };
            };
        }

        private function isNewItemsNotificationEnabled():Boolean
        {
            return (getBoolean("toolbar.new_additions.notification.enabled"));
        }

        public function openCatalog():void
        {
            cancelFurniInMover();
            toggleCatalog("NORMAL", true);
        }

        public function openCatalogPage(_arg_1:String, _arg_2:String=null):void
        {
            cancelFurniInMover();
            toggleCatalog(((_arg_2 == null) ? "NORMAL" : _arg_2), true, false);
            if ((((!(_SafeStr_3853)) || (_catalogNavigators == null)) || (!(currentCatalogNavigator.initialized))))
            {
                _SafeStr_3848.requestByName = _arg_1;
                return;
            };
            currentCatalogNavigator.openPage(_arg_1);
        }

        public function openRoomAdCatalogPageInExtendedMode(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Date, _arg_6:int):void
        {
            var _local_8:int = _SafeStr_3860;
            _SafeStr_3856 = new RoomAdPurchaseData();
            _SafeStr_3856.name = _arg_2;
            _SafeStr_3856.extended = true;
            _SafeStr_3856.extendedFlatId = _roomEngine.activeRoomId;
            _SafeStr_3856.description = _arg_3;
            _SafeStr_3856.flatId = _roomEngine.activeRoomId;
            _SafeStr_3856.roomName = _arg_4;
            _SafeStr_3856.expirationTime = _arg_5;
            _SafeStr_3856.categoryId = _arg_6;
            openCatalogPage(_arg_1);
            var _local_7:_SafeStr_3170 = currentCatalogNavigator.getNodeByName(_arg_1);
            if (((!(_local_7 == null)) && (_local_7.pageId == _local_8)))
            {
                getRoomAdsPurchaseInfo();
            };
        }

        public function openCatalogPageByOfferId(_arg_1:int, _arg_2:String):void
        {
            openCatalogPageById(-12345678, _arg_1, _arg_2);
        }

        public function openCatalogPageById(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            if ((((_SafeStr_3853) && (!(_catalogNavigators == null))) && (getCatalogNavigator(_arg_3).initialized)))
            {
                toggleCatalog(_arg_3, true, false);
                _SafeStr_3854.setForceRefresh();
                currentCatalogNavigator.openPageById(_arg_1, _arg_2);
            }
            else
            {
                toggleCatalog(_arg_3);
                _SafeStr_3848.requestById = _arg_1;
                _SafeStr_3848.requestedOfferId = _arg_2;
            };
        }

        public function openInventoryCategory(_arg_1:String):void
        {
            if (_inventory == null)
            {
                return;
            };
            _inventory.toggleInventoryPage(_arg_1);
        }

        public function openCreditsHabblet():void
        {
            HabboWebTools.openWebPageAndMinimizeClient(getProperty("web.shop.relativeUrl"));
        }

        public function get privateRoomSessionActive():Boolean
        {
            return (_SafeStr_3861);
        }

        public function get tradingActive():Boolean
        {
            if (_inventory == null)
            {
                return (false);
            };
            return (_inventory.tradingActive);
        }

        public function getProductData(_arg_1:String):_SafeStr_3182
        {
            return (_sessionDataManager.getProductData(_arg_1));
        }

        public function getFurnitureData(_arg_1:int, _arg_2:String):_SafeStr_3130
        {
            var _local_3:* = null;
            if (_arg_2 == "s")
            {
                _local_3 = _sessionDataManager.getFloorItemData(_arg_1);
            };
            if (_arg_2 == "i")
            {
                _local_3 = _sessionDataManager.getWallItemData(_arg_1);
            };
            return (_local_3);
        }

        public function getFurnitureDataByName(_arg_1:String, _arg_2:String, _arg_3:int=0):_SafeStr_3130
        {
            var _local_4:* = null;
            if (_sessionDataManager == null)
            {
                return (null);
            };
            if (_arg_2 == "s")
            {
                _local_4 = _sessionDataManager.getFloorItemDataByName(_arg_1);
            };
            if (_arg_2 == "i")
            {
                _local_4 = _sessionDataManager.getWallItemDataByName(_arg_1);
            };
            return (_local_4);
        }

        public function getPurse():_SafeStr_3142
        {
            return (_SafeStr_3857);
        }

        public function getMarketPlace():IMarketPlace
        {
            return (_SafeStr_3862);
        }

        public function getClubGiftController():ClubGiftController
        {
            return (_SafeStr_3863);
        }

        public function getClubBuyController():ClubBuyController
        {
            return (_SafeStr_3843);
        }

        public function getClubExtendController():ClubExtendController
        {
            return (_SafeStr_3844);
        }

        public function getPublicMarketPlaceOffers(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):void
        {
            send(new _SafeStr_126(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function getRoomAdsPurchaseInfo():void
        {
            send(new _SafeStr_380());
        }

        public function sendRoomAdPurchaseInitiatedEvent():void
        {
            send(new _SafeStr_754());
        }

        public function getOwnMarketPlaceOffers():void
        {
            send(new _SafeStr_389());
        }

        public function buyMarketPlaceOffer(_arg_1:int):void
        {
            send(new _SafeStr_755(_arg_1));
        }

        public function redeemSoldMarketPlaceOffers():void
        {
            send(new _SafeStr_950());
        }

        public function redeemExpiredMarketPlaceOffer(_arg_1:int):void
        {
            send(new _SafeStr_358(_arg_1));
        }

        public function getMarketplaceItemStats(_arg_1:int, _arg_2:int):void
        {
            if (!_communication)
            {
                return;
            };
            send(new _SafeStr_387(_arg_1, _arg_2));
        }

        public function getGroupMembershipsController():GuildMembershipsController
        {
            return (_SafeStr_3847);
        }

        public function getPixelEffectIcon(_arg_1:int):BitmapData
        {
            var _local_2:BitmapDataAsset = ((_inventory as _SafeStr_20).assets.getAssetByName((("fx_icon_" + _arg_1) + "_png")) as BitmapDataAsset);
            if (((!(_local_2 == null)) && (!(_local_2.content == null))))
            {
                return ((_local_2.content as BitmapData).clone());
            };
            return (new BitmapData(1, 1, true, 0xFFFFFF));
        }

        public function getSubscriptionProductIcon(_arg_1:int):BitmapData
        {
            var _local_2:BitmapDataAsset = (assets.getAssetByName("icon_hc") as BitmapDataAsset);
            if (_local_2 != null)
            {
                return ((_local_2.content as BitmapData).clone());
            };
            return (new BitmapData(1, 1, true, 0xFFFFFF));
        }

        public function getSellablePetPalettes(_arg_1:String):Array
        {
            var _local_2:Array = _SafeStr_3845.getValue(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.slice());
            };
            send(new _SafeStr_431(_arg_1));
            return (null);
        }

        private function updatePurse():void
        {
            var _local_4:* = null;
            if (_SafeStr_3855 == null)
            {
                return;
            };
            _localization.registerParameter("catalog.purse.creditbalance", "balance", _SafeStr_3857.credits);
            _localization.registerParameter("catalog.purse.pixelbalance", "balance", _SafeStr_3857.getActivityPointsForType(0));
            var _local_3:uint = 11;
            if (!_SafeStr_3857.hasClubLeft)
            {
                _local_4 = "catalog.purse.club.join";
            }
            else
            {
                if (_SafeStr_3857.isVIP)
                {
                    _local_4 = "catalog.purse.vipdays";
                    _local_3 = 12;
                }
                else
                {
                    _local_4 = "catalog.purse.clubdays";
                };
                _localization.registerParameter(_local_4, "days", _SafeStr_3857.clubDays);
                _localization.registerParameter(_local_4, "months", _SafeStr_3857.clubPeriods);
            };
            var _local_2:IIconWindow = (_SafeStr_3855.findChildByName("clubIcon") as IIconWindow);
            if (_local_2)
            {
                _local_2.style = _local_3;
            };
            var _local_1:ITextWindow = (_SafeStr_3855.findChildByName("clubText") as ITextWindow);
            if (_local_1)
            {
                _local_1.caption = _localization.getLocalization(_local_4);
            };
        }

        private function onHabboToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            if (_arg_1.type != "HTE_TOOLBAR_CLICK")
            {
                return;
            };
            switch (_arg_1.iconId)
            {
                case "HTIE_ICON_CATALOGUE":
                    toggleCatalog("NORMAL");
                    return;
                case "HTIE_ICON_BUILDER":
                    toggleCatalog("BUILDERS_CLUB");
                    return;
            };
        }

        private function setElementColour(_arg_1:String, _arg_2:int):void
        {
            if (_SafeStr_3855 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = _SafeStr_3855.findChildByName(_arg_1);
            if (_local_3 != null)
            {
                _local_3.color = _arg_2;
            };
        }

        public function get buildersClubEnabled():Boolean
        {
            return (getBoolean("builders.club.enabled"));
        }

        public function toggleCatalog(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void
        {
            var _local_4:* = null;
            if (((!(_sessionDataManager.hasSecurity(5))) && (!(buildersClubEnabled))))
            {
                _arg_1 = "NORMAL";
            };
            var _local_5:* = (!(_arg_1 == _SafeStr_3864));
            _SafeStr_3864 = _arg_1;
            cancelFurniInMover();
            if (_SafeStr_3855 == null)
            {
                if (init() == false)
                {
                    return;
                };
            };
            if (((currentCatalogNavigator == null) || (!(currentCatalogNavigator.initialized))))
            {
                refreshCatalogIndex(_SafeStr_3864);
            };
            if ((((!(mainWindowVisible())) || (_arg_2)) || (_local_5)))
            {
                if (_SafeStr_3865)
                {
                    _SafeStr_3865 = false;
                    events.dispatchEvent(new CatalogEvent("CATALOG_NEW_ITEMS_HIDE"));
                    markNewAdditionPageOpened();
                };
                showMainWindow();
            }
            else
            {
                if (!WindowToggle.isHiddenByOtherWindows(_SafeStr_3855))
                {
                    hideMainWindow();
                };
            };
            if (mainWindowVisible())
            {
                if (_SafeStr_3855 != null)
                {
                    _SafeStr_3855.activate();
                    _local_4 = (_SafeStr_3855.findChildByName("search.input") as ITextFieldWindow);
                    if (_local_4)
                    {
                        _local_4.focus();
                        _local_4.setSelection(0, _local_4.text.length);
                    };
                }
                else
                {
                    _SafeStr_14.log("[Catalog] No main container!");
                };
                HabboTracking.getInstance().trackGoogle("catalogue", "open");
            };
            if (_SafeStr_3855 != null)
            {
                _SafeStr_3855.color = ((_arg_1 == "NORMAL") ? 4296112 : 16758076);
                _SafeStr_3855.caption = ((_arg_1 == "NORMAL") ? "${catalog.title}" : "${builder.catalog.title}");
                _SafeStr_3855.findChildByName("catalog.header.background.border").color = ((_arg_1 == "NORMAL") ? 4281819765 : 4283320388);
                _SafeStr_3855.findChildByName("catalog.header.background.body").color = ((_arg_1 == "NORMAL") ? 4279123794 : 4281149220);
                _SafeStr_3855.findChildByName("catalog.mode.header").visible = (_arg_1 == "NORMAL");
                _SafeStr_3855.findChildByName("builder.mode.header").visible = (_arg_1 == "BUILDERS_CLUB");
                refreshBuilderStatus();
            };
            if (mainWindowVisible())
            {
                events.dispatchEvent(new Event("HABBO_CATALOG_TRACKING_EVENT_OPEN"));
            }
            else
            {
                events.dispatchEvent(new Event("HABBO_CATALOG_TRACKING_EVENT_CLOSE"));
            };
            if (((_local_5) && (!(currentCatalogNavigator == null))))
            {
                if (_arg_3)
                {
                    currentCatalogNavigator.deactivateCurrentNode();
                    currentCatalogNavigator.loadFrontPage();
                };
                currentCatalogNavigator.showIndex();
                if (_SafeStr_3854 != null)
                {
                    _SafeStr_3854.setForceRefresh();
                };
            };
        }

        private function getCurrentLayoutCode():String
        {
            if (_SafeStr_3854 == null)
            {
                return ("");
            };
            return (_SafeStr_3854.getCurrentLayoutCode());
        }

        private function refreshCatalogIndex(_arg_1:String):void
        {
            send(new _SafeStr_494(_arg_1));
        }

        private function markNewAdditionPageOpened():void
        {
            send(new _SafeStr_828());
        }

        private function createCatalogNavigators():void
        {
            _catalogNavigators = new Dictionary();
            _catalogNavigators["NORMAL"] = new CatalogNavigator(this, _SafeStr_3855, "NORMAL");
            _catalogNavigators["BUILDERS_CLUB"] = new CatalogNavigator(this, _SafeStr_3855, "BUILDERS_CLUB");
            var _local_1:BitmapDataAsset = (assets.getAssetByName("purse_coins_small") as BitmapDataAsset);
            setElementImage("creditsIcon", (_local_1.content as BitmapData));
            var _local_3:BitmapDataAsset = (assets.getAssetByName("purse_pixels_small") as BitmapDataAsset);
            setElementImage("pixelsIcon", (_local_3.content as BitmapData));
            var _local_2:BitmapDataAsset = (assets.getAssetByName("purse_club_small") as BitmapDataAsset);
            setElementImage("clubIcon", (_local_2.content as BitmapData));
        }

        private function createCatalogViewer():void
        {
            var _local_1:_SafeStr_3133 = (_SafeStr_3855.findChildByName("layoutContainer") as _SafeStr_3133);
            _SafeStr_3854 = new CatalogViewer(this, _local_1);
        }

        private function createMainWindow():void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            if (useNonTabbedCatalog())
            {
                _local_4 = "catalog_ubuntu";
            }
            else
            {
                _local_4 = "catalog_ubuntu_with_tabs";
            };
            var _local_5:XmlAsset = (assets.getAssetByName(_local_4) as XmlAsset);
            _SafeStr_3855 = (_windowManager.buildFromXML((_local_5.content as XML), 1) as _SafeStr_3133);
            _SafeStr_3855.tags.push("habbo_catalog");
            _SafeStr_3855.position = DEFAULT_VIEW_LOCATION_LARGE;
            hideMainWindow();
            var _local_3:_SafeStr_3109 = _SafeStr_3855.findChildByName("titlebar_close_button");
            if (_local_3 == null)
            {
                _local_3 = _SafeStr_3855.findChildByTag("close");
            };
            if (_local_3 != null)
            {
                _local_3.procedure = onWindowClose;
            };
            var _local_1:ITextFieldWindow = (_SafeStr_3855.findChildByName("search.input") as ITextFieldWindow);
            if (_local_1)
            {
                _local_1.addEventListener("WKE_KEY_DOWN", onSearchInputEvent);
                _local_1.addEventListener("WKE_KEY_UP", onSearchInputEvent);
                _local_1.setSelection(0, _local_1.text.length);
                _local_1.focus();
                _local_2 = _SafeStr_3855.findChildByName("clear_search_button");
                if (_local_2)
                {
                    _local_2.addEventListener("WME_CLICK", onClearSearch);
                };
            };
        }

        public function set isBusy(_arg_1:Boolean):void
        {
            var _local_2:* = null;
            if (_SafeStr_3855)
            {
                _SafeStr_3855.caption = ((_arg_1) ? "${generic.loading}" : "${catalog.title}");
                _local_2 = _SafeStr_3855.findChildByName("search_waiting_for_results_mask");
                if (_local_2)
                {
                    _local_2.visible = _arg_1;
                };
            };
        }

        private function onSelectSearch(_arg_1:WindowMouseEvent):void
        {
            var _local_2:ITextFieldWindow = (_arg_1.target as ITextFieldWindow);
            if (_local_2)
            {
                _local_2.setSelection(0, _local_2.text.length);
                _local_2.focus();
            };
        }

        private function onClearSearch(_arg_1:WindowMouseEvent=null):void
        {
            var _local_2:ITextFieldWindow = (_SafeStr_3855.findChildByName("search.input") as ITextFieldWindow);
            _local_2.caption = "";
            _local_2.setSelection(0, _local_2.text.length);
            _local_2.focus();
            var _local_3:IStaticBitmapWrapperWindow = (_SafeStr_3855.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
            _local_3.assetUri = "common_small_pen";
            if (_SafeStr_3854.previousPageId > 0)
            {
                currentCatalogNavigator.openPageById(_SafeStr_3854.previousPageId, -1);
            };
            _SafeStr_3855.findChildByName("search.helper").visible = true;
        }

        private function onSearchInputEvent(_arg_1:WindowKeyboardEvent):void
        {
            if (_arg_1.type == "WKE_KEY_DOWN")
            {
                if (_SafeStr_3866)
                {
                    _SafeStr_3866.stop();
                };
                return;
            };
            if (_SafeStr_3866 == null)
            {
                _SafeStr_3866 = new Timer(50, 1);
            };
            if (_arg_1.target.caption.length >= 3)
            {
                _SafeStr_3866.addEventListener("timer", onKeyUpSearchTimer);
                _SafeStr_3866.start();
            };
            var _local_2:_SafeStr_3109 = _SafeStr_3855.findChildByName("search.helper");
            _local_2.visible = (_arg_1.target.caption.length == 0);
            var _local_3:IStaticBitmapWrapperWindow = (_SafeStr_3855.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
            _local_3.assetUri = ((_arg_1.target.caption.length > 0) ? "icons_close" : "common_small_pen");
            if (_arg_1.target.caption.length == 0)
            {
                onClearSearch();
            }
            else
            {
                if (_arg_1.keyCode == 13)
                {
                    performSearch(_arg_1.target.caption);
                };
            };
        }

        private function onKeyUpSearchTimer(_arg_1:TimerEvent):void
        {
            var _local_2:ITextFieldWindow = (_SafeStr_3855.findChildByName("search.input") as ITextFieldWindow);
            performSearch(_local_2.caption);
        }

        private function performSearch(_arg_1:String):void
        {
            var _local_3:* = null;
            var _local_8:*;
            var _local_5:*;
            if (_SafeStr_3866)
            {
                _SafeStr_3866.stop();
            };
            if ((((_SafeStr_3867 == null) || (_arg_1 == null)) || (_arg_1.length == 0)))
            {
                return;
            };
            var _local_2:Array = [];
            var _local_4:Vector.<_SafeStr_3130> = new Vector.<_SafeStr_3130>(0);
            var _local_7:String = _arg_1.toLocaleLowerCase().replace(" ", "");
            for each (var _local_6:_SafeStr_3130 in _SafeStr_3867)
            {
                if (!((_SafeStr_3864 == "BUILDERS_CLUB") && (!(_local_6.availableForBuildersClub))))
                {
                    if (!((_SafeStr_3864 == "NORMAL") && (_local_6.excludedFromDynamic)))
                    {
                        _local_3 = [_local_6.localizedName, _local_6.description, _local_6.className].join(" ");
                        _local_3 = _local_3.replace(/ /gi, "");
                        if ((((_SafeStr_3864 == "BUILDERS_CLUB") && (_local_6.purchaseOfferId == -1)) && (_local_6.rentOfferId == -1)))
                        {
                            if (((!(_local_6.furniLine == "")) && (_local_2.indexOf(_local_6.furniLine) < 0)))
                            {
                                if (_local_3.toLocaleLowerCase().indexOf(_local_7) >= 0)
                                {
                                    _local_2.push(_local_6.furniLine);
                                };
                            };
                        }
                        else
                        {
                            _local_8 = currentCatalogNavigator.getNodesByOfferId(_local_6.purchaseOfferId, true);
                            _local_5 = currentCatalogNavigator.getNodesByOfferId(_local_6.rentOfferId, true);
                            if (((!(_local_8 == null)) || ((_SafeStr_3864 == "NORMAL") && (!(_local_5 == null)))))
                            {
                                if (_local_3.toLocaleLowerCase().indexOf(_local_7) >= 0)
                                {
                                    _local_4.push(_local_6);
                                    if (_local_4.length >= 200) break;
                                };
                            };
                        };
                    };
                };
            };
            localization.registerParameter("catalog.search.results", "count", _local_4.length.toString());
            localization.registerParameter("catalog.search.results", "needle", _arg_1);
            _SafeStr_3855.findChildByName("catalog.header.title").caption = "${catalog.search.header}";
            currentCatalogNavigator.deactivateCurrentNode();
            _SafeStr_3854.showSearchResults(_local_4);
            currentCatalogNavigator.filter(_local_7, _local_2);
        }

        public function furniDataReady():void
        {
            _SafeStr_3867 = _sessionDataManager.getFurniData(this);
            _SafeStr_8364 = null;
        }

        private function onRoomSessionEvent(_arg_1:RoomSessionEvent):void
        {
            switch (_arg_1.type)
            {
                case "RSE_STARTED":
                    _SafeStr_3861 = _arg_1.session.isPrivateRoom;
                    _roomSession = _arg_1.session;
                    break;
                case "RSE_ENDED":
                    _SafeStr_3861 = false;
                    _roomSession = null;
            };
            if (currentPage != null)
            {
                currentPage.dispatchWidgetEvent(new CatalogWidgetRoomChangedEvent());
            };
        }

        private function createMarketPlace():void
        {
            if (_SafeStr_3862 == null)
            {
                _SafeStr_3862 = new MarketPlaceLogic(this, _windowManager, _roomEngine);
            };
        }

        private function createClubGiftController():void
        {
            if (_SafeStr_3863 == null)
            {
                _SafeStr_3863 = new ClubGiftController(this);
            };
        }

        private function createClubBuyController():void
        {
            if (_SafeStr_3843 == null)
            {
                _SafeStr_3843 = new ClubBuyController(this, connection);
            };
        }

        private function createClubExtendController():void
        {
            if (_SafeStr_3844 == null)
            {
                _SafeStr_3844 = new ClubExtendController(this);
            };
        }

        private function createGroupMembershipsController():void
        {
            if (_SafeStr_3847 == null)
            {
                _SafeStr_3847 = new GuildMembershipsController(this);
            };
        }

        private function getGiftWrappingConfiguration():void
        {
            send(new _SafeStr_832());
        }

        public function getHabboClubOffers(_arg_1:int):void
        {
            send(new _SafeStr_1030(_arg_1));
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            hideMainWindow();
            if (_SafeStr_3854 != null)
            {
                _SafeStr_3854.catalogWindowClosed();
            };
        }

        private function onCatalogIndex(_arg_1:_SafeStr_258):void
        {
            var _local_2:_SafeStr_3107 = getCatalogNavigator(_arg_1.catalogType);
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_3865 = _arg_1.newAdditionsAvailable;
            _local_2.buildCatalogIndex(_arg_1.root);
            if (_arg_1.catalogType == _SafeStr_3864)
            {
                _local_2.showIndex();
            };
            switch (_SafeStr_3848.requestType)
            {
                case 0:
                    if (((((_SafeStr_3865) && (_SafeStr_3868)) && (!(newAdditionsPageOpenDisabled))) && (_arg_1.catalogType == "NORMAL")))
                    {
                        events.dispatchEvent(new CatalogEvent("CATALOG_NEW_ITEMS_SHOW"));
                        openCatalogPage("new_additions");
                    }
                    else
                    {
                        _local_2.loadFrontPage();
                    };
                    return;
                case 1:
                    _local_2.openPageById(_SafeStr_3848.requestId, _SafeStr_3848.requestedOfferId);
                    _SafeStr_3848.resetRequest();
                    return;
                case 2:
                    _local_2.openPage(_SafeStr_3848.requestName);
                    _SafeStr_3848.resetRequest();
                default:
            };
        }

        private function onCatalogPage(_arg_1:_SafeStr_973):void
        {
            var _local_10:*;
            var _local_11:* = null;
            var _local_8:* = null;
            var _local_12:* = null;
            var _local_13:_SafeStr_1209 = _arg_1.getParser();
            if (_local_13.catalogType != _SafeStr_3864)
            {
                return;
            };
            var _local_9:int = _local_13.pageId;
            var _local_4:String = _local_13.layoutCode;
            var _local_5:Array = _local_13.localization.images.concat();
            var _local_14:Array = _local_13.localization.texts.concat();
            var _local_2:IPageLocalization = new PageLocalization(_local_5, _local_14);
            var _local_15:int = _local_13.offerId;
            var _local_6:Boolean = _local_13.acceptSeasonCurrencyAsCredits;
            var _local_3:Vector.<_SafeStr_3141> = new Vector.<_SafeStr_3141>(0);
            for each (var _local_16:_SafeStr_1406 in _local_13.offers)
            {
                _local_10 = new Vector.<_SafeStr_3151>(0);
                _local_11 = getProductData(_local_16.localizationId);
                for each (var _local_7:_SafeStr_1611 in _local_16.products)
                {
                    _local_8 = getFurnitureData(_local_7.furniClassId, _local_7.productType);
                    _local_10.push(new Product(_local_7.productType, _local_7.furniClassId, _local_7.extraParam, _local_7.productCount, _local_11, _local_8, this, _local_7.uniqueLimitedItem, _local_7.uniqueLimitedItemSeriesSize, _local_7.uniqueLimitedItemsLeft));
                };
                if (!((_local_10.length == 0) && (!(HabboCatalogUtils.buildersClub(_local_16.localizationId)))))
                {
                    _local_12 = new Offer(_local_16.offerId, _local_16.localizationId, _local_16.isRent, _local_16.priceInCredits, _local_16.priceInActivityPoints, _local_16.activityPointType, _local_16.giftable, _local_16.clubLevel, _local_10, _local_16.bundlePurchaseAllowed, this);
                    if (((!(_local_12.productContainer == null)) && (isOfferCompatibleWithCurrentMode(_local_12))))
                    {
                        _local_3.push(_local_12);
                    }
                    else
                    {
                        _local_12.dispose();
                    };
                };
            };
            if (((!(_local_13.frontPageItems == null)) && (_local_13.frontPageItems.length > 0)))
            {
                _frontPageItems = _local_13.frontPageItems;
            };
            if (((!(_SafeStr_3854 == null)) && (_SafeStr_3860 == _local_9)))
            {
                _SafeStr_3854.showCatalogPage(_local_9, _local_4, _local_2, _local_3, _local_15, _local_6);
            };
            isBusy = false;
        }

        private function isOfferCompatibleWithCurrentMode(_arg_1:Offer):Boolean
        {
            return ((_SafeStr_3864 == "NORMAL") || ((!(_arg_1.pricingModel == "pricing_model_bundle")) && (!(_arg_1.pricingModel == "pricing_model_multi"))));
        }

        private function onCatalogPublished(_arg_1:IMessageEvent):void
        {
            var _local_2:Boolean = mainWindowVisible();
            reset();
            if (_local_2)
            {
                _windowManager.alert("${catalog.alert.published.title}", "${catalog.alert.published.description}", 0, alertDialogEventProcessor);
            };
        }

        private function onPurchaseError(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_205 = (_arg_1 as _SafeStr_205);
            var _local_2:_SafeStr_1206 = _local_3.getParser();
            var _local_4:int = _local_2.errorCode;
            var _local_5:String = ((_local_4 > 0) ? (("${catalog.alert.purchaseerror.description." + _local_4) + "}") : "${catalog.alert.purchaseerror.description}");
            _windowManager.alert("${catalog.alert.purchaseerror.title}", _local_5, 0, alertDialogEventProcessor);
            if (_SafeStr_3842 != null)
            {
                _SafeStr_3842.dispose();
                _SafeStr_3842 = null;
            };
        }

        private function onPurchaseNotAllowed(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_818 = (_arg_1 as _SafeStr_818);
            var _local_3:_SafeStr_1191 = _local_2.getParser();
            var _local_4:int = _local_3.errorCode;
            var _local_5:String = "";
            switch (_local_4)
            {
                case 1:
                    _local_5 = "${catalog.alert.purchasenotallowed.hc.description}";
                    break;
                default:
                    _local_5 = "${catalog.alert.purchasenotallowed.unknown.description}";
            };
            _windowManager.alert("${catalog.alert.purchasenotallowed.title}", _local_5, 0, alertDialogEventProcessor);
        }

        private function onPurchaseOK(_arg_1:IMessageEvent):void
        {
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_3:_SafeStr_914 = (_arg_1 as _SafeStr_914);
            var _local_4:_SafeStr_1288 = _local_3.getParser();
            events.dispatchEvent(new CatalogFurniPurchaseEvent(_local_4.offer.localizationId));
            if (_SafeStr_3842 != null)
            {
                if (((!(_SafeStr_3869)) && (!(_SafeStr_3842.isGiftPurchase()))))
                {
                    _local_6 = _SafeStr_3842.getIconWrapper();
                    if (_local_6)
                    {
                        _local_2 = _local_6.bitmap;
                        if (_local_2)
                        {
                            _local_7 = new Point();
                            _local_6.getGlobalPosition(_local_7);
                            _local_5 = "HTIE_ICON_INVENTORY";
                            if (_SafeStr_3842.productType == "e")
                            {
                                _local_5 = "HTIE_ICON_MEMENU";
                            };
                            _toolbar.createTransitionToIcon(_local_5, _local_2.clone(), _local_7.x, _local_7.y);
                        };
                    };
                };
                _SafeStr_3842.dispose();
            };
            _SafeStr_3842 = null;
        }

        private function onGiftReceiverNotFound(_arg_1:_SafeStr_696):void
        {
            if (_SafeStr_3842 != null)
            {
                _SafeStr_3842.receiverNotFound();
            };
        }

        private function onNotEnoughBalance(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_639 = (_arg_1 as _SafeStr_639);
            var _local_2:_SafeStr_1055 = _local_3.getParser();
            if (_local_2.notEnoughCredits)
            {
                showNotEnoughCreditsAlert();
            }
            else
            {
                if (_local_2.notEnoughActivityPoints)
                {
                    showNotEnoughActivityPointsAlert(_local_2.activityPointType);
                };
            };
            if (_SafeStr_3842 != null)
            {
                _SafeStr_3842.notEnoughCredits();
            };
        }

        public function setLeftPaneVisibility(_arg_1:Boolean):void
        {
            if (!_SafeStr_3855)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _SafeStr_3855.findChildByName("navigationContainer");
            if (_local_2)
            {
                _local_2.visible = _arg_1;
            };
            _local_2 = _SafeStr_3855.findChildByName("searchContainer");
            if (_local_2)
            {
                _local_2.visible = _arg_1;
            };
        }

        public function showNotEnoughCreditsAlert():void
        {
            if (!_windowManager)
            {
                return;
            };
            _windowManager.confirm("${catalog.alert.notenough.title}", "${catalog.alert.notenough.credits.description}", 0, noCreditsConfirmDialogEventProcessor);
        }

        public function showNotEnoughActivityPointsAlert(_arg_1:int):void
        {
            var _local_2:String = ("catalog.alert.notenough.activitypoints.title." + _arg_1);
            var _local_3:String = ("catalog.alert.notenough.activitypoints.description." + _arg_1);
            if (_arg_1 == 0)
            {
                _windowManager.confirm(localization.getLocalization(_local_2), localization.getLocalization(_local_3), 0, noDucketsConfirmDialogEventProcessor);
            }
            else
            {
                _windowManager.alert(localization.getLocalization(_local_2), localization.getLocalization(_local_3), 0, alertDialogEventProcessor);
            };
        }

        private function onVoucherRedeemOk(_arg_1:_SafeStr_236):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:String = "${catalog.alert.voucherredeem.ok.description}";
            if (_arg_1.productName != "")
            {
                _local_2 = "catalog.alert.voucherredeem.ok.description.furni";
                _localization.registerParameter(_local_2, "productName", _arg_1.productName);
                _localization.registerParameter(_local_2, "productDescription", _arg_1.productDescription);
                _local_2 = (("${" + _local_2) + "}");
            };
            _windowManager.alert("${catalog.alert.voucherredeem.ok.title}", _local_2, 0, alertDialogEventProcessor);
        }

        private function onVoucherRedeemError(_arg_1:_SafeStr_652):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:String = "${catalog.alert.voucherredeem.error.title}";
            var _local_3:String = (("${catalog.alert.voucherredeem.error.description." + _arg_1.errorCode) + "}");
            _windowManager.alert(_local_2, _local_3, 0, alertDialogEventProcessor);
        }

        private function onApproveNameResult(_arg_1:_SafeStr_529):void
        {
            if (((_arg_1 == null) || (_SafeStr_3854 == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1243 = _arg_1.getParser();
            _SafeStr_3854.dispatchWidgetEvent(new CatalogWidgetApproveNameResultEvent(_local_2.result, _local_2.nameValidationInfo));
        }

        private function onCreditBalance(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_437 = (_arg_1 as _SafeStr_437);
            var _local_2:_SafeStr_1117 = _local_3.getParser();
            _SafeStr_3857.credits = _local_2.balance;
            updatePurse();
            if (((!(_SafeStr_3870)) && (!(_soundManager == null))))
            {
                _soundManager.playSound("HBST_purchase");
            };
            _SafeStr_3870 = false;
            events.dispatchEvent(new PurseEvent("catalog_purse_credit_balance", _SafeStr_3857.credits, 0));
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function onActivityPointNotification(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_446 = (_arg_1 as _SafeStr_446);
            _SafeStr_3857.activityPoints[_local_2.type] = _local_2.amount;
            updatePurse();
            if (((!(_soundManager == null)) && (_local_2.type == 0)))
            {
                _soundManager.playSound("HBST_pixels");
            };
            events.dispatchEvent(new PurseEvent("catalog_purse_activity_point_balance", _local_2.amount, _local_2.type));
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function onActivityPoints(_arg_1:IMessageEvent):void
        {
            var _local_4:int;
            var _local_3:_SafeStr_281 = (_arg_1 as _SafeStr_281);
            _SafeStr_3857.activityPoints = _local_3.points;
            updatePurse();
            for (var _local_2:String in _local_3.points)
            {
                _local_4 = _local_2;
                events.dispatchEvent(new PurseEvent("catalog_purse_activity_point_balance", _local_3.points[_local_4], _local_4));
            };
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function onSubscriptionInfo(_arg_1:IMessageEvent):void
        {
            var _local_3:Boolean;
            var _local_2:_SafeStr_1274 = (_arg_1 as _SafeStr_990).getParser();
            _SafeStr_3857.clubDays = Math.max(0, _local_2.daysToPeriodEnd);
            _SafeStr_3857.clubPeriods = Math.max(0, _local_2.periodsSubscribedAhead);
            _SafeStr_3857.isVIP = _local_2.isVIP;
            _SafeStr_3857.pastClubDays = _local_2.pastClubDays;
            _SafeStr_3857.pastVipDays = _local_2.pastVipDays;
            _SafeStr_3857.isExpiring = ((_local_2.responseType == 3) ? true : false);
            _SafeStr_3857.minutesUntilExpiration = _local_2.minutesUntilExpiration;
            _SafeStr_3857.minutesSinceLastModified = _local_2.minutesSinceLastModified;
            if (ExternalInterface.available)
            {
                if (((_local_2.productName == "habbo_club") || (_local_2.productName == "club_habbo")))
                {
                    _local_3 = ((_local_2.isVIP) && (_local_2.minutesUntilExpiration > 0));
                    ExternalInterface.call("FlashExternalInterface.subscriptionUpdated", _local_3);
                };
            };
            updatePurse();
            if (_local_2.responseType == 2)
            {
                reset();
                if (_SafeStr_3871 != null)
                {
                    openCatalogPage(_SafeStr_3871);
                    _SafeStr_3871 = null;
                };
            };
        }

        private function onClubGiftInfo(_arg_1:_SafeStr_842):void
        {
            if (((!(_arg_1)) || (!(_SafeStr_3863))))
            {
                return;
            };
            var _local_2:_SafeStr_1484 = _arg_1.getParser();
            if (!_local_2)
            {
                return;
            };
            _SafeStr_3863.setInfo(_local_2.daysUntilNextGift, _local_2.giftsAvailable, _local_2.offers, _local_2.giftData);
        }

        private function onMarketPlaceOffers(_arg_1:IMessageEvent):void
        {
            if (_SafeStr_3862 != null)
            {
                _SafeStr_3862.onOffers(_arg_1);
            };
        }

        private function onMarketPlaceOwnOffers(_arg_1:IMessageEvent):void
        {
            if (_SafeStr_3862 != null)
            {
                _SafeStr_3862.onOwnOffers(_arg_1);
            };
        }

        private function onMarketPlaceBuyResult(_arg_1:IMessageEvent):void
        {
            if (_SafeStr_3862 != null)
            {
                _SafeStr_3862.onBuyResult(_arg_1);
            };
        }

        private function onMarketPlaceCancelResult(_arg_1:IMessageEvent):void
        {
            if (_SafeStr_3862 != null)
            {
                _SafeStr_3862.onCancelResult(_arg_1);
            };
        }

        private function onGiftWrappingConfiguration(_arg_1:_SafeStr_289):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _giftWrappingConfiguration = new GiftWrappingConfiguration(_arg_1);
        }

        private function onMarketplaceItemStats(_arg_1:_SafeStr_412):void
        {
            if (((!(_arg_1)) || (!(_SafeStr_3862))))
            {
                return;
            };
            var _local_2:_SafeStr_1051 = _arg_1.getParser();
            if (!_local_2)
            {
                return;
            };
            var _local_3:_SafeStr_3209 = new _SafeStr_3209();
            _local_3.averagePrice = _local_2.averagePrice;
            _local_3.offerCount = _local_2.offerCount;
            _local_3.historyLength = _local_2.historyLength;
            _local_3.dayOffsets = _local_2.dayOffsets;
            _local_3.averagePrices = _local_2.averagePrices;
            _local_3.soldAmounts = _local_2.soldAmounts;
            _local_3.furniCategoryId = _local_2.furniCategoryId;
            _local_3.furniTypeId = _local_2.furniTypeId;
            _SafeStr_3862.itemStats = _local_3;
        }

        private function onMarketplaceConfiguration(_arg_1:_SafeStr_243):void
        {
            if (((!(_arg_1)) || (!(_SafeStr_3862))))
            {
                return;
            };
            var _local_2:_SafeStr_1353 = _arg_1.getParser();
            if (!_local_2)
            {
                return;
            };
            _SafeStr_3862.averagePricePeriod = _local_2.averagePricePeriod;
        }

        private function onMarketplaceMakeOfferResult(_arg_1:_SafeStr_845):void
        {
            if (((!(_arg_1)) || (!(_SafeStr_3862))))
            {
                return;
            };
            var _local_2:_SafeStr_1421 = _arg_1.getParser();
            if (!_local_2)
            {
                return;
            };
            if (_local_2.result == 1)
            {
                _SafeStr_3862.refreshOffers();
            };
        }

        private function onHabboClubOffers(_arg_1:_SafeStr_582):void
        {
            var _local_2:_SafeStr_1381 = _arg_1.getParser();
            if (((!(_SafeStr_3843 == null)) && ((((_local_2.source == 0) || (_local_2.source == 1)) || (_local_2.source == 2)) || (_local_2.source == 6))))
            {
                _SafeStr_3843.onOffers(_local_2);
            };
        }

        private function onHabboClubExtendOffer(_arg_1:_SafeStr_739):void
        {
            if (!_SafeStr_3853)
            {
                init();
            };
            if (_SafeStr_3844)
            {
                _SafeStr_3844.onOffer(_arg_1);
            };
        }

        private function onRoomExit(_arg_1:IMessageEvent):void
        {
        }

        private function onSellablePalettes(_arg_1:_SafeStr_248):void
        {
            var _local_2:_SafeStr_1273 = _arg_1.getParser();
            _SafeStr_3845.remove(_local_2.productCode);
            var _local_3:Array = _local_2.sellablePalettes;
            if (_local_3 != null)
            {
                _SafeStr_3845.add(_local_2.productCode, _local_3.slice());
                _SafeStr_3854.dispatchWidgetEvent(new CatalogWidgetSellablePetPalettesEvent(_local_2.productCode, _local_3.slice()));
            };
        }

        private function setElementImage(_arg_1:String, _arg_2:BitmapData):void
        {
            var _local_3:_SafeStr_3264 = (_SafeStr_3855.findChildByName(_arg_1) as _SafeStr_3264);
            if (_local_3 != null)
            {
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
                _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(0, 0));
            }
            else
            {
                _SafeStr_14.log(("Could not find element: " + _arg_1));
            };
        }

        private function alertDialogEventProcessor(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            resetPlacedOfferData();
        }

        private function noCreditsConfirmDialogEventProcessor(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            resetPlacedOfferData();
            if (_arg_2.type == "WE_OK")
            {
                HabboWebTools.openWebPageAndMinimizeClient(getProperty("web.shop.relativeUrl"));
            };
        }

        private function noDucketsConfirmDialogEventProcessor(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            var _local_3:* = null;
            _arg_1.dispose();
            resetPlacedOfferData();
            if (_arg_2.type == "WE_OK")
            {
                _local_3 = getProperty("link.format.duckets");
                if (_local_3 != "")
                {
                    _windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, onExternalLink);
                    HabboWebTools.navigateToURL(_local_3, "habboMain");
                };
            };
        }

        private function onExternalLink(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        public function redeemVoucher(_arg_1:String):void
        {
            var _local_2:IMessageComposer = new _SafeStr_409(_arg_1);
            send(_local_2);
            _local_2.dispose();
            _local_2 = null;
        }

        public function productDataReady():void
        {
            _SafeStr_3833 = true;
            events.dispatchEvent(new CatalogEvent("CATALOG_INITIALIZED"));
        }

        public function isDraggable(_arg_1:_SafeStr_3141):Boolean
        {
            return (((((((((getBoolean("catalog.drag_and_drop")) && (!(_roomSession == null))) && ((_SafeStr_3854.currentPage == null) || (_SafeStr_3854.currentPage.allowDragging))) && (((_SafeStr_3864 == "NORMAL") && ((_roomSession.isRoomOwner) || ((_roomSession.isGuildRoom) && (_roomSession.roomControllerLevel >= 2)))) || ((_SafeStr_3864 == "BUILDERS_CLUB") && (getBuilderFurniPlaceableStatus(_arg_1) == 0)))) && (!(_arg_1.pricingModel == "pricing_model_bundle"))) && (!(_arg_1.pricingModel == "pricing_model_multi"))) && (!(_arg_1.product == null))) && (!(_arg_1.product.productType == "e"))) && (!(_arg_1.product.productType == "h")));
        }

        public function getBuilderFurniPlaceableStatus(_arg_1:_SafeStr_3141):int
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:* = null;
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return (1);
            };
            if (((builderFurniCount < 0) || (builderFurniCount >= builderFurniLimit)))
            {
                return (2);
            };
            if (roomSession == null)
            {
                return (3);
            };
            if (!roomSession.isRoomOwner)
            {
                return (4);
            };
            if (((roomSession.isGuildRoom) && (!(getBoolean("builders.club.furniture.placement.group.room.enabled")))))
            {
                return (5);
            };
            if (builderSecondsLeft <= 0)
            {
                _local_3 = roomEngine.getRoomObjectCount(roomSession.roomId, 100);
                _local_4 = 0;
                while (_local_4 < _local_3)
                {
                    _local_5 = roomEngine.getRoomObjectWithIndex(roomSession.roomId, _local_4, 100);
                    _local_2 = roomSession.userDataManager.getUserDataByIndex(_local_5.getId());
                    if (((((!(_local_2 == null)) && (_local_2.type == 1)) && (!(_local_2.roomObjectId == roomSession.ownUserRoomId))) && (!(_local_2.isModerator))))
                    {
                        return (6);
                    };
                    _local_4++;
                };
            };
            return (0);
        }

        private function updateRoom(_arg_1:String, _arg_2:String):void
        {
            var _local_4:String = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_wall_type");
            var _local_5:String = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_floor_type");
            var _local_3:String = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_landscape_type");
            _local_4 = (((_local_4) && (_local_4.length > 0)) ? _local_4 : "101");
            _local_5 = (((_local_5) && (_local_5.length > 0)) ? _local_5 : "101");
            _local_3 = (((_local_3) && (_local_3.length > 0)) ? _local_3 : "1.1");
            switch (_arg_1)
            {
                case "floor":
                    _roomEngine.updateObjectRoom(_roomEngine.activeRoomId, _arg_2, _local_4, _local_3, true);
                    return;
                case "wallpaper":
                    _roomEngine.updateObjectRoom(_roomEngine.activeRoomId, _local_5, _arg_2, _local_3, true);
                    return;
                case "landscape":
                    _roomEngine.updateObjectRoom(_roomEngine.activeRoomId, _local_5, _local_4, _arg_2, true);
                    return;
                default:
                    _roomEngine.updateObjectRoom(_roomEngine.activeRoomId, _local_5, _local_4, _local_3, true);
                    return;
            };
        }

        public function requestSelectedItemToMover(_arg_1:_SafeStr_3214, _arg_2:_SafeStr_3141, _arg_3:Boolean=false):void
        {
            var _local_6:int;
            if (!isDraggable(_arg_2))
            {
                return;
            };
            var _local_4:_SafeStr_3151 = _arg_2.product;
            switch (_local_4.productType)
            {
                case "s":
                    _local_6 = 10;
                    break;
                case "i":
                    _local_6 = 20;
            };
            var _local_5:Boolean = _roomEngine.initializeRoomObjectInsert("catalog", -(_arg_2.offerId), _local_6, _local_4.productClassId, ((_local_4.extraParam) ? _local_4.extraParam.toString() : null));
            if (_local_5)
            {
                _offerInFurniPlacing = _arg_2;
                _offerPlacingCallbackReceiver = _arg_1;
                hideMainWindow();
                _SafeStr_3869 = true;
                _SafeStr_3872 = _arg_3;
            };
        }

        private function onObjectSelected(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            if (((buildersClubEnabled) && ((!(_SafeStr_3853)) || (!(getCatalogNavigator("BUILDERS_CLUB").initialized)))))
            {
                init();
                refreshCatalogIndex("BUILDERS_CLUB");
            };
            if (((_arg_1.type == "REOE_SELECTED") && (_arg_1.category == 100)))
            {
                _local_2 = getUserDataForEvent(_arg_1);
                if (_local_2 != null)
                {
                    events.dispatchEvent(new CatalogUserEvent("CATALOG_USER_SELECTED", _local_2.webID, _local_2.name));
                };
            };
        }

        private function onFriendBarSelectionEvent(_arg_1:FriendBarSelectionEvent):void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_4:* = null;
            if (((_SafeStr_3869) && (_arg_1.type == "FBVE_FRIEND_SELECTED")))
            {
                resetPlacedOfferData(true);
                if (((_offerInFurniPlacing == null) || (_offerInFurniPlacing.disposed)))
                {
                    resetObjectMover();
                    return;
                };
                _local_3 = _arg_1.friendId;
                _local_2 = _arg_1.friendName;
                _local_4 = _offerPlacingCallbackReceiver;
                if (_local_4 != null)
                {
                    _local_4.onDragAndDropDone(true, _local_2);
                };
                resetObjectMover(false);
                cancelFurniInMover();
            };
        }

        private function getUserDataForEvent(_arg_1:RoomEngineObjectEvent):_SafeStr_3241
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_3241;
            if (_roomSessionManager != null)
            {
                _local_3 = _roomSessionManager.getSession(_arg_1.roomId);
                if (_local_3 != null)
                {
                    _local_2 = _local_3.userDataManager.getUserDataByIndex(_arg_1.objectId);
                };
            };
            return (_local_2);
        }

        private function onObjectPlaceOnUser(_arg_1:RoomEngineObjectPlacedOnUserEvent):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:* = null;
            if (((_SafeStr_3869) && (_arg_1.type == "REOE_PLACED_ON_USER")))
            {
                resetPlacedOfferData(true);
                if (((_offerInFurniPlacing == null) || (_offerInFurniPlacing.disposed)))
                {
                    resetObjectMover();
                    return;
                };
                _local_4 = null;
                _local_2 = getUserDataForEvent(_arg_1);
                if (_local_2 != null)
                {
                    _local_4 = _local_2.name;
                };
                _local_3 = _offerPlacingCallbackReceiver;
                if (_local_3 != null)
                {
                    _local_3.onDragAndDropDone(true, _local_4);
                };
                resetObjectMover(false);
                cancelFurniInMover();
            };
        }

        private function onObjectPlacedInRoom(_arg_1:RoomEngineObjectPlacedEvent):void
        {
            var _local_7:int;
            var _local_2:* = null;
            var _local_5:Boolean;
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_8:int;
            var _local_3:*;
            if (((_SafeStr_3869) && (_arg_1.type == "REOE_PLACED")))
            {
                resetPlacedOfferData(true);
                if (((_offerInFurniPlacing == null) || (_offerInFurniPlacing.disposed)))
                {
                    resetObjectMover();
                    return;
                };
                _local_7 = _arg_1.category;
                _local_2 = _offerInFurniPlacing.product;
                _local_5 = false;
                if (_local_7 == 20)
                {
                    switch (_local_2.furnitureData.className)
                    {
                        case "floor":
                        case "wallpaper":
                        case "landscape":
                            _local_5 = ((_arg_1.placedOnFloor) || (_arg_1.placedOnWall));
                            break;
                        default:
                            _local_5 = _arg_1.placedInRoom;
                    };
                }
                else
                {
                    _local_5 = _arg_1.placedInRoom;
                };
                if (!_local_5)
                {
                    resetObjectMover();
                    return;
                };
                _SafeStr_3873 = new PlacedObjectPurchaseData(_arg_1.roomId, _arg_1.objectId, _arg_1.category, _arg_1.wallLocation, _arg_1.x, _arg_1.y, _arg_1.direction, _offerInFurniPlacing);
                _local_6 = _offerPlacingCallbackReceiver;
                if (_local_6 != null)
                {
                    _local_6.onDragAndDropDone(true, null);
                };
                switch (_SafeStr_3864)
                {
                    case "NORMAL":
                        if (_local_7 == 10)
                        {
                            _roomEngine.addObjectFurniture(_arg_1.roomId, _arg_1.objectId, _local_2.productClassId, new Vector3d(_arg_1.x, _arg_1.y, _arg_1.z), new Vector3d(_arg_1.direction, 0, 0), 0, new _SafeStr_1613());
                        }
                        else
                        {
                            if (_local_7 == 20)
                            {
                                switch (_local_2.furnitureData.className)
                                {
                                    case "floor":
                                    case "wallpaper":
                                    case "landscape":
                                        updateRoom(_local_2.furnitureData.className, _local_2.extraParam);
                                        break;
                                    default:
                                        _roomEngine.addObjectWallItem(_arg_1.roomId, _arg_1.objectId, _local_2.productClassId, new Vector3d(_arg_1.x, _arg_1.y, _arg_1.z), new Vector3d((_arg_1.direction * 45), 0, 0), 0, _arg_1.instanceData, 0);
                                };
                            };
                        };
                        _local_4 = (_roomEngine.getRoomObject(_arg_1.roomId, _arg_1.objectId, _arg_1.category) as IRoomObjectController);
                        if (_local_4)
                        {
                            _local_4.getModelController().setNumber("furniture_alpha_multiplier", 0.5);
                        };
                        return;
                    case "BUILDERS_CLUB":
                        _local_8 = _offerInFurniPlacing.page.pageId;
                        if (_local_8 == -12345678)
                        {
                            _local_3 = currentCatalogNavigator.getNodesByOfferId(_offerInFurniPlacing.offerId, true);
                            if (_local_3 != null)
                            {
                                _local_8 = _local_3[0].pageId;
                            };
                        };
                        switch (_local_7)
                        {
                            case 10:
                                send(new _SafeStr_264(_local_8, _offerInFurniPlacing.offerId, _local_2.extraParam, _arg_1.x, _arg_1.y, _arg_1.direction));
                                break;
                            case 20:
                                send(new _SafeStr_803(_local_8, _offerInFurniPlacing.offerId, _local_2.extraParam, _arg_1.wallLocation));
                            default:
                        };
                        if (_SafeStr_3872)
                        {
                            requestSelectedItemToMover(_local_6, _offerInFurniPlacing, true);
                        }
                        else
                        {
                            toggleBuilderCatalog();
                        };
                        return;
                };
            };
        }

        private function resetObjectMover(_arg_1:Boolean=true):void
        {
            if (((_arg_1) && (_SafeStr_3869)))
            {
                showMainWindow();
            };
            _SafeStr_3869 = false;
            _offerPlacingCallbackReceiver = null;
        }

        public function syncPlacedOfferWithPurchase(_arg_1:_SafeStr_3141):void
        {
            if (_SafeStr_3873)
            {
                if (_SafeStr_3873.offerId != _arg_1.offerId)
                {
                    resetPlacedOfferData();
                };
            };
        }

        public function resetPlacedOfferData(_arg_1:Boolean=false):void
        {
            if (!_arg_1)
            {
                resetObjectMover();
            };
            if (_SafeStr_3873 != null)
            {
                if (_SafeStr_3873.category == 10)
                {
                    _roomEngine.disposeObjectFurniture(_SafeStr_3873.roomId, _SafeStr_3873.objectId);
                }
                else
                {
                    if (_SafeStr_3873.category == 20)
                    {
                        switch (_SafeStr_3873.furniData.className)
                        {
                            case "floor":
                            case "wallpaper":
                            case "landscape":
                                updateRoom("reset", "");
                                break;
                            default:
                                _roomEngine.disposeObjectWallItem(_SafeStr_3873.roomId, _SafeStr_3873.objectId);
                        };
                    }
                    else
                    {
                        _roomEngine.deleteRoomObject(_SafeStr_3873.objectId, _SafeStr_3873.category);
                    };
                };
                _SafeStr_3873.dispose();
                _SafeStr_3873 = null;
            };
        }

        public function cancelFurniInMover():void
        {
            if (_offerInFurniPlacing != null)
            {
                _roomEngine.cancelRoomObjectInsert();
                _SafeStr_3869 = false;
                _offerInFurniPlacing = null;
            };
        }

        private function onItemAddedToInventory(_arg_1:HabboInventoryItemAddedEvent):void
        {
            var _local_6:int;
            var _local_8:int;
            var _local_4:* = null;
            var _local_3:int;
            var _local_5:int;
            var _local_9:int;
            var _local_10:* = null;
            var _local_7:* = null;
            var _local_2:* = null;
            if (((!(_SafeStr_3873 == null)) && (_SafeStr_3873.productClassId == _arg_1.classId)))
            {
                if (_SafeStr_3873.roomId == _roomEngine.activeRoomId)
                {
                    _local_6 = _arg_1.stripId;
                    _local_8 = _SafeStr_3873.category;
                    _local_4 = _SafeStr_3873.wallLocation;
                    _local_3 = _SafeStr_3873.x;
                    _local_5 = _SafeStr_3873.y;
                    _local_9 = _SafeStr_3873.direction;
                    switch (_arg_1.category)
                    {
                        case 3:
                            _local_10 = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_floor_type");
                            if (_SafeStr_3873.extraParameter != _local_10)
                            {
                                send(new _SafeStr_922(_local_6));
                            };
                            break;
                        case 2:
                            _local_7 = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_wall_type");
                            if (_SafeStr_3873.extraParameter != _local_7)
                            {
                                send(new _SafeStr_922(_local_6));
                            };
                            break;
                        case 4:
                            _local_2 = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_landscape_type");
                            if (_SafeStr_3873.extraParameter != _local_2)
                            {
                                send(new _SafeStr_922(_local_6));
                            };
                            break;
                        default:
                            send(new _SafeStr_626(_local_6, _local_8, _local_4, _local_3, _local_5, _local_9));
                    };
                    resetPlacedOfferData();
                };
            };
        }

        public function setImageFromAsset(_arg_1:_SafeStr_3109, _arg_2:String, _arg_3:Function):void
        {
            if (((!(_arg_2)) || (!(assets))))
            {
                return;
            };
            var _local_4:BitmapDataAsset = (assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_4 == null)
            {
                retrievePreviewAsset(_arg_2, _arg_3);
                return;
            };
            if (_arg_1)
            {
                HabboCatalog.setElementImageCentered(_arg_1, (_local_4.content as BitmapData));
            };
        }

        public function get imageGalleryHost():String
        {
            return (getProperty("image.library.catalogue.url"));
        }

        private function retrievePreviewAsset(_arg_1:String, _arg_2:Function):void
        {
            if (((!(_arg_1)) || (!(assets))))
            {
                return;
            };
            var _local_5:String = ((imageGalleryHost + _arg_1) + ".png");
            var _local_3:URLRequest = new URLRequest(_local_5);
            var _local_4:AssetLoaderStruct = assets.loadAssetFromFile(_arg_1, _local_3, "image/png");
            if (!_local_4)
            {
                return;
            };
            if (_arg_2 != null)
            {
                _local_4.addEventListener("AssetLoaderEventComplete", _arg_2);
            };
        }

        private function showMainWindow():void
        {
            var _local_1:* = null;
            if ((((!(_windowManager == null)) && (!(_SafeStr_3855 == null))) && (_SafeStr_3855.parent == null)))
            {
                _local_1 = _windowManager.getDesktop(1);
                if (_local_1 != null)
                {
                    _local_1.addChild(_SafeStr_3855);
                };
            };
        }

        private function hideMainWindow():void
        {
            var _local_1:* = null;
            if ((((!(_windowManager == null)) && (!(_SafeStr_3855 == null))) && (!(_SafeStr_3855.parent == null))))
            {
                _local_1 = _windowManager.getDesktop(1);
                if (((!(_local_1 == null)) && (!(_SafeStr_3874))))
                {
                    _local_1.removeChild(_SafeStr_3855);
                    if (_SafeStr_3854 != null)
                    {
                        _SafeStr_3854.catalogWindowClosed();
                    };
                };
                _SafeStr_3874 = false;
            };
        }

        private function mainWindowVisible():Boolean
        {
            return (((!(_windowManager == null)) && (!(_SafeStr_3855 == null))) && (!(_SafeStr_3855.parent == null)));
        }

        public function update(_arg_1:uint):void
        {
            var _local_3:Number;
            var _local_2:Number;
            if (_SafeStr_3840 != null)
            {
                _SafeStr_3840.updatePreviewRoomView();
            };
            if ((getTimer() - _builderMembershipDisplayUpdateTime) > 500)
            {
                _local_3 = builderSecondsLeft;
                _local_2 = builderSecondsLeftWithGrace;
                if ((((_local_3 > -3) && (_local_3 < 200)) || ((_local_2 > -3) && (_local_2 < 200))))
                {
                    refreshBuilderStatus();
                };
            };
        }

        public function onGuildMemberships(_arg_1:_SafeStr_562):void
        {
            if (_SafeStr_3847)
            {
                _SafeStr_3847.onGuildMembershipsMessageEvent(_arg_1);
            };
        }

        private function onSnowWarGameTokenOffer(_arg_1:SnowWarGameTokensMessageEvent):void
        {
            var _local_3:SnowWarGameTokensMessageParser = _arg_1.getParser();
            disposeSnowWarTokens();
            for each (var _local_2:SnowWarGameTokenOffer in _local_3.offers)
            {
                if (_local_2.localizationId == "GET_SNOWWAR_TOKENS")
                {
                    _SafeStr_3850 = new GameTokensOffer(_local_2.offerId, _local_2.localizationId, _local_2.priceInCredits, _local_2.priceInActivityPoints, _local_2.activityPointType);
                }
                else
                {
                    if (_local_2.localizationId == "GET_SNOWWAR_TOKENS2")
                    {
                        _SafeStr_3851 = new GameTokensOffer(_local_2.offerId, _local_2.localizationId, _local_2.priceInCredits, _local_2.priceInActivityPoints, _local_2.activityPointType);
                    }
                    else
                    {
                        if (_local_2.localizationId == "GET_SNOWWAR_TOKENS3")
                        {
                            _SafeStr_3852 = new GameTokensOffer(_local_2.offerId, _local_2.localizationId, _local_2.priceInCredits, _local_2.priceInActivityPoints, _local_2.activityPointType);
                        };
                    };
                };
            };
        }

        public function buySnowWarTokensOffer(_arg_1:String):void
        {
            if (((_arg_1 == "GET_SNOWWAR_TOKENS") && (_SafeStr_3850)))
            {
                showPurchaseConfirmation(_SafeStr_3850, -1, _SafeStr_3850.localizationId);
            }
            else
            {
                if (((_arg_1 == "GET_SNOWWAR_TOKENS2") && (_SafeStr_3851)))
                {
                    showPurchaseConfirmation(_SafeStr_3851, -1, _SafeStr_3851.localizationId);
                }
                else
                {
                    if (((_arg_1 == "GET_SNOWWAR_TOKENS3") && (_SafeStr_3852)))
                    {
                        showPurchaseConfirmation(_SafeStr_3852, -1, _SafeStr_3852.localizationId);
                    }
                    else
                    {
                        _communication.connection.send(new GetSnowWarGameTokensOfferComposer());
                    };
                };
            };
        }

        public function verifyClubLevel(_arg_1:int=1):Boolean
        {
            if (_sessionDataManager.clubLevel >= _arg_1)
            {
                return (true);
            };
            openClubCenter();
            return (false);
        }

        public function openClubCenter():void
        {
            context.createLinkEvent("habboUI/open/hccenter");
        }

        public function openVault():void
        {
            context.createLinkEvent("habboUI/open/vault");
        }

        private function onGuildVisualSettingsChanged(_arg_1:GuildSettingsChangedInManageEvent):void
        {
            if (_SafeStr_3847)
            {
                _SafeStr_3847.onGuildVisualSettingsChanged(_arg_1.guildId);
            };
        }

        public function get avatarEditor():_SafeStr_1758
        {
            return (_avatarEditor);
        }

        public function checkGiftable(_arg_1:_SafeStr_3141):void
        {
            send(new _SafeStr_486(_arg_1.offerId));
        }

        public function rememberPageDuringVipPurchase(_arg_1:int):void
        {
            var _local_2:_SafeStr_3170 = currentCatalogNavigator.getNodeById(_arg_1);
            if (_local_2)
            {
                _SafeStr_3871 = _local_2.pageName;
            }
            else
            {
                _SafeStr_3871 = "frontpage";
            };
        }

        public function forgetPageDuringVipPurchase():void
        {
            _SafeStr_3871 = null;
            _SafeStr_3874 = false;
        }

        public function doNotCloseAfterVipPurchase():void
        {
            _SafeStr_3874 = (!(_SafeStr_3871 == null));
        }

        private function initBundleDiscounts():void
        {
            sendGetBundleDiscountRuleset();
        }

        private function sendGetBundleDiscountRuleset():void
        {
            send(new _SafeStr_493());
        }

        public function sendGetProductOffer(_arg_1:int):void
        {
            send(new _SafeStr_829(_arg_1));
        }

        private function onBundleDiscountRulesetMessageEvent(_arg_1:_SafeStr_749):void
        {
            var _local_2:_SafeStr_1144 = _arg_1.getParser();
            _bundleDiscountRuleset = _local_2.bundleDiscountRuleset;
            _utils.resolveBundleDiscountFlatPriceSteps();
        }

        private function onLimitedEditionSoldOut(_arg_1:_SafeStr_277):void
        {
            _windowManager.alert("${catalog.alert.limited_edition_sold_out.title}", "${catalog.alert.limited_edition_sold_out.message}", 0, alertDialogEventProcessor);
            if (_SafeStr_3842 != null)
            {
                _SafeStr_3842.dispose();
                _SafeStr_3842 = null;
            };
        }

        private function onProductOffer(_arg_1:_SafeStr_765):void
        {
            var _local_6:* = null;
            var _local_3:_SafeStr_1052 = _arg_1.getParser();
            var _local_4:_SafeStr_1406 = _local_3.offerData;
            if (((!(_local_4)) || (_local_4.products.length == 0)))
            {
                return;
            };
            var _local_5:_SafeStr_1611 = _local_4.products[0];
            if (_local_5.uniqueLimitedItem)
            {
                _SafeStr_3854.currentPage.updateLimitedItemsLeft(_local_4.offerId, _local_5.uniqueLimitedItemsLeft);
            };
            var _local_7:Vector.<_SafeStr_3151> = new Vector.<_SafeStr_3151>(0);
            var _local_8:_SafeStr_3182 = getProductData(_local_4.localizationId);
            for each (_local_5 in _local_4.products)
            {
                _local_6 = getFurnitureData(_local_5.furniClassId, _local_5.productType);
                _local_7.push(new Product(_local_5.productType, _local_5.furniClassId, _local_5.extraParam, _local_5.productCount, _local_8, _local_6, this, _local_5.uniqueLimitedItem, _local_5.uniqueLimitedItemSeriesSize, _local_5.uniqueLimitedItemsLeft));
            };
            var _local_2:Offer = new Offer(_local_4.offerId, _local_4.localizationId, _local_4.isRent, _local_4.priceInCredits, _local_4.priceInActivityPoints, _local_4.activityPointType, _local_4.giftable, _local_4.clubLevel, _local_7, _local_4.bundlePurchaseAllowed, this);
            if (!isOfferCompatibleWithCurrentMode(_local_2))
            {
                _local_2.dispose();
                return;
            };
            if (((_SafeStr_3854) && (_SafeStr_3854.currentPage)))
            {
                _local_2.page = _SafeStr_3854.currentPage;
                _SafeStr_3854.currentPage.dispatchWidgetEvent(new SelectProductEvent(_local_2));
                if (((_local_2.product) && (_local_2.product.productType == "i")))
                {
                    _SafeStr_3854.currentPage.dispatchWidgetEvent(new SetExtraPurchaseParameterEvent(_local_2.product.extraParam));
                };
                if (((_SafeStr_3869) && (_offerInFurniPlacing)))
                {
                    _offerInFurniPlacing = _local_2;
                };
            };
        }

        private function onBuildersClubSubscriptionStatus(_arg_1:_SafeStr_166):void
        {
            var _local_2:_SafeStr_1463 = _arg_1.getParser();
            _SafeStr_3880 = _local_2.furniLimit;
            _SafeStr_3881 = _local_2.maxFurniLimit;
            _SafeStr_3875 = _local_2.secondsLeft;
            _builderMembershipUpdateTime = getTimer();
            _SafeStr_3876 = _local_2.secondsLeftWithGrace;
            if (ExternalInterface.available)
            {
                ExternalInterface.call("FlashExternalInterface.updateBuildersClub", (_SafeStr_3875 > 0));
            };
            if (currentPage != null)
            {
                currentPage.dispatchWidgetEvent(new CatalogWidgetBuilderSubscriptionUpdatedEvent());
            };
            refreshBuilderStatus();
        }

        private function onBuildersClubFurniCount(_arg_1:_SafeStr_148):void
        {
            _SafeStr_3879 = _arg_1.getParser().furniCount;
            if (currentPage != null)
            {
                currentPage.dispatchWidgetEvent(new CatalogWidgetBuilderSubscriptionUpdatedEvent());
            };
            refreshBuilderStatus();
        }

        private function refreshBuilderStatus():void
        {
            var _local_4:Number = (_SafeStr_3875 - ((getTimer() - _builderMembershipUpdateTime) / 1000));
            var _local_2:Number = (_SafeStr_3876 - ((getTimer() - _builderMembershipUpdateTime) / 1000));
            if ((((_SafeStr_3877) && (_local_4 <= 0)) && (_local_2 > 0)))
            {
                events.dispatchEvent(new CatalogEvent("CATALOG_BUILDER_MEMBERSHIP_IN_GRACE"));
            }
            else
            {
                if (((_SafeStr_3878) && (_local_2 <= 0)))
                {
                    events.dispatchEvent(new CatalogEvent("CATALOG_BUILDER_MEMBERSHIP_EXPIRED"));
                };
            };
            _SafeStr_3877 = (_local_4 > 0);
            _SafeStr_3878 = (_local_2 > 0);
            var _local_3:String = ("builder.header.status." + ((_SafeStr_3877) ? "member" : ((_SafeStr_3878) ? "grace" : "trial")));
            var _local_5:String = _localization.getLocalization(_local_3);
            _localization.registerParameter("builder.header.title", "bcstatus", _local_5);
            var _local_1:String = ((_SafeStr_3877) ? FriendlyTime.getFriendlyTime(_localization, _local_4) : ((_SafeStr_3878) ? FriendlyTime.getFriendlyTime(_localization, _local_2) : _local_5));
            _localization.registerParameter("builder.header.status.membership", "duration", (('<font color="#ff8d00"><b>' + _local_1) + "</b></font>"));
            _localization.registerParameter("builder.header.status.limit", "count", (('<font color="#ff8d00"><b>' + _SafeStr_3879) + "</b></font>"));
            _localization.registerParameter("builder.header.status.limit", "limit", (('<font color="#ff8d00"><b>' + _SafeStr_3880) + "</b></font>"));
            _builderMembershipDisplayUpdateTime = getTimer();
        }

        public function get bundleDiscountEnabled():Boolean
        {
            return (!(_SafeStr_3864 == "BUILDERS_CLUB"));
        }

        public function get bundleDiscountRuleset():_SafeStr_1533
        {
            return (_bundleDiscountRuleset);
        }

        public function get multiplePurchaseEnabled():Boolean
        {
            return ((getBoolean("catalog.multiple.purchase.enabled")) && (!(_SafeStr_3864 == "BUILDERS_CLUB")));
        }

        public function get newAdditionsPageOpenDisabled():Boolean
        {
            return (getBoolean("catalog.new.additions.page.open.disabled"));
        }

        public function showVipBenefits():void
        {
            if (!_utils)
            {
                init();
            };
            if (_utils)
            {
                if (!getCatalogNavigator("NORMAL").initialized)
                {
                    refreshCatalogIndex("NORMAL");
                };
                _utils.showVipBenefits();
            };
        }

        public function get currentPage():_SafeStr_3211
        {
            return ((_SafeStr_3854 == null) ? null : _SafeStr_3854.currentPage);
        }

        public function displayProductIcon(_arg_1:String, _arg_2:int, _arg_3:_SafeStr_3264):void
        {
            _utils.displayProductIcon(_arg_1, _arg_2, _arg_3);
        }

        public function openRentConfirmationWindow(_arg_1:_SafeStr_3130, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void
        {
            if (_SafeStr_3846 == null)
            {
                _SafeStr_3846 = new RentConfirmationWindow(this);
            };
            _SafeStr_3846.show(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function get roomSession():IRoomSession
        {
            return (_roomSession);
        }

        public function get linkPattern():String
        {
            return ("catalog/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length < 2)
            {
                return;
            };
            switch (_local_2[1])
            {
                case "open":
                    if (_local_2.length > 2)
                    {
                        openCatalogPage(_local_2[2]);
                    }
                    else
                    {
                        openCatalog();
                    };
                    return;
                case "warehouse":
                    if (_local_2.length > 2)
                    {
                        openCatalogPage(_local_2[2], "BUILDERS_CLUB");
                    }
                    else
                    {
                        toggleCatalog("BUILDERS_CLUB", true);
                    };
                    return;
                case "club_buy":
                    openClubCenter();
                    return;
                default:
                    _SafeStr_14.log(("Catalog unknown link-type receive: " + _local_2[1]));
                    return;
            };
        }

        public function get inventory():_SafeStr_1708
        {
            return (_inventory);
        }

        public function get mainContainer():_SafeStr_3133
        {
            return (_SafeStr_3855);
        }

        public function toggleBuilderCatalog():void
        {
            toggleCatalog("BUILDERS_CLUB");
        }

        public function get catalogType():String
        {
            return (_SafeStr_3864);
        }

        public function getCatalogNavigator(_arg_1:String):_SafeStr_3107
        {
            return ((_catalogNavigators != null) ? _catalogNavigators[_arg_1] : null);
        }

        public function get currentCatalogNavigator():_SafeStr_3107
        {
            return (getCatalogNavigator(_SafeStr_3864));
        }

        public function get builderFurniLimit():int
        {
            return (_SafeStr_3880);
        }

        public function get builderFurniCount():int
        {
            return (_SafeStr_3879);
        }

        public function get builderMaxFurniLimit():int
        {
            return (_SafeStr_3881);
        }

        public function get builderSecondsLeft():Number
        {
            return (_SafeStr_3875 - ((getTimer() - _builderMembershipUpdateTime) / 1000));
        }

        public function get builderSecondsLeftWithGrace():Number
        {
            return (_SafeStr_3876 - ((getTimer() - _builderMembershipUpdateTime) / 1000));
        }

        public function get isDoorModeOverriddenInCurrentRoom():Boolean
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:* = null;
            if (((!(buildersClubEnabled)) || (builderSecondsLeft > 0)))
            {
                return (false);
            };
            var _local_4:int = roomEngine.getRoomObjectCount(roomSession.roomId, 10);
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _local_1 = roomEngine.getRoomObjectWithIndex(roomSession.roomId, _local_3, 10);
                if (_SafeStr_3270.isBuilderClubId(_local_1.getId()))
                {
                    return (true);
                };
                _local_3++;
            };
            var _local_5:int = roomEngine.getRoomObjectCount(roomSession.roomId, 20);
            _local_3 = 0;
            while (_local_3 < _local_5)
            {
                _local_2 = roomEngine.getRoomObjectWithIndex(roomSession.roomId, _local_3, 20);
                if (_SafeStr_3270.isBuilderClubId(_local_2.getId()))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function getOfferCenter(_arg_1:IOfferExtension):IOfferCenter
        {
            if (_offerCenter == null)
            {
                _offerCenter = new OfferCenter(windowManager, assets, this);
            };
            _offerCenter.offerExtension = _arg_1;
            return (_offerCenter);
        }

        public function isNewIdentity():Boolean
        {
            return (getInteger("new.identity", 0) > 0);
        }

        public function useNonTabbedCatalog():Boolean
        {
            return (getBoolean("client.desktop.use.non.tabbed.catalog"));
        }


    }
}//package com.sulake.habbo.catalog

// _SafeStr_1008 = "_-ej" (String#14348, DoABC#4)
// _SafeStr_1030 = "_-yA" (String#31118, DoABC#4)
// _SafeStr_1051 = "_-a1F" (String#31051, DoABC#4)
// _SafeStr_1052 = "_-I1P" (String#39362, DoABC#4)
// _SafeStr_1055 = "_-yp" (String#34599, DoABC#4)
// _SafeStr_1117 = "_-T1q" (String#40038, DoABC#4)
// _SafeStr_1144 = "_-01y" (String#35285, DoABC#4)
// _SafeStr_1191 = "_-k1k" (String#35629, DoABC#4)
// _SafeStr_1206 = "_-gl" (String#32322, DoABC#4)
// _SafeStr_1209 = "_-x1h" (String#32902, DoABC#4)
// _SafeStr_1243 = "_-v1n" (String#34280, DoABC#4)
// _SafeStr_126 = "_-81V" (String#29698, DoABC#4)
// _SafeStr_1273 = "_-uq" (String#34412, DoABC#4)
// _SafeStr_1274 = "_-I1o" (String#18905, DoABC#4)
// _SafeStr_1288 = "_-q12" (String#38529, DoABC#4)
// _SafeStr_1353 = "_-D1X" (String#30303, DoABC#4)
// _SafeStr_1381 = "_-86" (String#28730, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1406 = "_-227" (String#24167, DoABC#4)
// _SafeStr_1421 = "_-51B" (String#28803, DoABC#4)
// _SafeStr_1463 = "_-GC" (String#30271, DoABC#4)
// _SafeStr_148 = "_-l6" (String#24255, DoABC#4)
// _SafeStr_1484 = "_-UW" (String#39460, DoABC#4)
// _SafeStr_1533 = "_-Z14" (String#15456, DoABC#4)
// _SafeStr_155 = "_-d1t" (String#28706, DoABC#4)
// _SafeStr_1565 = "_-i1o" (String#13975, DoABC#4)
// _SafeStr_1611 = "_-m6" (String#8890, DoABC#4)
// _SafeStr_1613 = "_-xG" (String#3181, DoABC#4)
// _SafeStr_166 = "_-S1t" (String#10540, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1706 = "_-817" (String#5080, DoABC#4)
// _SafeStr_1707 = "_-D8" (String#6997, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_1758 = "_-Y5" (String#3968, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2046 = "_-y13" (String#3747, DoABC#4)
// _SafeStr_205 = "_-d1c" (String#16754, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_236 = "_-fD" (String#24367, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_243 = "_-br" (String#11960, DoABC#4)
// _SafeStr_248 = "_-CB" (String#22988, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_258 = "_-dE" (String#23978, DoABC#4)
// _SafeStr_264 = "_-H9" (String#30200, DoABC#4)
// _SafeStr_277 = "_-G1L" (String#28194, DoABC#4)
// _SafeStr_281 = "_-OA" (String#10431, DoABC#4)
// _SafeStr_289 = "_-ZI" (String#19262, DoABC#4)
// _SafeStr_296 = "_-r16" (String#30367, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3107 = "_-Bx" (String#5257, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3170 = "_-51P" (String#969, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3209 = "_-02T" (String#6368, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3214 = "_-H1a" (String#6911, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3270 = "_-j1T" (String#7568, DoABC#4)
// _SafeStr_358 = "_-41x" (String#31359, DoABC#4)
// _SafeStr_380 = "_-r1S" (String#28736, DoABC#4)
// _SafeStr_3833 = "_-mp" (String#7679, DoABC#4)
// _SafeStr_3840 = "_-t6" (String#1593, DoABC#4)
// _SafeStr_3841 = "_-12E" (String#10053, DoABC#4)
// _SafeStr_3842 = "_-413" (String#1546, DoABC#4)
// _SafeStr_3843 = "_-O1V" (String#6270, DoABC#4)
// _SafeStr_3844 = "_-Sl" (String#6659, DoABC#4)
// _SafeStr_3845 = "_-O1d" (String#7688, DoABC#4)
// _SafeStr_3846 = "_-i4" (String#8564, DoABC#4)
// _SafeStr_3847 = "_-p1p" (String#5584, DoABC#4)
// _SafeStr_3848 = "_-5s" (String#5010, DoABC#4)
// _SafeStr_3849 = "_-DB" (String#10422, DoABC#4)
// _SafeStr_3850 = "_-B1U" (String#6093, DoABC#4)
// _SafeStr_3851 = "_-j2" (String#6519, DoABC#4)
// _SafeStr_3852 = "_-32b" (String#6262, DoABC#4)
// _SafeStr_3853 = "_-T1w" (String#2104, DoABC#4)
// _SafeStr_3854 = "_-mI" (String#2529, DoABC#4)
// _SafeStr_3855 = "_-n0" (String#1385, DoABC#4)
// _SafeStr_3856 = "_-PQ" (String#4480, DoABC#4)
// _SafeStr_3857 = "_-b1F" (String#2000, DoABC#4)
// _SafeStr_3858 = "_-X1E" (String#11503, DoABC#4)
// _SafeStr_3859 = "_-y1a" (String#14696, DoABC#4)
// _SafeStr_3860 = "_-gB" (String#14664, DoABC#4)
// _SafeStr_3861 = "_-C1f" (String#12702, DoABC#4)
// _SafeStr_3862 = "_-02t" (String#3695, DoABC#4)
// _SafeStr_3863 = "_-1P" (String#10809, DoABC#4)
// _SafeStr_3864 = "_-Qc" (String#2490, DoABC#4)
// _SafeStr_3865 = "_-8B" (String#10910, DoABC#4)
// _SafeStr_3866 = "_-d1K" (String#7072, DoABC#4)
// _SafeStr_3867 = "_-Vs" (String#1371, DoABC#4)
// _SafeStr_3868 = "_-Nc" (String#18670, DoABC#4)
// _SafeStr_3869 = "_-y1V" (String#3474, DoABC#4)
// _SafeStr_387 = "_-Vj" (String#19303, DoABC#4)
// _SafeStr_3870 = "_-22d" (String#20298, DoABC#4)
// _SafeStr_3871 = "_-o15" (String#6011, DoABC#4)
// _SafeStr_3872 = "_-n1t" (String#20850, DoABC#4)
// _SafeStr_3873 = "_-bH" (String#2852, DoABC#4)
// _SafeStr_3874 = "_-bG" (String#10119, DoABC#4)
// _SafeStr_3875 = "_-11A" (String#13483, DoABC#4)
// _SafeStr_3876 = "_-Gk" (String#14599, DoABC#4)
// _SafeStr_3877 = "_-z1m" (String#12230, DoABC#4)
// _SafeStr_3878 = "_-hO" (String#13280, DoABC#4)
// _SafeStr_3879 = "_-n1w" (String#13934, DoABC#4)
// _SafeStr_3880 = "_-NW" (String#14026, DoABC#4)
// _SafeStr_3881 = "_-W13" (String#17159, DoABC#4)
// _SafeStr_389 = "_-22P" (String#29197, DoABC#4)
// _SafeStr_409 = "_-Oc" (String#31168, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_412 = "_-12a" (String#13209, DoABC#4)
// _SafeStr_431 = "_-ha" (String#31369, DoABC#4)
// _SafeStr_437 = "_-B1m" (String#18160, DoABC#4)
// _SafeStr_446 = "_-32Q" (String#7689, DoABC#4)
// _SafeStr_477 = "_-eV" (String#30325, DoABC#4)
// _SafeStr_486 = "_-X1y" (String#30724, DoABC#4)
// _SafeStr_493 = "_-M17" (String#29155, DoABC#4)
// _SafeStr_494 = "_-C1N" (String#29236, DoABC#4)
// _SafeStr_522 = "_-FG" (String#22487, DoABC#4)
// _SafeStr_529 = "_-d19" (String#24745, DoABC#4)
// _SafeStr_560 = "_-aG" (String#31295, DoABC#4)
// _SafeStr_562 = "_-fO" (String#19095, DoABC#4)
// _SafeStr_582 = "_-t1f" (String#23593, DoABC#4)
// _SafeStr_598 = "_-5R" (String#22358, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_626 = "_-xZ" (String#18522, DoABC#4)
// _SafeStr_639 = "_-91d" (String#10781, DoABC#4)
// _SafeStr_652 = "_-J1e" (String#25293, DoABC#4)
// _SafeStr_696 = "_-1l" (String#23942, DoABC#4)
// _SafeStr_739 = "_-Zv" (String#19251, DoABC#4)
// _SafeStr_743 = "_-Y1X" (String#8884, DoABC#4)
// _SafeStr_749 = "_-i1a" (String#23615, DoABC#4)
// _SafeStr_754 = "_-q1k" (String#31421, DoABC#4)
// _SafeStr_755 = "_-12F" (String#31012, DoABC#4)
// _SafeStr_765 = "_-a" (String#26064, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)
// _SafeStr_803 = "_-W19" (String#31407, DoABC#4)
// _SafeStr_805 = "_-Z13" (String#31178, DoABC#4)
// _SafeStr_818 = "_-h1Q" (String#17482, DoABC#4)
// _SafeStr_828 = "_-N1t" (String#30300, DoABC#4)
// _SafeStr_829 = "_-w1" (String#29742, DoABC#4)
// _SafeStr_832 = "_-EG" (String#30454, DoABC#4)
// _SafeStr_8364 = "_-k1S" (String#15770, DoABC#4)
// _SafeStr_842 = "_-ep" (String#13569, DoABC#4)
// _SafeStr_845 = "_-H1e" (String#13308, DoABC#4)
// _SafeStr_868 = "_-2z" (String#15231, DoABC#4)
// _SafeStr_873 = "_-m2" (String#28485, DoABC#4)
// _SafeStr_879 = "_-c" (String#28634, DoABC#4)
// _SafeStr_914 = "_-61R" (String#19915, DoABC#4)
// _SafeStr_915 = "_-y7" (String#31242, DoABC#4)
// _SafeStr_922 = "_-fQ" (String#9161, DoABC#4)
// _SafeStr_950 = "_-3B" (String#29453, DoABC#4)
// _SafeStr_973 = "_-fx" (String#24201, DoABC#4)
// _SafeStr_990 = "_-D1i" (String#4238, DoABC#4)


