// by nota

//com.sulake.habbo.quest.HabboQuestEngine

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.notifications._SafeStr_2081;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboNotifications;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboNewNavigator;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import _-41O._SafeStr_1607;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.catalog.purse._SafeStr_3226;
    import com.sulake.core.window.components._SafeStr_3264;
    import _-61d._SafeStr_456;
    import _-61d._SafeStr_545;
    import _-61d._SafeStr_410;

    public class HabboQuestEngine extends _SafeStr_20 implements _SafeStr_2046, _SafeStr_41, ILinkEventTracker 
    {

        private static const _SafeStr_8705:int = 5;
        private static const TWINKLE_ANIMATION_START_TIME:int = 800;
        private static const TWINKLE_ANIMATION_OBJECT_COUNT:int = 15;
        private static const DELAY_BETWEEN_TWINKLE_STARTS:int = 300;
        private static const _SafeStr_3957:Array = ["MOVEITEM", "ENTEROTHERSROOM", "CHANGEFIGURE", "FINDLIFEGUARDTOWER", "SCRATCHAPET"];

        private var _windowManager:_SafeStr_1695;
        private var _communication:IHabboCommunicationManager;
        private var _localization:_SafeStr_18;
        private var _configuration:_SafeStr_19;
        private var _SafeStr_3757:_SafeStr_3118;
        private var _SafeStr_3955:QuestController;
        private var _SafeStr_3952:AchievementController;
        private var _SafeStr_3956:RoomCompetitionController;
        private var _toolbar:IHabboToolbar;
        private var _catalog:IHabboCatalog;
        private var _navigator:IHabboNewNavigator;
        private var _notifications:_SafeStr_2081;
        private var _sessionDataManager:ISessionDataManager;
        private var _habboHelp:IHabboHelp;
        private var _tracking:_SafeStr_1704;
        private var _SafeStr_3953:TwinkleImages;
        private var _currentlyInRoom:Boolean = false;
        private var _roomEngine:IRoomEngine;
        private var _SafeStr_7342:Boolean = false;
        private var _SafeStr_3954:AchievementsResolutionController;

        public function HabboQuestEngine(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3955 = new QuestController(this);
            _SafeStr_3952 = new AchievementController(this);
            _SafeStr_3954 = new AchievementsResolutionController(this);
            _SafeStr_3956 = new RoomCompetitionController(this);
            queueInterface(new IIDHabboCommunicationManager(), onCommunicationComponentInit);
            queueInterface(new IIDHabboWindowManager(), onWindowManagerReady);
            queueInterface(new IIDHabboLocalizationManager(), onLocalizationReady);
            queueInterface(new IIDHabboConfigurationManager(), onConfigurationReady);
            queueInterface(new IIDHabboToolbar(), onToolbarReady);
            queueInterface(new IIDHabboCatalog(), onCatalogReady);
            queueInterface(new IIDHabboNotifications(), onNotificationsReady);
            queueInterface(new IIDHabboHelp(), onHabboHelpReady);
            queueInterface(new IIDHabboNewNavigator(), onHabboNavigatorReady);
            queueInterface(new IIDSessionDataManager(), onSessionDataManagerReady);
            queueInterface(new IIDRoomEngine(), onRoomEngineReady);
            queueInterface(new IIDHabboTracking(), onTrackingReady);
            _arg_1.addLinkEventTracker(this);
            registerUpdateReceiver(this, 5);
        }

        public static function moveChildrenToRow(_arg_1:_SafeStr_3133, _arg_2:Array, _arg_3:int, _arg_4:int):void
        {
            var _local_6:* = null;
            for each (var _local_5:String in _arg_2)
            {
                _local_6 = _arg_1.getChildByName(_local_5);
                if (((!(_local_6 == null)) && (_local_6.visible)))
                {
                    _local_6.x = _arg_3;
                    _arg_3 = (_arg_3 + (_local_6.width + _arg_4));
                };
            };
        }


        override public function dispose():void
        {
            removeUpdateReceiver(this);
            context.removeLinkEventTracker(this);
            if (_toolbar)
            {
                _toolbar.release(new IIDHabboToolbar());
                _toolbar = null;
            };
            if (_catalog != null)
            {
                _catalog.release(new IIDHabboCatalog());
                _catalog = null;
            };
            if (_notifications != null)
            {
                _notifications.release(new IIDHabboNotifications());
                _notifications = null;
            };
            if (_windowManager != null)
            {
                _windowManager.release(new IIDHabboWindowManager());
                _windowManager = null;
            };
            if (_localization != null)
            {
                _localization.release(new IIDHabboLocalizationManager());
                _localization = null;
            };
            if (_configuration != null)
            {
                _configuration.release(new IIDHabboConfigurationManager());
                _configuration = null;
            };
            if (_communication != null)
            {
                _communication.release(new IIDHabboCommunicationManager());
                _communication = null;
            };
            if (_sessionDataManager != null)
            {
                _sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY", _SafeStr_3952.onBadgeImageReady);
                _sessionDataManager.release(new IIDSessionDataManager());
                _sessionDataManager = null;
            };
            if (_SafeStr_3757)
            {
                _SafeStr_3757.dispose();
            };
            if (_habboHelp != null)
            {
                _habboHelp.release(new IIDHabboHelp());
                _habboHelp = null;
            };
            if (_navigator != null)
            {
                _navigator.release(new IIDHabboNewNavigator());
                _navigator = null;
            };
            if (_tracking != null)
            {
                _tracking.release(new IIDHabboTracking());
                _tracking = null;
            };
            if (_SafeStr_3953)
            {
                _SafeStr_3953.dispose();
                _SafeStr_3953 = null;
            };
            if (_roomEngine)
            {
                _roomEngine.release(new IIDRoomEngine());
                _roomEngine = null;
            };
            if (_SafeStr_3954)
            {
                _SafeStr_3954.dispose();
                _SafeStr_3954 = null;
            };
            super.dispose();
        }

        public function getXmlWindow(_arg_1:String, _arg_2:int=1):_SafeStr_3109
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:_SafeStr_3109;
            try
            {
                _local_5 = assets.getAssetByName(_arg_1);
                _local_3 = XmlAsset(_local_5);
                _local_4 = _windowManager.buildFromXML(XML(_local_3.content), _arg_2);
            }
            catch(e:Error)
            {
            };
            return (_local_4);
        }

        private function onCommunicationComponentInit(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _communication = IHabboCommunicationManager(_arg_2);
            _SafeStr_3757 = new _SafeStr_3118(this);
        }

        private function onWindowManagerReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _windowManager = _SafeStr_1695(_arg_2);
        }

        private function onLocalizationReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _localization = _SafeStr_18(_arg_2);
        }

        private function onConfigurationReady(_arg_1:IID, _arg_2:IUnknown):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            _configuration = (_arg_2 as _SafeStr_19);
        }

        private function onCatalogReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _catalog = (_arg_2 as IHabboCatalog);
        }

        private function onNotificationsReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _notifications = (_arg_2 as _SafeStr_2081);
        }

        private function onSessionDataManagerReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _sessionDataManager = (_arg_2 as ISessionDataManager);
            _sessionDataManager.events.addEventListener("BIRE_BADGE_IMAGE_READY", _SafeStr_3952.onBadgeImageReady);
        }

        private function onHabboHelpReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _habboHelp = (_arg_2 as IHabboHelp);
        }

        private function onHabboNavigatorReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _navigator = (_arg_2 as IHabboNewNavigator);
        }

        private function onRoomEngineReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _roomEngine = (_arg_2 as IRoomEngine);
        }

        private function onTrackingReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _tracking = (_arg_2 as _SafeStr_1704);
        }

        public function get communication():IHabboCommunicationManager
        {
            return (_communication);
        }

        public function get habboHelp():IHabboHelp
        {
            return (_habboHelp);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get questController():QuestController
        {
            return (_SafeStr_3955);
        }

        public function get roomCompetitionController():RoomCompetitionController
        {
            return (_SafeStr_3956);
        }

        public function get achievementController():AchievementController
        {
            return (_SafeStr_3952);
        }

        public function get achievementsResolutionController():AchievementsResolutionController
        {
            return (_SafeStr_3954);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function get roomEngine():IRoomEngine
        {
            return (_roomEngine);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function get tracking():_SafeStr_1704
        {
            return (_tracking);
        }

        public function openCatalog(_arg_1:_SafeStr_1607):void
        {
            var _local_2:String = _arg_1.catalogPageName;
            if (_local_2 != "")
            {
                _SafeStr_14.log(("Questing->Open Catalog: " + _local_2));
                _catalog.openCatalogPage(_local_2);
            }
            else
            {
                _SafeStr_14.log("Questing->Open Catalog: Quest Catalog page name not defined");
                _catalog.openCatalog();
            };
        }

        public function openNavigator(_arg_1:_SafeStr_1607):void
        {
            var _local_3:* = null;
            var _local_2:Boolean = hasLocalizedValue((_arg_1.getQuestLocalizationKey() + ".searchtag"));
            if (_local_2)
            {
                _local_3 = (_arg_1.getQuestLocalizationKey() + ".searchtag");
            }
            else
            {
                _local_3 = (_arg_1.getCampaignLocalizationKey() + ".searchtag");
            };
            var _local_4:String = _localization.getLocalization(_local_3);
            _SafeStr_14.log(("Questing->Open Navigator: " + _local_4));
            _navigator.performTagSearch(_local_4);
        }

        public function hasQuestRoomsIds():Boolean
        {
            var _local_1:String = getQuestRoomIds();
            return ((!(_local_1 == null)) && (!(_local_1 == "")));
        }

        private function getQuestRoomIds():String
        {
            return (_localization.getLocalization((("quests." + getSeasonalCampaignCodePrefix()) + ".roomids")));
        }

        public function goToQuestRooms():void
        {
            if (!hasQuestRoomsIds())
            {
                return;
            };
            var _local_4:String = getQuestRoomIds();
            var _local_2:Array = _local_4.split(",");
            if (_local_2.length == 0)
            {
                return;
            };
            var _local_3:int = Math.max(0, Math.min((_local_2.length - 1), Math.floor((Math.random() * _local_2.length))));
            var _local_1:String = _local_2[_local_3];
            var _local_5:int = _local_1;
            _SafeStr_14.log(("Forwarding to a guest room: " + _local_5));
            _navigator.goToRoom(_local_5);
        }

        private function onToolbarReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _toolbar = (IHabboToolbar(_arg_2) as IHabboToolbar);
            _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK", onHabboToolbarEvent);
        }

        private function onHabboToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            if (_arg_1.type == "HTE_TOOLBAR_CLICK")
            {
                if (_arg_1.iconId == "HTIE_ICON_QUESTS")
                {
                    _SafeStr_3955.onToolbarClick();
                };
                if (_arg_1.iconId == "HTIE_ICON_ACHIEVEMENTS")
                {
                    _SafeStr_3952.onToolbarClick();
                };
            };
        }

        public function ensureAchievementsInitialized():void
        {
            if (_SafeStr_3952 != null)
            {
                _SafeStr_3952.ensureAchievementsInitialized();
            };
        }

        public function showAchievements():void
        {
            if (_SafeStr_3952 != null)
            {
                _SafeStr_3952.show();
            };
        }

        public function showQuests():void
        {
        }

        public function getAchievementLevel(_arg_1:String, _arg_2:String):int
        {
            if (_SafeStr_3952 != null)
            {
                return (_SafeStr_3952.getAchievementLevel(_arg_1, _arg_2));
            };
            return (0);
        }

        public function reenableRoomCompetitionWindow():void
        {
            _SafeStr_3956.dontShowAgain = false;
        }

        public function get notifications():_SafeStr_2081
        {
            return (_notifications);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function send(_arg_1:IMessageComposer):void
        {
            communication.connection.send(_arg_1);
        }

        public function isTrackerVisible():Boolean
        {
            return (_SafeStr_3955.questTracker.isVisible());
        }

        public function getQuestRowTitle(_arg_1:_SafeStr_1607):String
        {
            var _local_2:String = ((_arg_1.waitPeriodSeconds < 1) ? (_arg_1.getQuestLocalizationKey() + ".name") : "quests.list.questdelayed");
            return (_localization.getLocalization(_local_2, _local_2));
        }

        public function getQuestName(_arg_1:_SafeStr_1607):String
        {
            var _local_2:String = (_arg_1.getQuestLocalizationKey() + ".name");
            return (_localization.getLocalization(_local_2, _local_2));
        }

        public function getQuestDesc(_arg_1:_SafeStr_1607):String
        {
            var _local_2:String = (_arg_1.getQuestLocalizationKey() + ".desc");
            return (_localization.getLocalization(_local_2, _local_2));
        }

        public function getQuestHint(_arg_1:_SafeStr_1607):String
        {
            var _local_2:String = (_arg_1.getQuestLocalizationKey() + ".hint");
            return (_localization.getLocalization(_local_2, _local_2));
        }

        public function getActivityPointName(_arg_1:int):String
        {
            var _local_2:String = ("achievements.activitypoint." + _arg_1);
            return (_localization.getLocalization(_local_2, _local_2));
        }

        public function getCampaignNameByCode(_arg_1:String):String
        {
            var _local_2:String = (_arg_1 + ".name");
            return (_localization.getLocalization(_local_2, _local_2));
        }

        public function getCampaignName(_arg_1:_SafeStr_1607):String
        {
            return (getCampaignNameByCode(_arg_1.getCampaignLocalizationKey()));
        }

        public function getAchievementCategoryName(_arg_1:String):String
        {
            var _local_2:String = (("quests." + _arg_1) + ".name");
            return (_localization.getLocalization(_local_2, _local_2));
        }

        public function setupQuestImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1607):void
        {
            var _local_3:IStaticBitmapWrapperWindow = (_arg_1.findChildByName("quest_pic_bitmap") as IStaticBitmapWrapperWindow);
            var _local_4:String = ((_arg_2.waitPeriodSeconds > 0) ? "quest_timer_questionmark" : ((((_arg_2.campaignCode + "_") + _arg_2.localizationCode) + _arg_2.imageVersion) + ((isQuestWithPrompts(_arg_2)) ? "_a" : "")).toLowerCase());
            _local_3.assetUri = (("${image.library.questing.url}" + _local_4) + ".png");
        }

        public function setupPromptFrameImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1607, _arg_3:String):void
        {
            var _local_4:IStaticBitmapWrapperWindow = (_arg_1.findChildByName(("prompt_pic_" + _arg_3)) as IStaticBitmapWrapperWindow);
            _local_4.assetUri = (("${image.library.questing.url}" + (((((_arg_2.campaignCode + "_") + _arg_2.localizationCode) + _arg_2.imageVersion) + "_") + _arg_3).toLowerCase()) + ".png");
        }

        public function setupRewardImage(_arg_1:_SafeStr_3133, _arg_2:int):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.findChildByName("currency_icon");
            _local_3.style = _SafeStr_3226.getIconStyleFor(_arg_2, this, true);
        }

        public function setupCampaignImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1607, _arg_3:Boolean):void
        {
            var _local_4:IStaticBitmapWrapperWindow = (_arg_1.findChildByName("campaign_pic_bitmap") as IStaticBitmapWrapperWindow);
            if (!_arg_3)
            {
                _local_4.visible = false;
                return;
            };
            _local_4.visible = true;
            var _local_5:String = _arg_2.campaignCode;
            if (isSeasonalQuest(_arg_2))
            {
                _local_5 = (getSeasonalCampaignCodePrefix() + "_campaign_icon");
            };
            _local_4.assetUri = (("${image.library.questing.url}" + _local_5) + ".png");
        }

        public function setupAchievementCategoryImage(_arg_1:_SafeStr_3133, _arg_2:AchievementCategory, _arg_3:Boolean):void
        {
            var _local_4:IStaticBitmapWrapperWindow = (_arg_1.findChildByName("category_pic_bitmap") as IStaticBitmapWrapperWindow);
            _local_4.assetUri = (("${image.library.questing.url}" + ((_arg_3) ? ("ach_category_" + _arg_2.code) : ("achicon_" + _arg_2.code))) + ".png");
        }

        public function isQuestWithPrompts(_arg_1:_SafeStr_1607):Boolean
        {
            return (_SafeStr_3957.indexOf(_arg_1.localizationCode) > -1);
        }

        public function refreshReward(_arg_1:Boolean, _arg_2:_SafeStr_3133, _arg_3:int, _arg_4:int):void
        {
            _arg_1 = (((_arg_3 < 0) || (_arg_4 < 1)) ? false : _arg_1);
            var _local_5:_SafeStr_3109 = _arg_2.findChildByName("reward_caption_txt");
            var _local_6:_SafeStr_3109 = _arg_2.findChildByName("reward_amount_txt");
            var _local_7:_SafeStr_3109 = _arg_2.findChildByName("currency_icon");
            _local_6.visible = _arg_1;
            _local_5.visible = _arg_1;
            _local_7.visible = _arg_1;
            if (!_arg_1)
            {
                return;
            };
            _local_6.caption = ("" + _arg_4);
            moveChildrenToRow(_arg_2, ["reward_caption_txt", "reward_amount_txt", "currency_icon"], _local_5.x, 3);
            this.setupRewardImage(_arg_2, _arg_3);
        }

        public function update(_arg_1:uint):void
        {
            _SafeStr_3955.update(_arg_1);
            _SafeStr_3952.update(_arg_1);
        }

        public function getTwinkleAnimation(_arg_1:_SafeStr_3133):Animation
        {
            var _local_3:int;
            if (_SafeStr_3953 == null)
            {
                _SafeStr_3953 = new TwinkleImages(this);
            };
            var _local_4:* = 800;
            var _local_2:Animation = new Animation(_SafeStr_3264(_arg_1.findChildByName("twinkle_bitmap")));
            _local_3 = 0;
            while (_local_3 < 15)
            {
                _local_2.addObject(new Twinkle(_SafeStr_3953, _local_4));
                _local_4 = (_local_4 + 300);
                _local_3++;
            };
            return (_local_2);
        }

        public function get currentlyInRoom():Boolean
        {
            return (_currentlyInRoom);
        }

        public function set currentlyInRoom(_arg_1:Boolean):void
        {
            _currentlyInRoom = _arg_1;
        }

        public function isSeasonalCalendarEnabled():Boolean
        {
            return (_configuration.getBoolean("seasonalQuestCalendar.enabled"));
        }

        public function isSeasonalQuest(_arg_1:_SafeStr_1607):Boolean
        {
            var _local_2:String = getSeasonalCampaignCodePrefix();
            return ((!(_local_2 == "")) && (_arg_1.campaignCode.indexOf(_local_2) == 0));
        }

        public function getSeasonalCampaignCodePrefix():String
        {
            return (getProperty("seasonalQuestCalendar.campaignPrefix"));
        }

        public function setIsFirstLoginOfDay(_arg_1:Boolean):void
        {
            this._SafeStr_7342 = _arg_1;
        }

        public function get isFirstLoginOfDay():Boolean
        {
            return (this._SafeStr_7342);
        }

        public function get configuration():_SafeStr_19
        {
            return (_configuration);
        }

        public function hasLocalizedValue(_arg_1:String):Boolean
        {
            return (!(_localization.getLocalization(_arg_1, "") == ""));
        }

        public function get navigator():IHabboNewNavigator
        {
            return (_navigator);
        }

        public function requestSeasonalQuests():void
        {
            send(new _SafeStr_456());
        }

        public function requestQuests():void
        {
            send(new _SafeStr_545());
        }

        public function activateQuest(_arg_1:int):void
        {
            send(new _SafeStr_410(_arg_1));
        }

        public function get linkPattern():String
        {
            return ("questengine/");
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
                case "gotorooms":
                    goToQuestRooms();
                    return;
                case "achievements":
                    if (_local_2.length == 3)
                    {
                        _SafeStr_3952.show();
                        _SafeStr_3952.selectCategoryInternalLink(_local_2[2]);
                    }
                    else
                    {
                        showAchievements();
                    };
                    return;
                case "calendar":
                    _SafeStr_3955.seasonalCalendarWindow.onToolbarClick();
                    return;
                case "quests":
                    _SafeStr_3955.onToolbarClick();
                    return;
                default:
                    _SafeStr_14.log(("QuestEngine unknown link-type received: " + _local_2[1]));
                    return;
            };
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2046 = "_-y13" (String#3747, DoABC#4)
// _SafeStr_2081 = "_-TA" (String#4559, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3226 = "_-G14" (String#4868, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3757 = "_-iH" (String#1838, DoABC#4)
// _SafeStr_3952 = "_-K9" (String#4605, DoABC#4)
// _SafeStr_3953 = "_-o1s" (String#4824, DoABC#4)
// _SafeStr_3954 = "_-m11" (String#9528, DoABC#4)
// _SafeStr_3955 = "_-jm" (String#8671, DoABC#4)
// _SafeStr_3956 = "_-c1v" (String#13981, DoABC#4)
// _SafeStr_3957 = "_-t1F" (String#18747, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_410 = "_-51e" (String#9595, DoABC#4)
// _SafeStr_456 = "_-n1E" (String#29637, DoABC#4)
// _SafeStr_545 = "_-32" (String#22396, DoABC#4)
// _SafeStr_7342 = "_-8X" (String#24412, DoABC#4)
// _SafeStr_8705 = "_-r1i" (String#41032, DoABC#4)


