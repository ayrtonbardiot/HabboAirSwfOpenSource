// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.SessionDataManager

package com.sulake.habbo.session
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.window._SafeStr_1695;
    import flash.utils.Dictionary;
    import com.sulake.habbo.session.product.ProductDataParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.session.furniture.FurnitureDataParser;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.utils.Timer;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import _-y1x._SafeStr_844;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Ol._SafeStr_327;
    import _-yL._SafeStr_123;
    import _-R7._SafeStr_214;
    import _-a1N._SafeStr_331;
    import _-AE._SafeStr_743;
    import _-yL._SafeStr_142;
    import _-a5._SafeStr_186;
    import _-02s._SafeStr_587;
    import _-W1K._SafeStr_212;
    import _-W1K._SafeStr_889;
    import _-yL._SafeStr_528;
    import _-b1c._SafeStr_290;
    import _-W1K._SafeStr_520;
    import _-a1N._SafeStr_195;
    import _-W1K._SafeStr_206;
    import com.sulake.habbo.session.furniture._SafeStr_1707;
    import _-K1r._SafeStr_1185;
    import com.sulake.habbo.utils.HabboWebTools;
    import _-NF._SafeStr_1212;
    import com.sulake.habbo.session.events.UserNameUpdateEvent;
    import _-MB._SafeStr_1090;
    import _-TT._SafeStr_1377;
    import com.sulake.habbo.session.events.MysteryBoxKeysUpdateEvent;
    import _-A1o._SafeStr_1325;
    import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
    import _-NF._SafeStr_1056;
    import _-Z1K._SafeStr_1477;
    import _-NF._SafeStr_1483;
    import _-71W._SafeStr_414;
    import flash.display.BitmapData;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.communication.messages.IMessageComposer;
    import _-XO._SafeStr_627;
    import _-mx._SafeStr_182;
    import _-mx._SafeStr_718;
    import _-mx._SafeStr_711;
    import _-mx._SafeStr_920;
    import _-m1i._SafeStr_801;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.habbo.session.product._SafeStr_1706;
    import _-l1n._SafeStr_1131;
    import _-21B._SafeStr_660;
    import flash.events.TimerEvent;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.iid.*;

    public class SessionDataManager extends _SafeStr_20 implements ISessionDataManager 
    {

        public static const _SafeStr_8305:uint = 1;

        private var _communication:_SafeStr_25;
        private var _windowManager:_SafeStr_1695;
        private var _roomSessionManager:IRoomSessionManager;
        private var _SafeStr_3810:PerkManager;
        private var _SafeStr_3820:int;
        private var _name:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _realName:String;
        private var _SafeStr_7347:int = 0;
        private var _SafeStr_3832:int = 0;
        private var _SafeStr_3824:int = 0;
        private var _SafeStr_3836:Boolean = true;
        private var _SafeStr_8927:Array;
        private var _systemOpen:Boolean;
        private var _SafeStr_3825:Boolean;
        private var _isAuthenticHabbo:Boolean;
        private var _SafeStr_3814:Dictionary;
        private var _SafeStr_3812:ProductDataParser;
        private var _floorItems:_SafeStr_24;
        private var _wallItems:_SafeStr_24;
        private var _SafeStr_3809:_SafeStr_24;
        private var _SafeStr_3811:FurnitureDataParser;
        private var _SafeStr_3813:BadgeImageManager;
        private var _SafeStr_3830:HabboGroupInfoManager;
        private var _SafeStr_3818:IgnoredUsersManager;
        private var _localization:_SafeStr_18;
        private var _SafeStr_3833:Boolean = false;
        private var _productDataListeners:Array;
        private var _furniDataListeners:Array;
        private var _SafeStr_3827:int;
        private var _SafeStr_3826:int;
        private var _SafeStr_3816:int = 0;
        private var _SafeStr_3817:int = -1;
        private var _isAmbassador:Boolean;
        private var _SafeStr_3828:Boolean;
        private var _SafeStr_3829:Boolean;
        private var _SafeStr_3822:int;
        private var _SafeStr_3831:Boolean = false;
        private var _mysteryBoxColor:String;
        private var _mysteryKeyColor:String;
        private var _SafeStr_3823:Boolean = false;
        private var _SafeStr_3815:Boolean = false;
        private var _SafeStr_3835:Timer = null;
        private var _newFurniDataHash:String = null;

        public function SessionDataManager(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }, ((flags & 0x01) == 0)), new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
                "type":"complete",
                "callback":onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }, false)]));
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
            _SafeStr_3814 = new Dictionary();
            _floorItems = new _SafeStr_24();
            _wallItems = new _SafeStr_24();
            _SafeStr_3809 = new _SafeStr_24();
            initFurnitureData();
            initProductData();
            initBadgeImageManager();
        }

        override protected function initComponent():void
        {
            if (_communication)
            {
                _communication.addHabboConnectionMessageEvent((new _SafeStr_844(onRoomReady) as IMessageEvent));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_327(onUserChange));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_123(onNoobnessLevelEvent));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_214(onAccountPreferences));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_331(onChangeUserNameResult));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_743(onCatalogPublished));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_142(onUserRights));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_186(onAvailabilityStatus));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_587(onMysteryBoxKeys));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_212(onAccountSafetyLockStatusChanged));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_889(onInClientLink));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_528(onUserObject));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_290(onPetRespectFailed));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_520(onEmailStatus));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_195(onFigureUpdate));
                _communication.addHabboConnectionMessageEvent(new _SafeStr_206(onUserNameChange));
            };
            _SafeStr_8927 = [];
            _SafeStr_3830 = new HabboGroupInfoManager(this);
            _SafeStr_3818 = new IgnoredUsersManager(this);
            _SafeStr_3810 = new PerkManager(this);
            _productDataListeners = [];
            _furniDataListeners = [];
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_floorItems)
            {
                _floorItems.dispose();
                _floorItems = null;
            };
            if (_SafeStr_3809)
            {
                _SafeStr_3809.dispose();
                _SafeStr_3809 = null;
            };
            if (_SafeStr_3810)
            {
                _SafeStr_3810.dispose();
                _SafeStr_3810 = null;
            };
            _furniDataListeners = null;
            if (_SafeStr_3811)
            {
                _SafeStr_3811.removeEventListener("FDP_furniture_data_ready", onFurnitureReady);
                _SafeStr_3811.dispose();
                _SafeStr_3811 = null;
            };
            if (_SafeStr_3812)
            {
                _SafeStr_3812.removeEventListener("PDP_product_data_ready", onProductsReady);
                _SafeStr_3812.dispose();
                _SafeStr_3812 = null;
            };
            super.dispose();
        }

        private function initBadgeImageManager():void
        {
            if (_SafeStr_3813 != null)
            {
                return;
            };
            _SafeStr_3813 = new BadgeImageManager(assets, events, this);
        }

        private function initFurnitureData():void
        {
            var _local_2:* = null;
            var _local_3:int;
            var _local_1:* = null;
            if (_SafeStr_3811)
            {
                _SafeStr_3811.dispose();
                _SafeStr_3811 = null;
            };
            _SafeStr_3811 = new FurnitureDataParser(_floorItems, _wallItems, _SafeStr_3809, _localization);
            _SafeStr_3811.addEventListener("FDP_furniture_data_ready", onFurnitureReady);
            if (propertyExists("furnidata.load.url"))
            {
                _local_2 = getProperty("furnidata.load.url");
                if (_newFurniDataHash != null)
                {
                    _local_3 = _local_2.lastIndexOf("/");
                    _local_1 = _local_2.substring(0, _local_3);
                    _SafeStr_3811.loadData(((_local_1 + "/") + _newFurniDataHash));
                }
                else
                {
                    if (((!(_localization)) || (!(_localization.getGameDataResources()))))
                    {
                        _SafeStr_3811.loadData(_local_2);
                    }
                    else
                    {
                        _SafeStr_3811.loadData(_local_2, _localization.getGameDataResources().getFurniDataHash(), _localization.getActiveEnvironmentId());
                    };
                };
            };
        }

        private function initProductData():void
        {
            if (_SafeStr_3812)
            {
                _SafeStr_3812.dispose();
                _SafeStr_3812 = null;
            };
            var _local_1:String = getProperty("productdata.load.url");
            if (((!(_localization)) || (!(_localization.getGameDataResources()))))
            {
                _SafeStr_3812 = new ProductDataParser(_local_1, _SafeStr_3814);
            }
            else
            {
                _SafeStr_3812 = new ProductDataParser(_local_1, _SafeStr_3814, _localization.getGameDataResources().getProductDataHash(), _localization.getActiveEnvironmentId());
            };
            _SafeStr_3812.addEventListener("PDP_product_data_ready", onProductsReady);
        }

        private function onFurnitureReady(_arg_1:Event=null):void
        {
            _SafeStr_3811.removeEventListener("FDP_furniture_data_ready", onFurnitureReady);
            _SafeStr_3823 = true;
            if (((isAuthenticHabbo) && (!(_SafeStr_3815))))
            {
                _SafeStr_3815 = true;
                for each (var _local_2:_SafeStr_1707 in _furniDataListeners)
                {
                    _local_2.furniDataReady();
                };
            };
        }

        private function onUserRights(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_142 = _SafeStr_142(_arg_1);
            _SafeStr_3827 = ((_local_2.clubLevel != 0) ? 2 : 0);
            _SafeStr_3826 = _local_2.securityLevel;
            _SafeStr_3816 = Math.max(_SafeStr_3816, _local_2.securityLevel);
            _isAmbassador = _local_2.isAmbassador;
        }

        private function onNoobnessLevelEvent(_arg_1:_SafeStr_123):void
        {
            _SafeStr_3817 = _arg_1.noobnessLevel;
            if (_SafeStr_3817 != 0)
            {
                context.configuration.setProperty("new.identity", "1");
            };
        }

        private function onUserObject(_arg_1:IMessageEvent):void
        {
            var _local_4:* = null;
            var _local_2:_SafeStr_528 = (_arg_1 as _SafeStr_528);
            var _local_3:_SafeStr_1185 = _local_2.getParser();
            _SafeStr_3820 = _local_3.id;
            _name = _local_3.name;
            _SafeStr_7347 = _local_3.respectTotal;
            _SafeStr_3832 = _local_3.respectLeft;
            _SafeStr_3824 = _local_3.petRespectLeft;
            _SafeStr_3819 = _local_3.figure;
            _SafeStr_3834 = _local_3.sex;
            _realName = _local_3.realName;
            _SafeStr_3836 = _local_3.nameChangeAllowed;
            _SafeStr_3831 = _local_3.accountSafetyLocked;
            try
            {
                if (((context.displayObjectContainer) && (propertyExists("environment.id"))))
                {
                    _local_4 = getProperty("environment.id");
                    _local_4 = _local_4.replace("pt", "br");
                    _local_4 = _local_4.replace("en", "com");
                    context.displayObjectContainer.stage.nativeWindow.title = ((("Habbo " + _local_4.toUpperCase()) + " | ") + _name);
                };
            }
            catch(e:Error)
            {
            };
            _SafeStr_3818.initIgnoreList();
        }

        private function onUserChange(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_327 = (_arg_1 as _SafeStr_327);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.id == -1)
            {
                _SafeStr_3819 = _local_2.figure;
                _SafeStr_3834 = _local_2.sex;
            };
        }

        private function onFigureUpdate(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_195 = (_arg_1 as _SafeStr_195);
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_3819 = _local_2.figure;
            _SafeStr_3834 = _local_2.gender;
            HabboWebTools.updateFigure(_SafeStr_3819);
        }

        private function onUserNameChange(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_206 = (_arg_1 as _SafeStr_206);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1212 = _local_2.getParser();
            if (_local_3.webId == _SafeStr_3820)
            {
                _name = _local_3.newName;
                _SafeStr_3836 = false;
                events.dispatchEvent(new UserNameUpdateEvent(_name));
            };
        }

        private function onChangeUserNameResult(_arg_1:_SafeStr_331):void
        {
            var _local_2:_SafeStr_1090 = _arg_1.getParser();
            if (_local_2.resultCode == _SafeStr_331._SafeStr_3821)
            {
                _SafeStr_3836 = false;
                events.dispatchEvent(new UserNameUpdateEvent(_local_2.name));
            };
        }

        private function onMysteryBoxKeys(_arg_1:_SafeStr_587):void
        {
            var _local_2:_SafeStr_1377 = _arg_1.getParser();
            _mysteryBoxColor = _local_2.boxColor;
            _mysteryKeyColor = _local_2.keyColor;
            events.dispatchEvent(new MysteryBoxKeysUpdateEvent(_mysteryBoxColor, _mysteryKeyColor));
        }

        private function onInClientLink(_arg_1:_SafeStr_889):void
        {
            context.createLinkEvent(_arg_1.link);
        }

        private function onAccountPreferences(_arg_1:_SafeStr_214):void
        {
            var _local_2:_SafeStr_1325 = (_arg_1.getParser() as _SafeStr_1325);
            _SafeStr_3829 = _local_2.roomCameraFollowDisabled;
            _SafeStr_3822 = _local_2.uiFlags;
            events.dispatchEvent(new SessionDataPreferencesEvent(_SafeStr_3822));
        }

        private function onEmailStatus(_arg_1:_SafeStr_520):void
        {
            var _local_2:_SafeStr_1056 = (_arg_1.getParser() as _SafeStr_1056);
            _SafeStr_3828 = _local_2.isVerified;
        }

        private function onAvailabilityStatus(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1477 = (_arg_1 as _SafeStr_186).getParser();
            if (_local_2 == null)
            {
                return;
            };
            _systemOpen = _local_2.isOpen;
            _SafeStr_3825 = _local_2.onShutDown;
            _isAuthenticHabbo = _local_2.isAuthenticHabbo;
            if ((((isAuthenticHabbo) && (_SafeStr_3823)) && (!(_SafeStr_3815))))
            {
                _SafeStr_3815 = true;
                for each (var _local_3:_SafeStr_1707 in _furniDataListeners)
                {
                    _local_3.furniDataReady();
                };
            };
        }

        private function onPetRespectFailed(_arg_1:_SafeStr_290):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_3824++;
        }

        private function onAccountSafetyLockStatusChanged(_arg_1:_SafeStr_212):void
        {
            var _local_2:_SafeStr_1483 = _arg_1.getParser();
            _SafeStr_3831 = (_local_2.status == 0);
        }

        public function get systemOpen():Boolean
        {
            return (_systemOpen);
        }

        public function get systemShutDown():Boolean
        {
            return (_SafeStr_3825);
        }

        public function get isAuthenticHabbo():Boolean
        {
            return (_isAuthenticHabbo);
        }

        public function hasSecurity(_arg_1:int):Boolean
        {
            return (_SafeStr_3826 >= _arg_1);
        }

        public function get topSecurityLevel():int
        {
            return (_SafeStr_3816);
        }

        public function get clubLevel():int
        {
            return (_SafeStr_3827);
        }

        public function get hasVip():Boolean
        {
            return (HabboClubLevelEnum.HasVip(_SafeStr_3827));
        }

        public function get hasClub():Boolean
        {
            return (HabboClubLevelEnum.HasClub(_SafeStr_3827));
        }

        public function get isNoob():Boolean
        {
            return (!(_SafeStr_3817 == 0));
        }

        public function get isRealNoob():Boolean
        {
            return (_SafeStr_3817 == 2);
        }

        public function get userId():int
        {
            return (_SafeStr_3820);
        }

        public function get userName():String
        {
            return (_name);
        }

        public function get realName():String
        {
            return (_realName);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get isAnyRoomController():Boolean
        {
            return (_SafeStr_3826 >= 5);
        }

        public function get isAmbassador():Boolean
        {
            return (_isAmbassador);
        }

        public function get isEmailVerified():Boolean
        {
            return (_SafeStr_3828);
        }

        public function setRoomCameraFollowDisabled(_arg_1:Boolean):void
        {
            _SafeStr_3829 = _arg_1;
        }

        public function get isRoomCameraFollowDisabled():Boolean
        {
            return (_SafeStr_3829);
        }

        public function setFriendBarState(_arg_1:Boolean):void
        {
            setUIFlag(1, _arg_1);
        }

        public function setRoomToolsState(_arg_1:Boolean):void
        {
            setUIFlag(2, _arg_1);
        }

        public function get uiFlags():int
        {
            return (_SafeStr_3822);
        }

        private function setUIFlag(_arg_1:int, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                if ((_SafeStr_3822 & _arg_1))
                {
                    return;
                };
                _SafeStr_3822 = (_SafeStr_3822 | _arg_1);
            }
            else
            {
                if (!(_SafeStr_3822 & _arg_1))
                {
                    return;
                };
                _SafeStr_3822 = (_SafeStr_3822 & (~(_arg_1)));
            };
            _communication.connection.send(new _SafeStr_414(_SafeStr_3822));
        }

        public function getBadgeImage(_arg_1:String):BitmapData
        {
            return (_SafeStr_3813.getBadgeImage(_arg_1));
        }

        public function getBadgeSmallImage(_arg_1:String):BitmapData
        {
            return (_SafeStr_3813.getSmallBadgeImage(_arg_1));
        }

        public function getBadgeImageAssetName(_arg_1:String):String
        {
            return (_SafeStr_3813.getBadgeImageAssetName(_arg_1));
        }

        public function getBadgeImageSmallAssetName(_arg_1:String):String
        {
            return (_SafeStr_3813.getSmallScaleBadgeAssetName(_arg_1));
        }

        public function requestBadgeImage(_arg_1:String):BitmapData
        {
            return (_SafeStr_3813.getBadgeImage(_arg_1, "normal_badge", false));
        }

        public function getBadgeImageWithInfo(_arg_1:String):BadgeInfo
        {
            return (_SafeStr_3813.getBadgeImageWithInfo(_arg_1));
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        public function getGroupBadgeId(_arg_1:int):String
        {
            return (_SafeStr_3830.getBadgeId(_arg_1));
        }

        public function send(_arg_1:IMessageComposer):void
        {
            _communication.connection.send(_arg_1);
        }

        public function getGroupBadgeImage(_arg_1:String):BitmapData
        {
            return (_SafeStr_3813.getBadgeImage(_arg_1, "group_badge"));
        }

        public function getGroupBadgeSmallImage(_arg_1:String):BitmapData
        {
            return (_SafeStr_3813.getSmallBadgeImage(_arg_1, "group_badge"));
        }

        public function getGroupBadgeAssetName(_arg_1:String):String
        {
            return (_SafeStr_3813.getBadgeImageAssetName(_arg_1, "group_badge"));
        }

        public function getGroupBadgeSmallAssetName(_arg_1:String):String
        {
            return (_SafeStr_3813.getSmallScaleBadgeAssetName(_arg_1, "group_badge"));
        }

        public function isAccountSafetyLocked():Boolean
        {
            return (_SafeStr_3831);
        }

        public function get communication():_SafeStr_25
        {
            return (_communication);
        }

        public function isIgnored(_arg_1:String):Boolean
        {
            return (_SafeStr_3818.isIgnored(_arg_1));
        }

        public function ignoreUser(_arg_1:String):void
        {
            _SafeStr_3818.ignoreUser(_arg_1);
        }

        public function unignoreUser(_arg_1:String):void
        {
            _SafeStr_3818.unignoreUser(_arg_1);
        }

        public function get respectLeft():int
        {
            return (_SafeStr_3832);
        }

        public function get petRespectLeft():int
        {
            return (_SafeStr_3824);
        }

        public function giveStarGem(_arg_1:int):void
        {
            if (_arg_1 >= 0)
            {
                send(new _SafeStr_627(_arg_1));
            };
        }

        public function giveRespectFailed():void
        {
            _SafeStr_3832 = (_SafeStr_3832 + 1);
        }

        public function getCreditVaultStatus():void
        {
            send(new _SafeStr_182());
        }

        public function getIncomeRewardStatus():void
        {
            send(new _SafeStr_718());
        }

        public function withdrawCreditVault():void
        {
            send(new _SafeStr_711());
        }

        public function claimReward(_arg_1:int):void
        {
            send(new _SafeStr_920(_arg_1));
        }

        public function givePetRespect(_arg_1:int):void
        {
            if (((_arg_1 >= 0) && (_SafeStr_3824 > 0)))
            {
                send(new _SafeStr_801(_arg_1));
                _SafeStr_3824 = (_SafeStr_3824 - 1);
            };
        }

        public function getProductData(_arg_1:String):_SafeStr_3182
        {
            if (!_SafeStr_3833)
            {
                loadProductData();
            };
            return (_SafeStr_3814[_arg_1]);
        }

        public function getFloorItemData(_arg_1:int):_SafeStr_3130
        {
            if (_floorItems == null)
            {
                return (null);
            };
            return (_floorItems.getValue(_arg_1.toString()));
        }

        public function getFloorItemsDataByCategory(_arg_1:int):Array
        {
            var _local_2:Array = [];
            if (_floorItems != null)
            {
                for each (var _local_3:_SafeStr_3130 in _floorItems)
                {
                    if (_local_3.category == _arg_1)
                    {
                        _local_2.push(_local_3);
                    };
                };
            };
            return (_local_2);
        }

        public function getWallItemData(_arg_1:int):_SafeStr_3130
        {
            if (_wallItems == null)
            {
                return (null);
            };
            return (_wallItems.getValue(_arg_1.toString()));
        }

        public function getFloorItemDataByName(_arg_1:String, _arg_2:int=0):_SafeStr_3130
        {
            var _local_3:int;
            if (_SafeStr_3809 == null)
            {
                return (null);
            };
            var _local_4:Array = _SafeStr_3809.getValue(_arg_1);
            if (((!(_local_4 == null)) && (_arg_2 <= (_local_4.length - 1))))
            {
                _local_3 = _local_4[_arg_2];
                return (getFloorItemData(_local_3));
            };
            return (null);
        }

        public function getWallItemDataByName(_arg_1:String, _arg_2:int=0):_SafeStr_3130
        {
            var _local_3:int;
            if (_SafeStr_3809 == null)
            {
                return (null);
            };
            var _local_4:Array = _SafeStr_3809.getValue(_arg_1);
            if (((!(_local_4 == null)) && (_arg_2 <= (_local_4.length - 1))))
            {
                _local_3 = _local_4[_arg_2];
                return (getWallItemData(_local_3));
            };
            return (null);
        }

        public function openHabboHomePage(_arg_1:int, _arg_2:String):void
        {
            var _local_3:* = null;
            if (propertyExists("link.format.userpage"))
            {
                _local_3 = getProperty("link.format.userpage");
                _local_3 = _local_3.replace("%ID%", String(_arg_1));
                _local_3 = _local_3.replace("%username%", _arg_2);
                try
                {
                    HabboWebTools.navigateToURL(_local_3, "habboMain");
                }
                catch(e:Error)
                {
                    _SafeStr_14.log("Error occurred!");
                };
            };
        }

        public function pickAllFurniture(_arg_1:int):void
        {
            var roomId = _arg_1;
            if (((_roomSessionManager == null) || (_windowManager == null)))
            {
                return;
            };
            var session:IRoomSession = _roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            };
            if ((((session.isRoomOwner) || (isAnyRoomController)) || (session.roomControllerLevel >= 1)))
            {
                _windowManager.confirm("${generic.alert.title}", "${room.confirm.pick_all}", 0, function (_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
                {
                    _arg_1.dispose();
                    if (_arg_2.type == "WE_OK")
                    {
                        sendSpecialCommandMessage(":pickall");
                    };
                });
            };
        }

        public function ejectAllFurniture(_arg_1:int, _arg_2:String):void
        {
            var roomId = _arg_1;
            var message = _arg_2;
            if (((_roomSessionManager == null) || (_windowManager == null)))
            {
                return;
            };
            var session:IRoomSession = _roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            };
            if ((((session.isRoomOwner) || (isAnyRoomController)) || (session.roomControllerLevel >= 1)))
            {
                _windowManager.confirm("${generic.alert.title}", "${room.confirm.eject_all}", 0, function (_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
                {
                    _arg_1.dispose();
                    if (_arg_2.type == "WE_OK")
                    {
                        sendSpecialCommandMessage(message);
                    };
                });
            };
        }

        public function ejectPets(_arg_1:int):void
        {
            if (((_roomSessionManager == null) || (_windowManager == null)))
            {
                return;
            };
            var _local_2:IRoomSession = _roomSessionManager.getSession(_arg_1);
            if (_local_2 == null)
            {
                return;
            };
            if (((_local_2.isRoomOwner) || (isAnyRoomController)))
            {
                sendSpecialCommandMessage(":ejectpets");
            };
        }

        public function pickAllBuilderFurniture(_arg_1:int):void
        {
            var roomId = _arg_1;
            if (((_roomSessionManager == null) || (_windowManager == null)))
            {
                return;
            };
            var session:IRoomSession = _roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            };
            if ((((session.isRoomOwner) || (isAnyRoomController)) || (session.roomControllerLevel >= 1)))
            {
                _windowManager.confirm("${generic.alert.title}", "${room.confirm.pick_all_bc}", 0, function (_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
                {
                    _arg_1.dispose();
                    if (_arg_2.type == "WE_OK")
                    {
                        sendSpecialCommandMessage(":pickallbc");
                    };
                });
            };
        }

        public function loadProductData(_arg_1:_SafeStr_1706=null):Boolean
        {
            if (_SafeStr_3833)
            {
                return (true);
            };
            if (((_arg_1) && (_productDataListeners.indexOf(_arg_1) == -1)))
            {
                _productDataListeners.push(_arg_1);
            };
            return (false);
        }

        public function addProductsReadyEventListener(_arg_1:_SafeStr_1706):void
        {
            if (_SafeStr_3833)
            {
                _arg_1.productDataReady();
                return;
            };
            if (((_arg_1) && (_productDataListeners.indexOf(_arg_1) == -1)))
            {
                _productDataListeners.push(_arg_1);
            };
        }

        private function onProductsReady(_arg_1:Event):void
        {
            _SafeStr_3812.removeEventListener("PDP_product_data_ready", onProductsReady);
            _SafeStr_3833 = true;
            for each (var _local_2:_SafeStr_1706 in _productDataListeners)
            {
                if (((!(_local_2 == null)) && (!(_local_2.disposed))))
                {
                    _local_2.productDataReady();
                };
            };
            _productDataListeners = [];
        }

        private function onRoomReady(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_844 = (_arg_1 as _SafeStr_844);
            if ((((_local_3 == null) || (_local_3.getParser() == null)) || (_arg_1.connection == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1131 = _local_3.getParser();
            HabboWebTools.roomVisited(_local_2.roomId);
        }

        public function sendSpecialCommandMessage(_arg_1:String):void
        {
            send(new _SafeStr_660(_arg_1));
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_roomSessionManager);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        private function onCatalogPublished(_arg_1:IMessageEvent):void
        {
            var _local_2:int;
            var _local_4:int;
            var _local_5:int;
            var _local_3:_SafeStr_743 = (_arg_1 as _SafeStr_743);
            if (_local_3.newFurniDataHash != null)
            {
                _newFurniDataHash = _local_3.newFurniDataHash;
            };
            if (_local_3.instantlyRefreshCatalogue)
            {
                refreshFurniData(null);
            }
            else
            {
                _local_2 = getInteger("catalogue.published.min.refresh.interval", 5);
                _local_4 = getInteger("catalogue.published.max.refresh.interval", 20);
                _local_5 = (Math.floor((Math.random() * ((_local_4 - _local_2) + 1))) + _local_2);
                if (_SafeStr_3835 == null)
                {
                    _SafeStr_3835 = new Timer((_local_5 * 3000));
                    _SafeStr_3835.addEventListener("timer", refreshFurniData);
                    _SafeStr_3835.start();
                };
            };
        }

        private function refreshFurniData(_arg_1:TimerEvent):void
        {
            if (_SafeStr_3835 != null)
            {
                _SafeStr_3835.removeEventListener("timer", refreshFurniData);
                _SafeStr_3835 = null;
            };
            _floorItems = new _SafeStr_24();
            _wallItems = new _SafeStr_24();
            _SafeStr_3809 = new _SafeStr_24();
            initFurnitureData();
        }

        public function removeFurniDataListener(_arg_1:_SafeStr_1707):void
        {
            if (!_furniDataListeners)
            {
                return;
            };
            var _local_2:int = _furniDataListeners.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                _furniDataListeners.splice(_local_2, 1);
            };
        }

        public function getFurniData(_arg_1:_SafeStr_1707):Vector.<_SafeStr_3130>
        {
            if (((_floorItems == null) || (_floorItems.length == 0)))
            {
                if (_furniDataListeners.indexOf(_arg_1) == -1)
                {
                    _furniDataListeners.push(_arg_1);
                };
                return (null);
            };
            return (Vector.<_SafeStr_3130>(_floorItems.getValues().concat(_wallItems.getValues())));
        }

        public function getXmlWindow(_arg_1:String):_SafeStr_3109
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:_SafeStr_3109;
            try
            {
                _local_4 = assets.getAssetByName(_arg_1);
                _local_2 = XmlAsset(_local_4);
                _local_3 = _windowManager.buildFromXML(XML(_local_2.content));
            }
            catch(e:Error)
            {
            };
            return (_local_3);
        }

        public function getButtonImage(_arg_1:String):BitmapData
        {
            var _local_3:* = _arg_1;
            var _local_6:IAsset = assets.getAssetByName(_local_3);
            var _local_4:BitmapDataAsset = BitmapDataAsset(_local_6);
            var _local_2:BitmapData = BitmapData(_local_4.content);
            var _local_5:BitmapData = new BitmapData(_local_2.width, _local_2.height, true, 0);
            _local_5.draw(_local_2);
            return (_local_5);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get nameChangeAllowed():Boolean
        {
            return (_SafeStr_3836);
        }

        public function get perksReady():Boolean
        {
            return ((!(_SafeStr_3810 == null)) && (_SafeStr_3810.isReady));
        }

        public function isPerkAllowed(_arg_1:String):Boolean
        {
            return (_SafeStr_3810.isPerkAllowed(_arg_1));
        }

        public function getPerkErrorMessage(_arg_1:String):String
        {
            return (_SafeStr_3810.getPerkErrorMessage(_arg_1));
        }

        public function get currentTalentTrack():String
        {
            return (((getBoolean("talent.track.citizenship.enabled")) && (!(isPerkAllowed("CITIZEN")))) ? "citizenship" : "helper");
        }

        public function get mysteryBoxColor():String
        {
            return (_mysteryBoxColor);
        }

        public function get mysteryKeyColor():String
        {
            return (_mysteryKeyColor);
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_1056 = "_-614" (String#30901, DoABC#4)
// _SafeStr_1090 = "_-Z1H" (String#31344, DoABC#4)
// _SafeStr_1131 = "_-k1c" (String#17697, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1212 = "_-i1F" (String#23205, DoABC#4)
// _SafeStr_123 = "_-zA" (String#24613, DoABC#4)
// _SafeStr_1325 = "_-ge" (String#18097, DoABC#4)
// _SafeStr_1377 = "_-My" (String#39342, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_142 = "_-Fc" (String#3612, DoABC#4)
// _SafeStr_1477 = "_-G12" (String#39470, DoABC#4)
// _SafeStr_1483 = "_-OO" (String#30822, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1706 = "_-817" (String#5080, DoABC#4)
// _SafeStr_1707 = "_-D8" (String#6997, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_182 = "_-az" (String#30169, DoABC#4)
// _SafeStr_186 = "_-rB" (String#23764, DoABC#4)
// _SafeStr_195 = "_-V1N" (String#9519, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_206 = "_-tP" (String#6892, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_212 = "_-91E" (String#11861, DoABC#4)
// _SafeStr_214 = "_-h1u" (String#5767, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_290 = "_-s1h" (String#11746, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_327 = "_-Uf" (String#3336, DoABC#4)
// _SafeStr_331 = "_-z8" (String#2976, DoABC#4)
// _SafeStr_3809 = "_-G1Z" (String#5544, DoABC#4)
// _SafeStr_3810 = "_-v10" (String#6606, DoABC#4)
// _SafeStr_3811 = "_-ku" (String#4443, DoABC#4)
// _SafeStr_3812 = "_-t1e" (String#4664, DoABC#4)
// _SafeStr_3813 = "_-B1u" (String#5298, DoABC#4)
// _SafeStr_3814 = "_-H1d" (String#3176, DoABC#4)
// _SafeStr_3815 = "_-d1e" (String#11297, DoABC#4)
// _SafeStr_3816 = "_-D1a" (String#15442, DoABC#4)
// _SafeStr_3817 = "_-g1l" (String#12397, DoABC#4)
// _SafeStr_3818 = "_-s1A" (String#10380, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3821 = "_-5N" (String#22387, DoABC#4)
// _SafeStr_3822 = "_-I1Z" (String#4142, DoABC#4)
// _SafeStr_3823 = "_-61v" (String#20041, DoABC#4)
// _SafeStr_3824 = "_-p1O" (String#3982, DoABC#4)
// _SafeStr_3825 = "_-ln" (String#18181, DoABC#4)
// _SafeStr_3826 = "_-f1M" (String#13869, DoABC#4)
// _SafeStr_3827 = "_-81k" (String#3560, DoABC#4)
// _SafeStr_3828 = "_-g1P" (String#15945, DoABC#4)
// _SafeStr_3829 = "_-02L" (String#12026, DoABC#4)
// _SafeStr_3830 = "_-1z" (String#22370, DoABC#4)
// _SafeStr_3831 = "_-Ji" (String#13642, DoABC#4)
// _SafeStr_3832 = "_-11B" (String#3672, DoABC#4)
// _SafeStr_3833 = "_-mp" (String#7679, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_3835 = "_-01a" (String#7564, DoABC#4)
// _SafeStr_3836 = "_-bB" (String#10216, DoABC#4)
// _SafeStr_414 = "_-J1B" (String#30780, DoABC#4)
// _SafeStr_520 = "_-k1E" (String#12508, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_587 = "_-P1d" (String#26393, DoABC#4)
// _SafeStr_627 = "_-8Q" (String#30696, DoABC#4)
// _SafeStr_660 = "_-51g" (String#19804, DoABC#4)
// _SafeStr_711 = "_-Jb" (String#29895, DoABC#4)
// _SafeStr_718 = "_-n1f" (String#29295, DoABC#4)
// _SafeStr_7347 = "_-z1" (String#23144, DoABC#4)
// _SafeStr_743 = "_-Y1X" (String#8884, DoABC#4)
// _SafeStr_801 = "_-31P" (String#19688, DoABC#4)
// _SafeStr_8305 = "_-CT" (String#22470, DoABC#4)
// _SafeStr_844 = "_-9H" (String#4703, DoABC#4)
// _SafeStr_889 = "_-Rj" (String#23173, DoABC#4)
// _SafeStr_8927 = "_-Cf" (String#22955, DoABC#4)
// _SafeStr_920 = "_-6Z" (String#30963, DoABC#4)


