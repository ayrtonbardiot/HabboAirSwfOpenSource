// by nota

//com.sulake.habbo.groups.HabboGroupsManager

package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.session.ISessionDataManager;
    import _-W1K._SafeStr_1216;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboNewNavigator;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboTracking;
    import _-W1K._SafeStr_149;
    import _-W1K._SafeStr_221;
    import _-W1K._SafeStr_780;
    import _-W1K._SafeStr_233;
    import _-W1K._SafeStr_932;
    import _-W1K._SafeStr_122;
    import _-W1K._SafeStr_227;
    import _-W1K._SafeStr_785;
    import _-Ol._SafeStr_484;
    import _-y1x._SafeStr_605;
    import _-W1K._SafeStr_418;
    import _-W1K._SafeStr_131;
    import _-Ja._SafeStr_843;
    import _-W1K._SafeStr_307;
    import _-W1K._SafeStr_990;
    import _-W1K._SafeStr_740;
    import _-yL._SafeStr_528;
    import _-W1K._SafeStr_241;
    import _-W1K._SafeStr_852;
    import _-W1K._SafeStr_797;
    import _-W1K._SafeStr_386;
    import _-W1K._SafeStr_260;
    import _-W1K._SafeStr_169;
    import _-W1K._SafeStr_631;
    import _-Ja._SafeStr_748;
    import _-qv._SafeStr_895;
    import _-XO._SafeStr_197;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import _-W1K._SafeStr_1123;
    import _-W1K._SafeStr_1479;
    import _-W1K._SafeStr_1121;
    import _-W1K._SafeStr_1109;
    import _-61T._SafeStr_1254;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.groups.events.HabboGroupsEditorData;
    import _-K1r._SafeStr_1185;
    import _-31H._SafeStr_1512;
    import _-W1K._SafeStr_1171;
    import _-W1K._SafeStr_1135;
    import _-XO._SafeStr_854;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import _-NF._SafeStr_1274;
    import _-31H._SafeStr_1082;
    import _-XO._SafeStr_141;
    import _-XO._SafeStr_313;
    import _-XO._SafeStr_909;

    public class HabboGroupsManager extends Component implements _SafeStr_1757, ILinkEventTracker 
    {

        public static const GROUPS_TRACKING_CATEGORY:String = "HabboGroups";

        private var _communication:IHabboCommunicationManager;
        private var _windowManager:_SafeStr_1695;
        private var _localization:_SafeStr_18;
        private var _navigator:_SafeStr_1696;
        private var _newNavigator:IHabboNewNavigator;
        private var _friendlist:_SafeStr_1874;
        private var _catalog:IHabboCatalog;
        private var _toolbar:IHabboToolbar;
        private var _habboTracking:_SafeStr_1704;
        private var _sessionDataManager:ISessionDataManager;
        private var _SafeStr_3904:DetailsWindowCtrl;
        private var _SafeStr_3903:GuildMembersWindowCtrl;
        private var _SafeStr_3905:GuildManagementWindowCtrl;
        private var _SafeStr_3906:ExtendedProfileWindowCtrl;
        private var _SafeStr_3907:HcRequiredWindowCtrl;
        private var _SafeStr_3908:GroupCreatedWindowCtrl;
        private var _SafeStr_3909:GroupRoomInfoCtrl;
        private var _SafeStr_3912:_SafeStr_1216;
        private var _SafeStr_3911:int;
        private var _SafeStr_3693:int;
        private var _SafeStr_3913:Boolean;
        private var _SafeStr_3910:GuildKickData;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function HabboGroupsManager(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3904 = new DetailsWindowCtrl(this);
            _SafeStr_3903 = new GuildMembersWindowCtrl(this);
            _SafeStr_3905 = new GuildManagementWindowCtrl(this);
            _SafeStr_3906 = new ExtendedProfileWindowCtrl(this);
            _SafeStr_3907 = new HcRequiredWindowCtrl(this);
            _SafeStr_3908 = new GroupCreatedWindowCtrl(this);
            _SafeStr_3909 = new GroupRoomInfoCtrl(this);
            _SafeStr_14.log(("HabboGroupsManager initialized: " + _arg_3));
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _navigator = _arg_1;
            }), new ComponentDependency(new IIDHabboNewNavigator(), function (_arg_1:IHabboNewNavigator):void
            {
                _newNavigator = _arg_1;
            }), new ComponentDependency(new IIDHabboFriendList(), function (_arg_1:_SafeStr_1874):void
            {
                _friendlist = _arg_1;
            }), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _habboTracking = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _messageEvents = new Vector.<IMessageEvent>(0);
            addMessageEvent(new _SafeStr_149(onGroupDetailsChanged));
            addMessageEvent(new _SafeStr_221(_SafeStr_3903.onGuildMembers));
            addMessageEvent(new _SafeStr_780(onGuildEditFailed));
            addMessageEvent(new _SafeStr_233(onGuildEditInfo));
            addMessageEvent(new _SafeStr_932(onExtendedProfile));
            addMessageEvent(new _SafeStr_122(onGuildEditorData));
            addMessageEvent(new _SafeStr_227(onJoinFailed));
            addMessageEvent(new _SafeStr_785(onGroupDetails));
            addMessageEvent(new _SafeStr_484(onRoomEnter));
            addMessageEvent(new _SafeStr_605(onRoomLeave));
            addMessageEvent(new _SafeStr_418(onRelationshipStatusInfo));
            addMessageEvent(new _SafeStr_131(onExtendedProfileChanged));
            addMessageEvent(new _SafeStr_843(onRoomInfo));
            addMessageEvent(new _SafeStr_307(_SafeStr_3903.onGuildMembershipUpdated));
            addMessageEvent(new _SafeStr_990(onSubscriptionInfo));
            addMessageEvent(new _SafeStr_740(onGuildCreated));
            addMessageEvent(new _SafeStr_528(onUserObject));
            addMessageEvent(new _SafeStr_241(onGroupDeactivated));
            addMessageEvent(new _SafeStr_852(_SafeStr_3903.onMembershipRequested));
            addMessageEvent(new _SafeStr_797(onUserBadgesMessage));
            addMessageEvent(new _SafeStr_386(onKickConfirmation));
            addMessageEvent(new _SafeStr_260(onGuildCreationInfo));
            addMessageEvent(new _SafeStr_169(_SafeStr_3903.onGuildMembershipRejected));
            addMessageEvent(new _SafeStr_631(_SafeStr_3903.onGuildMemberMgmtFailed));
            addMessageEvent(new _SafeStr_748(onFlatCreated));
            context.addLinkEventTracker(this);
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
            if (((!(_messageEvents == null)) && (!(_communication == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _communication.removeHabboConnectionMessageEvent(_local_1);
                };
                _messageEvents = null;
            };
            if (_SafeStr_3904)
            {
                _SafeStr_3904.dispose();
                _SafeStr_3904 = null;
            };
            if (_SafeStr_3903)
            {
                _SafeStr_3903.dispose();
                _SafeStr_3903 = null;
            };
            if (_SafeStr_3905)
            {
                _SafeStr_3905.dispose();
                _SafeStr_3905 = null;
            };
            if (_SafeStr_3906)
            {
                _SafeStr_3906.dispose();
                _SafeStr_3906 = null;
            };
            if (_SafeStr_3907)
            {
                _SafeStr_3907.dispose();
                _SafeStr_3907 = null;
            };
            if (_SafeStr_3908)
            {
                _SafeStr_3908.dispose();
                _SafeStr_3908 = null;
            };
            if (_SafeStr_3909)
            {
                _SafeStr_3909.dispose();
                _SafeStr_3909 = null;
            };
            super.dispose();
        }

        public function get linkPattern():String
        {
            return ("group/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length != 2)
            {
                return;
            };
            var _local_3:int = _local_2[1];
            openGroupInfo(_local_3);
        }

        public function showGroupBadgeInfo(_arg_1:Boolean, _arg_2:int):void
        {
            openGroupInfo(_arg_2);
            send(new _SafeStr_895("HabboGroups", ("" + _arg_2), "badge clicked"));
        }

        public function openGroupInfo(_arg_1:int):void
        {
            send(new _SafeStr_197(_arg_1, true));
        }

        public function send(_arg_1:IMessageComposer):void
        {
            _communication.connection.send(_arg_1);
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

        public function openGroupForum(_arg_1:int):void
        {
            context.createLinkEvent(("groupforum/" + _arg_1));
        }

        private function onGroupDeactivated(_arg_1:IMessageEvent):void
        {
            var _local_2:int = _SafeStr_241(_arg_1).groupId;
            _SafeStr_3904.onGroupDeactivated(_local_2);
            _SafeStr_3909.onGroupDeactivated(_local_2);
        }

        private function onGroupDetails(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1123 = _SafeStr_785(_arg_1).data;
            _SafeStr_3904.onGroupDetails(_local_2);
            _SafeStr_3906.onGroupDetails(_local_2);
            _SafeStr_3909.onGroupDetails(_local_2);
        }

        private function onExtendedProfile(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1479 = _SafeStr_932(_arg_1).data;
            if (_local_2.openProfileWindow)
            {
                _SafeStr_3906.badgeUpdateExpected = true;
                _SafeStr_3906.relationshipUpdateExpected = true;
                _SafeStr_3906.onProfile(_local_2);
            };
        }

        private function onExtendedProfileChanged(_arg_1:IMessageEvent):void
        {
            var _local_2:int = _SafeStr_131(_arg_1).userId;
            _SafeStr_3906.onProfileChanged(_local_2);
        }

        private function onGroupDetailsChanged(_arg_1:IMessageEvent):void
        {
            var _local_2:int = _SafeStr_149(_arg_1).groupId;
            if (((_SafeStr_3904.isDisplayingGroup(_local_2)) || (_SafeStr_3909.isDisplayingGroup(_local_2))))
            {
                send(new _SafeStr_197(_local_2, false));
            };
        }

        private function onJoinFailed(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:int = _SafeStr_227(_arg_1).reason;
            if (_local_2 == 4)
            {
                _SafeStr_3907.show(false);
            }
            else
            {
                _local_3 = ("group.joinfail." + _local_2);
                _local_4 = _localization.getLocalization(_local_3, _local_3);
                _windowManager.alert("${group.joinfail.title}", _local_4, 0, onAlertClose);
            };
        }

        private function onGuildCreationInfo(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1121 = _SafeStr_260(_arg_1).data;
            _SafeStr_3905.onGuildCreationInfo(_local_2);
            requestGuildEditorData();
        }

        private function onGuildEditInfo(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1109 = _SafeStr_233(_arg_1).data;
            _SafeStr_3905.onGuildEditInfo(_local_2);
            requestGuildEditorData();
        }

        private function onRoomLeave(_arg_1:IMessageEvent):void
        {
            _SafeStr_3904.close();
            _SafeStr_3909.close();
        }

        private function onRoomEnter(_arg_1:IMessageEvent):void
        {
            _SafeStr_3904.close();
            _SafeStr_3909.close();
            var _local_2:_SafeStr_1254 = _SafeStr_484(_arg_1).getParser();
            _SafeStr_3693 = _local_2.guestRoomId;
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        private function onGuildEditorData(_arg_1:IMessageEvent):void
        {
            _SafeStr_3912 = _SafeStr_122(_arg_1).data;
            events.dispatchEvent(new HabboGroupsEditorData());
        }

        private function onGuildEditFailed(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:int = _SafeStr_780(_arg_1).reason;
            if (_local_2 == 2)
            {
                _SafeStr_3907.show(true);
            }
            else
            {
                _local_3 = ("group.edit.fail." + _local_2);
                _local_4 = _localization.getLocalization(_local_3, _local_3);
                _windowManager.alert("${group.edit.fail.title}", _local_4, 0, onAlertClose);
            };
        }

        private function onUserObject(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1185 = _SafeStr_528(_arg_1).getParser();
            _SafeStr_3911 = _local_2.id;
        }

        private function onFlatCreated(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1512 = _SafeStr_748(_arg_1).getParser();
            _SafeStr_3905.onFlatCreated(_local_2.flatId, _local_2.flatName);
        }

        private function onGuildCreated(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_740 = _SafeStr_740(_arg_1);
            _SafeStr_3908.show(_local_2.groupId);
            _SafeStr_3905.close();
            _SafeStr_3909.expectedGroupId = _local_2.groupId;
            if (_SafeStr_3693 != _local_2.baseRoomId)
            {
                _navigator.goToPrivateRoom(_local_2.baseRoomId);
            };
        }

        private function onKickConfirmation(_arg_1:IMessageEvent):void
        {
            var _local_4:int = _SafeStr_386(_arg_1).userId();
            var _local_6:int = _SafeStr_386(_arg_1).furniCount();
            var _local_5:_SafeStr_1171;
            var _local_2:_SafeStr_1135 = _SafeStr_3903.data;
            var _local_3:String = ((_SafeStr_3910.targetBlocked) ? "group.block" : "group.kick");
            if (_local_6 > 0)
            {
                if (_local_4 == _SafeStr_3911)
                {
                    localization.registerParameter("group.leaveconfirm.desc", "amount", _local_6.toString());
                    _windowManager.confirm("${group.leaveconfirm.title}", "${group.leaveconfirm.desc}", 0, onKickConfirmationClose);
                }
                else
                {
                    _local_5 = _local_2.getUser(_local_4);
                    localization.registerParameter((_local_3 + "confirm.desc"), "amount", _local_6.toString());
                    localization.registerParameter((_local_3 + "confirm.desc"), "user", _local_5.userName);
                    _windowManager.confirm((("${" + _local_3) + "confirm.title}"), (("${" + _local_3) + "confirm.desc}"), 0, onKickConfirmationClose);
                };
            }
            else
            {
                if (_local_4 == _SafeStr_3911)
                {
                    _windowManager.confirm("${group.leaveconfirm.title}", "${group.leaveconfirm_nofurni.desc}", 0, onKickConfirmationClose);
                }
                else
                {
                    if (_local_2)
                    {
                        _local_5 = _local_2.getUser(_local_4);
                        localization.registerParameter((_local_3 + "confirm_nofurni.desc"), "user", _local_5.userName);
                        _windowManager.confirm((("${" + _local_3) + "confirm.title}"), (("${" + _local_3) + "confirm_nofurni.desc}"), 0, onKickConfirmationClose);
                    };
                };
            };
        }

        private function onKickConfirmationClose(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            if ((((_arg_1 == null) || (_arg_1.disposed)) || (_SafeStr_3910 == null)))
            {
                _SafeStr_3910 = null;
                return;
            };
            _arg_1.dispose();
            if (_arg_2.type == "WE_OK")
            {
                send(new _SafeStr_854(_SafeStr_3910.kickGuildId, _SafeStr_3910.kickTargetId, _SafeStr_3910.targetBlocked));
            };
            _SafeStr_3910 = null;
        }

        private function onSubscriptionInfo(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1274 = _SafeStr_990(_arg_1).getParser();
            _SafeStr_3913 = ((_local_2.isVIP) && (_local_2.minutesUntilExpiration > 0));
            _SafeStr_3905.onSubscriptionChange();
        }

        private function onRoomInfo(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1082 = _SafeStr_843(_arg_1).getParser();
            if (_local_2.enterRoom)
            {
                _SafeStr_3909.onRoomInfo(_local_2.data);
            };
        }

        private function onRelationshipStatusInfo(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_418 = _SafeStr_418(_arg_1);
            _SafeStr_3906.onRelationshipStatusInfo(_local_2.userId, _local_2.relationshipStatusMap);
        }

        private function onUserBadgesMessage(_arg_1:_SafeStr_797):void
        {
            _SafeStr_3906.onUserBadges(_arg_1.userId, _arg_1.badges);
        }

        private function requestGuildEditorData():void
        {
            if (_SafeStr_3912 == null)
            {
                send(new _SafeStr_141());
            };
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get guildManagementWindowCtrl():GuildManagementWindowCtrl
        {
            return (_SafeStr_3905);
        }

        public function get groupRoomInfoCtrl():GroupRoomInfoCtrl
        {
            return (_SafeStr_3909);
        }

        public function get groupRoomInfoEnabled():Boolean
        {
            return (getBoolean("groupRoomInfo.enabled"));
        }

        public function get groupDeletionEnabled():Boolean
        {
            return (getBoolean("group.deletion.enabled"));
        }

        public function get groupRoomInfoBadgeEnabled():Boolean
        {
            return ((groupRoomInfoEnabled) && (getBoolean("groupRoomInfo.badge.enabled")));
        }

        public function get toolbarAttachEnabled():Boolean
        {
            return ((groupRoomInfoEnabled) && (getBoolean("groupRoomInfo.attach.enabled")));
        }

        public function get isActivityDisplayEnabled():Boolean
        {
            return (getBoolean("activity.point.display.enabled"));
        }

        public function get guildEditorData():_SafeStr_1216
        {
            return (_SafeStr_3912);
        }

        public function get avatarId():int
        {
            return (_SafeStr_3911);
        }

        public function get navigator():_SafeStr_1696
        {
            return (_newNavigator.legacyNavigator);
        }

        public function get friendlist():_SafeStr_1874
        {
            return (_friendlist);
        }

        public function get guildMembersWindowCtrl():GuildMembersWindowCtrl
        {
            return (_SafeStr_3903);
        }

        public function get habboTracking():_SafeStr_1704
        {
            return (_habboTracking);
        }

        public function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (_habboTracking != null)
            {
                _habboTracking.trackGoogle(_arg_1, _arg_2, _arg_3);
            };
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function updateVisibleExtendedProfile(_arg_1:int):void
        {
            _SafeStr_3906.updateVisibleExtendedProfile(_arg_1);
        }

        public function showExtendedProfile(_arg_1:int):void
        {
            send(new _SafeStr_313(_arg_1));
        }

        public function openCatalog(_arg_1:String):void
        {
            _catalog.openCatalogPage(_arg_1);
        }

        public function openVipPurchase(_arg_1:String):void
        {
            _catalog.openClubCenter();
        }

        public function get hasVip():Boolean
        {
            return (_SafeStr_3913);
        }

        public function handleUserKick(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_3910 = new GuildKickData(_arg_1, _arg_2);
            send(new _SafeStr_909(_arg_2, _arg_1));
        }

        public function handleUserBlock(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_3910 = new GuildKickData(_arg_1, _arg_2, true);
            send(new _SafeStr_909(_arg_2, _arg_1));
        }

        public function get newNavigator():IHabboNewNavigator
        {
            return (_newNavigator);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1082 = "_-51j" (String#11299, DoABC#4)
// _SafeStr_1109 = "_-81H" (String#29603, DoABC#4)
// _SafeStr_1121 = "_-C1Z" (String#29371, DoABC#4)
// _SafeStr_1123 = "_-r1M" (String#6272, DoABC#4)
// _SafeStr_1135 = "_-is" (String#18084, DoABC#4)
// _SafeStr_1171 = "_-rf" (String#7835, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1216 = "_-4R" (String#28472, DoABC#4)
// _SafeStr_122 = "_-h1w" (String#23346, DoABC#4)
// _SafeStr_1254 = "_-i1B" (String#10192, DoABC#4)
// _SafeStr_1274 = "_-I1o" (String#18905, DoABC#4)
// _SafeStr_131 = "_-Nj" (String#22983, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_141 = "_-e1H" (String#29425, DoABC#4)
// _SafeStr_1479 = "_-hd" (String#24156, DoABC#4)
// _SafeStr_149 = "_-k13" (String#10890, DoABC#4)
// _SafeStr_1512 = "_-71o" (String#27838, DoABC#4)
// _SafeStr_169 = "_-n1v" (String#20834, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_1757 = "_-h1P" (String#4520, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_197 = "_-G1o" (String#2651, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_221 = "_-ct" (String#23930, DoABC#4)
// _SafeStr_227 = "_-b1M" (String#23507, DoABC#4)
// _SafeStr_233 = "_-9Q" (String#24496, DoABC#4)
// _SafeStr_241 = "_-nv" (String#23213, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_260 = "_-81x" (String#27324, DoABC#4)
// _SafeStr_307 = "_-X1B" (String#15794, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_386 = "_-E7" (String#22426, DoABC#4)
// _SafeStr_3903 = "_-9G" (String#5230, DoABC#4)
// _SafeStr_3904 = "_-w13" (String#6296, DoABC#4)
// _SafeStr_3905 = "_-X9" (String#5748, DoABC#4)
// _SafeStr_3906 = "_-ZZ" (String#5071, DoABC#4)
// _SafeStr_3907 = "_-G18" (String#7901, DoABC#4)
// _SafeStr_3908 = "_-Hq" (String#9127, DoABC#4)
// _SafeStr_3909 = "_-8n" (String#5068, DoABC#4)
// _SafeStr_3910 = "_-213" (String#5521, DoABC#4)
// _SafeStr_3911 = "_-mj" (String#4093, DoABC#4)
// _SafeStr_3912 = "_-1q" (String#14853, DoABC#4)
// _SafeStr_3913 = "_-7Z" (String#22151, DoABC#4)
// _SafeStr_418 = "_-412" (String#10936, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_631 = "_-D1v" (String#19034, DoABC#4)
// _SafeStr_740 = "_-714" (String#19936, DoABC#4)
// _SafeStr_748 = "_-m1e" (String#8180, DoABC#4)
// _SafeStr_780 = "_-OC" (String#22995, DoABC#4)
// _SafeStr_785 = "_-K10" (String#4948, DoABC#4)
// _SafeStr_797 = "_-Ax" (String#6747, DoABC#4)
// _SafeStr_843 = "_-W1I" (String#3535, DoABC#4)
// _SafeStr_852 = "_-19" (String#24313, DoABC#4)
// _SafeStr_854 = "_-tq" (String#30316, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)
// _SafeStr_909 = "_-Bv" (String#22651, DoABC#4)
// _SafeStr_932 = "_-60" (String#24076, DoABC#4)
// _SafeStr_990 = "_-D1i" (String#4238, DoABC#4)


