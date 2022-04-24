// by nota

//com.sulake.habbo.catalog.clubcenter.HabboClubCenter

package com.sulake.habbo.catalog.clubcenter
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.catalog.offers.IOfferExtension;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.offers.IOfferCenter;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-W1K._SafeStr_1632;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboToolbar;
    import _-AE._SafeStr_842;
    import _-W1K._SafeStr_347;
    import _-a2._SafeStr_495;
    import _-NF._SafeStr_1436;
    import flash.utils.getTimer;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import _-Ad._SafeStr_1106;
    import com.sulake.habbo.catalog.clubcenter.util.BadgeResolver;
    import _-i1z._SafeStr_600;
    import _-q1n._SafeStr_709;
    import _-XO._SafeStr_336;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;
    import flash.display.Stage;

    public class HabboClubCenter extends Component implements ILinkEventTracker, IOfferExtension 
    {

        private static const USE_FAKE_DATA:Boolean = false;
        private static const DATA_UPDATE_INTERVAL_MSEC:int = 10000;

        private var _communicationManager:IHabboCommunicationManager;
        private var _localizationManager:_SafeStr_18;
        private var _sessionDataManager:ISessionDataManager;
        private var _avatarRenderManager:_SafeStr_1701;
        private var _windowManager:_SafeStr_1695;
        private var _catalog:IHabboCatalog;
        private var _toolbar:IHabboToolbar;
        private var _offerCenter:IOfferCenter;
        private var _SafeStr_5203:Boolean = false;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _SafeStr_3882:ClubCenterView;
        private var _SafeStr_5204:ClubSpecialInfoBubbleView;
        private var _SafeStr_3740:_SafeStr_1632;
        private var _SafeStr_5206:int = -10000;
        private var _SafeStr_5205:Boolean = false;
        private var _SafeStr_4615:String;
        private var _SafeStr_4980:int;
        private var _SafeStr_4985:Vector.<_SafeStr_24>;

        public function HabboClubCenter(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communicationManager = _arg_1;
            }, true), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarRenderManager = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localizationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _messageEvents = new Vector.<IMessageEvent>(0);
            addMessageEvent(new _SafeStr_842(onClubGiftInfo));
            addMessageEvent(new _SafeStr_347(onKickbackInfoMessageEvent));
            addMessageEvent(new _SafeStr_495(onBadges));
            context.addLinkEventTracker(this);
            if (((getBoolean("offers.enabled")) && (getBoolean("offers.habboclub.enabled"))))
            {
                _offerCenter = catalog.getOfferCenter(this);
            };
        }

        override public function dispose():void
        {
            if (((!(_messageEvents == null)) && (!(_communicationManager == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _communicationManager.removeHabboConnectionMessageEvent(_local_1);
                };
            };
            if (((!(_sessionDataManager == null)) && (_sessionDataManager.events)))
            {
                _sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY", onBadgeReady);
            };
            if (_offerCenter != null)
            {
                _offerCenter = null;
            };
            removeView();
            _SafeStr_3740 = null;
            _messageEvents = null;
            super.dispose();
        }

        public function get linkPattern():String
        {
            return ("habboUI/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length < 3)
            {
                return;
            };
            if (_local_2[1] == "open")
            {
                switch (_local_2[2])
                {
                    case "hccenter":
                        showClubCenter();
                        return;
                };
            };
        }

        private function showClubCenter():void
        {
            if (!_SafeStr_3882)
            {
                _SafeStr_3882 = new ClubCenterView(this, _windowManager, _sessionDataManager.figure);
            };
            if (updateNeeded())
            {
                updateData();
            }
            else
            {
                populate();
            };
            if ((((_offerCenter) && (_SafeStr_3882)) && (_SafeStr_5203)))
            {
                _SafeStr_5203 = false;
                indicateVideoAvailable(true);
            };
        }

        public function removeView():void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            removeBreakdown();
            _SafeStr_5205 = false;
        }

        public function removeBreakdown():void
        {
            if (_SafeStr_5204)
            {
                _SafeStr_5204.dispose();
                _SafeStr_5204 = null;
            };
        }

        private function addMessageEvent(_arg_1:IMessageEvent):void
        {
            if (!_communicationManager)
            {
                return;
            };
            _messageEvents.push(_communicationManager.addHabboConnectionMessageEvent(_arg_1));
        }

        private function onKickbackInfoMessageEvent(_arg_1:_SafeStr_347):void
        {
            var _local_2:_SafeStr_1436 = _arg_1.getParser();
            _SafeStr_3740 = _local_2.data;
            _SafeStr_5205 = false;
            _SafeStr_5206 = getTimer();
            populate();
        }

        private function onClubGiftInfo(_arg_1:_SafeStr_842):void
        {
            _SafeStr_4980 = _arg_1.getParser().giftsAvailable;
            populate();
        }

        private function onBadgeReady(_arg_1:BadgeImageReadyEvent):void
        {
            if (((!(_arg_1.badgeId == _SafeStr_4615)) || (!(_sessionDataManager))))
            {
                return;
            };
            _sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY", onBadgeReady);
            populate();
        }

        public function onBadges(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_1106 = (_arg_1 as _SafeStr_495).getParser();
            if (_SafeStr_4985 == null)
            {
                _SafeStr_4985 = new Vector.<_SafeStr_24>(_local_3.totalFragments, true);
            };
            var _local_4:_SafeStr_24 = new _SafeStr_24();
            _local_4.concatenate(_local_3.currentFragment);
            var _local_2:_SafeStr_24 = addMessageFragment(_local_4, _local_3.totalFragments, _local_3.fragmentNo, _SafeStr_4985);
            if (!_local_2)
            {
                return;
            };
            _SafeStr_4985 = null;
            _SafeStr_4615 = BadgeResolver.resolveClubBadgeId(_local_2.getKeys());
        }

        private function updateNeeded():Boolean
        {
            return ((!(_SafeStr_5205)) && ((getTimer() - _SafeStr_5206) > 10000));
        }

        private function updateData():void
        {
            _SafeStr_5205 = true;
            _communicationManager.connection.send(new _SafeStr_600());
            _communicationManager.connection.send(new _SafeStr_709());
            _communicationManager.connection.send(new _SafeStr_336());
            return;
            _SafeStr_3740 = new _SafeStr_1632();
            populate();
        }

        private function populate():void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dataReceived(_SafeStr_3740, getPurse(), getGiftsAvailable(), BadgeResolver.resolveBadgeBitmap(_SafeStr_4615, onBadgeReady, _sessionDataManager));
            };
        }

        private function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        private function getPurse():_SafeStr_3142
        {
            return ((catalog != null) ? catalog.getPurse() : null);
        }

        private function getGiftsAvailable():int
        {
            return (_SafeStr_4980);
        }

        public function get localization():_SafeStr_18
        {
            return ((catalog != null) ? catalog.localization : null);
        }

        public function get avatarRenderManager():_SafeStr_1701
        {
            return (_avatarRenderManager);
        }

        public function resolveClubStatus():String
        {
            if (!catalog)
            {
                return ("none");
            };
            var _local_1:_SafeStr_3142 = getPurse();
            if (_local_1.clubDays > 0)
            {
                return ("active");
            };
            if (((_local_1.pastClubDays > 0) || (_local_1.pastVipDays > 0)))
            {
                return ("expired");
            };
            return ("none");
        }

        public function openPurchasePage():void
        {
            if (catalog)
            {
                catalog.openCatalogPage("hc_membership", "NORMAL");
            };
        }

        public function openClubGiftPage():void
        {
            if (catalog)
            {
                catalog.openCatalogPage("club_gifts", "NORMAL");
            };
        }

        public function showPaydayBreakdownView():void
        {
            if (_SafeStr_5204)
            {
                removeBreakdown();
                return;
            };
            _SafeStr_5204 = new ClubSpecialInfoBubbleView(this, _windowManager, _SafeStr_3740, _SafeStr_3882.getSpecialCalloutAnchor());
        }

        public function openPaydayHelpPage():void
        {
            context.createLinkEvent("habbopages/hcpayday");
        }

        public function openHelpPage():void
        {
            context.createLinkEvent("habbopages/habboclub");
        }

        public function processHotelLink(_arg_1:String):void
        {
            context.createLinkEvent(_arg_1);
        }

        public function isKickbackEnabled():Boolean
        {
            var _local_1:String = getProperty("hccenter.activity.enabled");
            if (((_local_1 == null) || (_local_1 == "")))
            {
                return (true);
            };
            return ((_local_1 == "1") || (_local_1 == "true"));
        }

        public function get stage():Stage
        {
            return (((context) && (context.displayObjectContainer)) ? context.displayObjectContainer.stage : null);
        }

        public function getOffers():void
        {
            _catalog.getHabboClubOffers(3);
        }

        public function get offerCenter():IOfferCenter
        {
            return (_offerCenter);
        }

        public function indicateRewards():void
        {
        }

        public function indicateVideoAvailable(_arg_1:Boolean):void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.setVideoOfferButtonVisibility(_arg_1, ((!(_offerCenter == null)) && (!(_offerCenter.showingVideo))));
            }
            else
            {
                _SafeStr_5203 = _arg_1;
            };
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
}//package com.sulake.habbo.catalog.clubcenter

// _SafeStr_1106 = "_-WU" (String#29046, DoABC#4)
// _SafeStr_1436 = "_-f1A" (String#37867, DoABC#4)
// _SafeStr_1632 = "_-q1C" (String#13728, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_336 = "_-W18" (String#31409, DoABC#4)
// _SafeStr_347 = "_-S16" (String#27017, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4615 = "_-91W" (String#2170, DoABC#4)
// _SafeStr_495 = "_-hc" (String#9010, DoABC#4)
// _SafeStr_4980 = "_-E1z" (String#6816, DoABC#4)
// _SafeStr_4985 = "_-p1B" (String#5252, DoABC#4)
// _SafeStr_5203 = "_-t1z" (String#13369, DoABC#4)
// _SafeStr_5204 = "_-kh" (String#8778, DoABC#4)
// _SafeStr_5205 = "_-X1Y" (String#9481, DoABC#4)
// _SafeStr_5206 = "_-hf" (String#19084, DoABC#4)
// _SafeStr_600 = "_-1p" (String#22394, DoABC#4)
// _SafeStr_709 = "_-Lt" (String#18881, DoABC#4)
// _SafeStr_842 = "_-ep" (String#13569, DoABC#4)


