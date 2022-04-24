// by nota

//com.sulake.habbo.friendbar.talent.HabboTalent

package com.sulake.habbo.friendbar.talent
{
    import com.sulake.habbo.friendbar.view.AbstractView;
    import com.sulake.habbo.friendbar.IHabboTalent;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.avatar._SafeStr_1758;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboAvatarEditor;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.window.utils.IModalDialog;
    import _-t1I._SafeStr_1677;
    import _-f1P._SafeStr_953;

    public class HabboTalent extends AbstractView implements IHabboTalent, ILinkEventTracker 
    {

        private var _talentTrack:TalentTrackController;
        private var _talentLevelUp:TalentLevelUpController;
        private var _talentPromo:TalentPromoCtrl;
        private var _citizenshipPopup:CitizenshipPopupController;
        private var _communicationManager:IHabboCommunicationManager;
        private var _habboHelp:IHabboHelp;
        private var _navigator:_SafeStr_1696;
        private var _toolbar:IHabboToolbar;
        private var _avatarEditor:_SafeStr_1758;

        public function HabboTalent(_arg_1:_SafeStr_31, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public function get communicationManager():IHabboCommunicationManager
        {
            return (_communicationManager);
        }

        public function get localizationManager():_SafeStr_18
        {
            return (_localizationManager);
        }

        public function get sessionManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get tracking():_SafeStr_1704
        {
            return (_tracking);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get habboHelp():IHabboHelp
        {
            return (_habboHelp);
        }

        public function get navigator():_SafeStr_1696
        {
            return (_navigator);
        }

        public function get habboTalentEnabled():Boolean
        {
            return (getBoolean("talent.track.enabled"));
        }

        public function get citizenshipEnabled():Boolean
        {
            return (getBoolean("talent.track.citizenship.enabled"));
        }

        public function get newUserTourEnabled():Boolean
        {
            return (getBoolean("guide.help.new.user.tour.enabled"));
        }

        public function get newIdentity():Boolean
        {
            return (getInteger("new.identity", 0) > 0);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function get avatarEditor():_SafeStr_1758
        {
            return (_avatarEditor);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communicationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboHelp(), function (_arg_1:IHabboHelp):void
            {
                _habboHelp = _arg_1;
            }), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _navigator = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }), new ComponentDependency(new IIDHabboAvatarEditor(), function (_arg_1:_SafeStr_1758):void
            {
                _avatarEditor = _arg_1;
            })]));
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_talentLevelUp)
                {
                    _talentLevelUp.dispose();
                    _talentLevelUp = null;
                };
                if (_talentTrack)
                {
                    _talentTrack.dispose();
                    _talentTrack = null;
                };
                if (_talentPromo)
                {
                    _talentPromo.dispose();
                    _talentPromo = null;
                };
                if (_citizenshipPopup != null)
                {
                    _citizenshipPopup.dispose();
                    _citizenshipPopup = null;
                };
                context.removeLinkEventTracker(this);
                super.dispose();
            };
        }

        override protected function initComponent():void
        {
            if (!habboTalentEnabled)
            {
                return;
            };
            _talentTrack = new TalentTrackController(this);
            _talentLevelUp = new TalentLevelUpController(this);
            _talentPromo = new TalentPromoCtrl(this);
            if (citizenshipEnabled)
            {
                _citizenshipPopup = new CitizenshipPopupController(this);
            };
            context.addLinkEventTracker(this);
            _talentTrack.initialize();
            _talentLevelUp.initialize();
            _talentPromo.initialize();
        }

        public function send(_arg_1:IMessageComposer):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(_arg_1);
            };
        }

        public function getXmlWindow(_arg_1:String, _arg_2:uint=1):_SafeStr_3109
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:_SafeStr_3109;
            try
            {
                _local_5 = assets.getAssetByName((_arg_1 + "_xml"));
                _local_3 = XmlAsset(_local_5);
                _local_4 = _windowManager.buildFromXML(XML(_local_3.content), _arg_2);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboTalent", (((((("Failed to build window " + _arg_1) + "_xml, ") + _local_5) + ", ") + _windowManager) + "!"));
                throw (e);
            };
            return (_local_4);
        }

        public function getModalXmlWindow(_arg_1:String):IModalDialog
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:IModalDialog;
            try
            {
                _local_4 = assets.getAssetByName((_arg_1 + "_xml"));
                _local_2 = XmlAsset(_local_4);
                _local_3 = _windowManager.buildModalDialogFromXML(XML(_local_2.content));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboTalent", (((((("Failed to build window " + _arg_1) + "_xml, ") + _local_4) + ", ") + _windowManager) + "!"));
                throw (e);
            };
            return (_local_3);
        }

        public function testLevelUp(_arg_1:String, _arg_2:_SafeStr_1677):void
        {
            _talentLevelUp.showWindow(_arg_1, _arg_2.level, _arg_2.rewardPerks, _arg_2.rewardProducts);
        }

        public function get linkPattern():String
        {
            return ("talent/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_3:* = null;
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
                        _local_3 = _local_2[2];
                        switch (_local_3)
                        {
                            case "citizenship":
                                _tracking.trackTalentTrackOpen("citizenship", "citizenshiplink");
                                send(new _SafeStr_953("citizenship"));
                                break;
                            case "helper":
                                _tracking.trackTalentTrackOpen("helper", "helperlink");
                                send(new _SafeStr_953("helper"));
                        };
                    };
                    return;
                default:
                    _SafeStr_14.log(("Catalog unknown link-type receive: " + _local_2[1]));
                    return;
            };
        }


    }
}//package com.sulake.habbo.friendbar.talent

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1677 = "_-N15" (String#12791, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_1758 = "_-Y5" (String#3968, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_953 = "_-a1w" (String#3282, DoABC#4)


