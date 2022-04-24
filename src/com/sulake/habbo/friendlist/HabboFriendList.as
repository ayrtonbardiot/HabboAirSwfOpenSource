// by nota

//com.sulake.habbo.friendlist.HabboFriendList

package com.sulake.habbo.friendlist
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.messenger._SafeStr_1700;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.friendlist.domain.FriendListTabs;
    import com.sulake.habbo.friendlist.domain.FriendCategories;
    import com.sulake.habbo.friendlist.domain.FriendRequests;
    import com.sulake.habbo.friendlist.domain.AvatarSearchResults;
    import com.sulake.habbo.notifications._SafeStr_2081;
    import flash.utils.Timer;
    import com.sulake.habbo.friendlist.domain.FriendCategoriesDeps;
    import com.sulake.habbo.friendlist.domain.AvatarSearchDeps;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboMessenger;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboNotifications;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDSessionDataManager;
    import __AS3__.vec.Vector;
    import _-yL._SafeStr_528;
    import _-JS._SafeStr_726;
    import _-JS._SafeStr_373;
    import _-Po._SafeStr_647;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.utils.Dictionary;
    import _-Po._SafeStr_890;
    import _-61d._SafeStr_644;
    import flash.geom.Point;
    import com.sulake.habbo.friendlist.domain.FriendListTab;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import _-K1r._SafeStr_1185;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-wm._SafeStr_1420;
    import _-JS._SafeStr_1600;
    import com.sulake.habbo.friendlist.domain.Friend;
    import flash.events.TimerEvent;
    import _-wm._SafeStr_1496;
    import com.sulake.habbo.friendlist.domain.FriendRequestsDeps;
    import _-JS._SafeStr_1545;
    import com.sulake.habbo.friendlist.domain.FriendCategory;
    import com.sulake.habbo.friendlist.domain.FriendListTabsDeps;
    import flash.events.Event;
    import _-yL._SafeStr_142;
    import _-JS._SafeStr_157;
    import _-JS._SafeStr_826;
    import _-JS._SafeStr_404;
    import _-JS._SafeStr_231;
    import _-JS._SafeStr_537;
    import _-JS._SafeStr_1007;
    import _-JS._SafeStr_230;
    import _-JS._SafeStr_208;
    import _-Po._SafeStr_344;
    import _-Po._SafeStr_301;
    import _-wm._SafeStr_1065;
    import _-JS._SafeStr_1649;
    import com.sulake.habbo.friendlist.domain.FriendRequest;
    import _-wm._SafeStr_1232;
    import _-wm._SafeStr_1260;
    import _-JS._SafeStr_1566;
    import _-wm._SafeStr_1205;
    import _-wm._SafeStr_1166;
    import _-wm._SafeStr_1350;
    import _-wm._SafeStr_1127;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;
    import _-Po._SafeStr_1003;
    import com.sulake.habbo.friendlist.domain.*;
    import _-JS.*;
    import _-Po.*;
    import _-wm.*;

    public class HabboFriendList extends _SafeStr_20 implements _SafeStr_1874, _SafeStr_1875, ILinkEventTracker 
    {

        public static const AVATAR_FACE_NAME:String = "face";

        private var _windowManager:_SafeStr_1695;
        private var _communication:IHabboCommunicationManager;
        private var _messenger:_SafeStr_1700;
        private var _localization:_SafeStr_18;
        private var _avatarManager:_SafeStr_1701;
        private var _sessionData:ISessionDataManager;
        private var _tracking:_SafeStr_1704;
        private var _SafeStr_3928:_SafeStr_3113;
        private var _SafeStr_3742:FriendListTabs;
        private var _SafeStr_3882:FriendListView;
        private var _openedToWebPopup:OpenedToWebPopup;
        private var _SafeStr_3911:int;
        internal var _SafeStr_3921:FriendCategories;
        private var _SafeStr_3926:FriendRequests;
        private var _avatarSearchResults:AvatarSearchResults;
        private var _notifications:_SafeStr_2081;
        private var _SafeStr_3922:Timer;
        private var _SafeStr_3924:int;
        private var _SafeStr_3925:Array;
        private var _SafeStr_3923:Timer;
        private var _SafeStr_3927:Boolean = false;
        private var _lastRoomInvitationTime:int = -60000;

        public function HabboFriendList(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3921 = new FriendCategories(new FriendCategoriesDeps(this));
            _avatarSearchResults = new AvatarSearchResults(new AvatarSearchDeps(this));
            _SafeStr_3928 = new _SafeStr_3113();
            _SafeStr_3925 = [];
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _tracking = _arg_1;
            }), new ComponentDependency(new IIDHabboMessenger(), function (_arg_1:_SafeStr_1700):void
            {
                _messenger = _arg_1;
            }, false), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarManager = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboNotifications(), function (_arg_1:_SafeStr_2081):void
            {
                _notifications = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionData = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _communication.addHabboConnectionMessageEvent(new _SafeStr_528(onUserObject));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_726(onMessengerInit));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_373(onFriendsListFragment));
            context.addLinkEventTracker(this);
            send(new _SafeStr_647());
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            context.removeLinkEventTracker(this);
            if (_SafeStr_3922)
            {
                _SafeStr_3922.stop();
                _SafeStr_3922.removeEventListener("timer", sendFriendListUpdate);
                _SafeStr_3922 = null;
            };
            if (_SafeStr_3923)
            {
                if (_SafeStr_3923.running)
                {
                    _SafeStr_3923.stop();
                };
                _SafeStr_3923.removeEventListener("timer", batchFriendsUpdate);
                _SafeStr_3923 = null;
            };
            super.dispose();
        }

        public function send(_arg_1:IMessageComposer):void
        {
            _communication.connection.send(_arg_1);
        }

        public function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (_tracking != null)
            {
                _tracking.trackGoogle(_arg_1, _arg_2, _arg_3);
            };
        }

        public function openHabboWebPage(_arg_1:String, _arg_2:Dictionary, _arg_3:int, _arg_4:int):void
        {
            var _local_6:String = getProperty(_arg_1, _arg_2);
            var _local_5:String = "habboMain";
            try
            {
                HabboWebTools.navigateToURL(_local_6, _local_5);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("GOT ERROR: " + e));
            };
            if (_openedToWebPopup == null)
            {
                _openedToWebPopup = new OpenedToWebPopup(this);
            };
            _openedToWebPopup.show(_arg_3, _arg_4);
        }

        public function getText(_arg_1:String):String
        {
            return (_localization.getLocalization(_arg_1));
        }

        public function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            _localization.registerParameter(_arg_1, _arg_2, _arg_3);
        }

        public function showLimitReachedAlert():void
        {
            registerParameter("friendlist.listfull.text", "mylimit", ("" + friendRequests.limit));
            registerParameter("friendlist.listfull.text", "clublimit", ("" + friendRequests.clubLimit));
            simpleAlert("${friendlist.listfull.title}", "${friendlist.listfull.text}");
        }

        public function showFriendRequestSentAlert(_arg_1:String):void
        {
            registerParameter("friendlist.friendrequestsent.text", "user_name", _arg_1);
            simpleAlert("${friendlist.friendrequestsent.title}", "${friendlist.friendrequestsent.text}");
        }

        public function getFriend(_arg_1:int):_SafeStr_3173
        {
            if (_SafeStr_3882 == null)
            {
                _SafeStr_14.log("Cannot process getFriend. Friendlist not initialized.");
                return (null);
            };
            return (_SafeStr_3921.findFriend(_arg_1));
        }

        public function canBeAskedForAFriend(_arg_1:int):Boolean
        {
            if (_SafeStr_3882 == null)
            {
                _SafeStr_14.log("Cannot process canBeAskedForAFriend. Friendlist not initialized.");
                return (false);
            };
            return (((this.getFriend(_arg_1) == null) && (!(searchResults.isFriendRequestSent(_arg_1)))) && (categories.getFriendCount(false) < friendRequests.limit));
        }

        public function askForAFriend(_arg_1:int, _arg_2:String):Boolean
        {
            if (_SafeStr_3882 == null)
            {
                _SafeStr_14.log("Cannot ask for friend. Friendlist not initialized.");
                return (false);
            };
            if (searchResults.isFriendRequestSent(_arg_1))
            {
                return (true);
            };
            if (!canBeAskedForAFriend(_arg_1))
            {
                return (false);
            };
            send(new _SafeStr_890(_arg_2));
            searchResults.setFriendRequestSent(_arg_1);
            send(new _SafeStr_644());
            return (true);
        }

        public function openFriendList():void
        {
            openFriendListWithTab(1);
        }

        public function openFriendRequests():void
        {
            openFriendListWithTab(2);
        }

        public function openFriendSearch():void
        {
            openFriendListWithTab(3);
            SearchView(_SafeStr_3742.findTab(3).tabView).focus();
        }

        public function close():void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.close();
            };
        }

        public function alignBottomLeftTo(_arg_1:Point):void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.alignBottomLeftTo(_arg_1);
            };
        }

        public function isOpen():Boolean
        {
            if (_SafeStr_3882)
            {
                return (_SafeStr_3882.isOpen());
            };
            return (false);
        }

        public function currentTabId():int
        {
            if (((_SafeStr_3882 == null) || (!(_SafeStr_3882.isOpen()))))
            {
                return (0);
            };
            return (_SafeStr_3924);
        }

        private function openFriendListWithTab(_arg_1:int):void
        {
            if (_SafeStr_3882 == null)
            {
                _SafeStr_14.log("Cannot open friendlist. Friendlist not initialized.");
                return;
            };
            _SafeStr_3882.openFriendList();
            var _local_2:FriendListTab = tabs.findTab(_arg_1);
            if (_local_2 != tabs.findSelectedTab())
            {
                tabs.toggleSelected(_local_2);
                view.refresh("openFriendList");
            };
            _SafeStr_3882.mainWindow.activate();
            _SafeStr_3924 = _arg_1;
        }

        public function getFriendCount(_arg_1:Boolean, _arg_2:Boolean):int
        {
            if (_SafeStr_3882 == null)
            {
                _SafeStr_14.log("Cannot get friend count. Friendlist not initialized.");
                return (0);
            };
            return (this._SafeStr_3921.getFriendCount(_arg_1, _arg_2));
        }

        public function getButton(_arg_1:String, _arg_2:String, _arg_3:Function, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0):_SafeStr_3264
        {
            var _local_8:BitmapData = getButtonImage(_arg_2);
            var _local_7:_SafeStr_3264 = (_windowManager.createWindow(_arg_1, "", 21, 0, (0x01 | 0x10), new Rectangle(_arg_4, _arg_5, _local_8.width, _local_8.height), _arg_3, _arg_6) as _SafeStr_3264);
            _local_7.bitmap = _local_8;
            return (_local_7);
        }

        public function getXmlWindow(_arg_1:String):_SafeStr_3109
        {
            var _local_3:IAsset = assets.getAssetByName((_arg_1 + "_xml"));
            var _local_2:XmlAsset = XmlAsset(_local_3);
            return (_windowManager.buildFromXML(XML(_local_2.content)));
        }

        public function isMessagesPersisted():Boolean
        {
            return (getBoolean("friend_list.persistent_message_status.enabled"));
        }

        public function getSmallGroupBadgeBitmap(_arg_1:String):BitmapData
        {
            if (_sessionData)
            {
                return (_sessionData.getGroupBadgeSmallImage(_arg_1));
            };
            return (null);
        }

        public function getAvatarFaceBitmap(_arg_1:String):BitmapData
        {
            var _local_3:Boolean = getBoolean("zoom.enabled");
            var _local_4:_SafeStr_3138 = _avatarManager.createAvatarImage(_arg_1, ((_local_3) ? "h" : "sh"), null, this);
            if (!_local_4)
            {
                return (null);
            };
            var _local_2:BitmapData = _local_4.getCroppedImage("head", ((_local_3) ? 0.5 : 1));
            _local_4.dispose();
            return (_local_2);
        }

        public function isEmbeddedMinimailEnabled():Boolean
        {
            var _local_1:String = getProperty("client.minimail.embed.enabled");
            return (_local_1 == "true");
        }

        private function onUserObject(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1185 = (_arg_1 as _SafeStr_528).getParser();
            _SafeStr_3911 = _local_2.id;
        }

        private function onFriendsListFragment(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1420 = (_arg_1 as _SafeStr_373).getParser();
            for each (var _local_3:_SafeStr_1600 in _local_2.friendFragment)
            {
                _SafeStr_3925.push(_local_3);
            };
            if ((_local_2.fragmentNo + 1) >= _local_2.totalFragments)
            {
                _SafeStr_3923 = new Timer(5000, Math.ceil((_SafeStr_3925.length / 300)));
                _SafeStr_3923.addEventListener("timer", batchFriendsUpdate);
                _SafeStr_3923.start();
            };
        }

        private function batchFriendsUpdate(_arg_1:TimerEvent):void
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_3:int;
            if (_SafeStr_3925.length > 300)
            {
                _local_3 = (_SafeStr_3925.length - 300);
            };
            _local_2 = (_SafeStr_3925.length - 1);
            while (_local_2 >= _local_3)
            {
                _local_4 = _SafeStr_3925[_local_2];
                _SafeStr_3921.addFriend(new Friend(_local_4));
                _SafeStr_3925.splice(_local_2, 1);
                _local_2--;
            };
            if (_SafeStr_3925.length == 0)
            {
                _SafeStr_3927 = true;
            };
        }

        private function onMessengerInit(_arg_1:IMessageEvent):void
        {
            var _local_4:* = null;
            _SafeStr_3882 = new FriendListView(this);
            var _local_2:_SafeStr_1496 = (_arg_1 as _SafeStr_726).getParser();
            _SafeStr_3926 = new FriendRequests(new FriendRequestsDeps(this), _local_2.userFriendLimit, _local_2.extendedFriendLimit);
            for each (var _local_3:_SafeStr_1545 in _local_2.categories)
            {
                _SafeStr_3921.addCategory(new FriendCategory(_local_3.id, _local_3.name));
            };
            _SafeStr_3921.addCategory(new FriendCategory(0, getText("friendlist.friends")));
            _SafeStr_3921.addCategory(new FriendCategory(-1, getText("friendlist.friends.offlinecaption")));
            _SafeStr_3742 = new FriendListTabs(new FriendListTabsDeps(this));
            if (!_SafeStr_3922)
            {
                _SafeStr_3922 = new Timer(120000);
                _SafeStr_3922.addEventListener("timer", sendFriendListUpdate);
                _SafeStr_3922.start();
            };
            getFriendRequests();
            registerListeners();
            if (_SafeStr_3921.getFriendCount(true, false) == 0)
            {
                _local_4 = _SafeStr_3921.findCategory(-1);
                if (_local_4)
                {
                    _local_4.setOpen(true);
                };
            };
            _SafeStr_14.log("FRIENDLIST INITIALIZED SUCCESSFULLY");
        }

        public function trackFriendListEvent(_arg_1:String):void
        {
            events.dispatchEvent(new Event(_arg_1));
        }

        private function getSortedFriends(_arg_1:Array):Array
        {
            var _local_3:Array = [];
            var _local_6:Dictionary = new Dictionary();
            for each (var _local_5:_SafeStr_1600 in _arg_1)
            {
                _local_3.push(_local_5.name.toLowerCase());
                _local_6[_local_5.name.toLowerCase()] = _local_5;
            };
            _local_3.sort();
            var _local_2:Array = [];
            for each (var _local_4:String in _local_3)
            {
                _local_2.push(_local_6[_local_4]);
            };
            return (_local_2);
        }

        private function registerListeners():void
        {
            _communication.addHabboConnectionMessageEvent(new _SafeStr_142(onUserRights));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_157(onFollowFriendFailed));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_826(onFriendRequests));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_404(onFriendListUpdate));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_231(onHabboSearchResult));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_537(onMessengerError));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_1007(onRoomInviteError));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_230(onNewFriendRequest));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_208(onAcceptFriendResult));
        }

        private function getFriendRequests():void
        {
            _SafeStr_14.log("Sending friend requests request");
            send(new _SafeStr_344());
        }

        protected function sendFriendListUpdate(_arg_1:Event):void
        {
            _SafeStr_14.log("Sending update request");
            send(new _SafeStr_301());
        }

        private function onFriendRequests(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1065 = (_arg_1 as _SafeStr_826).getParser();
            _SafeStr_3926.clearAndUpdateView(false);
            for each (var _local_3:_SafeStr_1649 in _local_2.reqs)
            {
                _SafeStr_3926.addRequest(new FriendRequest(_local_3));
            };
            if (_local_2.reqs.length > 0)
            {
                _SafeStr_3742.findTab(2).setNewMessageArrived(true);
            };
            _SafeStr_3882.refresh("friendRequests");
        }

        private function onNewFriendRequest(_arg_1:IMessageEvent):void
        {
            _SafeStr_14.log("Received new friend request");
            var _local_2:_SafeStr_1232 = (_arg_1 as _SafeStr_230).getParser();
            var _local_4:FriendRequest = new FriendRequest(_local_2.req);
            _SafeStr_3926.addRequestAndUpdateView(_local_4);
            var _local_3:FriendListTab = _SafeStr_3742.findTab(2);
            _local_3.setNewMessageArrived(true);
            _SafeStr_3882.refresh("newFriendRequest");
        }

        private function onAcceptFriendResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1260 = (_arg_1 as _SafeStr_208).getParser();
            for each (var _local_3:_SafeStr_1566 in _local_2.failures)
            {
                friendRequests.acceptFailed(_local_3.senderId);
                showAlertView(_local_3.errorCode);
            };
        }

        private function onHabboSearchResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1205 = (_arg_1 as _SafeStr_231).getParser();
            _avatarSearchResults.searchReceived(_local_2.friends, _local_2.others);
            _SafeStr_3882.refresh("search");
        }

        private function onMessengerError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1166 = (_arg_1 as _SafeStr_537).getParser();
            showAlertView(_local_2.errorCode, _local_2.clientMessageId);
        }

        private function showAlertView(_arg_1:int, _arg_2:int=0):void
        {
            var _local_3:String = "";
            switch (_arg_1)
            {
                case 1:
                    _local_3 = "${friendlist.error.friendlistownlimit}";
                    break;
                case 2:
                    _local_3 = "${friendlist.error.friendlistlimitofrequester}";
                    break;
                case 3:
                    _local_3 = "${friendlist.error.friend_requests_disabled}";
                    break;
                case 4:
                    _local_3 = "${friendlist.error.requestnotfound}";
                    break;
                default:
                    _local_3 = ((("Received messenger error: msg: " + _arg_2) + ", errorCode: ") + _arg_1);
            };
            simpleAlert("${friendlist.alert.title}", _local_3);
        }

        private function onRoomInviteError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1350 = (_arg_1 as _SafeStr_1007).getParser();
            var _local_3:String = ((("Received room invite error: errorCode: " + _local_2.errorCode) + ", recipients: ") + Util.arrayToString(_local_2.failedRecipients));
            simpleAlert("${friendlist.alert.title}", _local_3);
        }

        private function onFriendListUpdate(_arg_1:IMessageEvent):void
        {
            _SafeStr_3921.onFriendListUpdate(_arg_1);
            _SafeStr_3882.refresh("friendListUpdate");
        }

        private function onFollowFriendFailed(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1127 = (_arg_1 as _SafeStr_157).getParser();
            var _local_3:String = getFollowFriendErrorText(_local_2.errorCode);
            _SafeStr_14.log(((("Received follow friend failed: " + _local_2.errorCode) + ", ") + _local_3));
            simpleAlert("${friendlist.alert.title}", _local_3);
        }

        public function simpleAlert(_arg_1:String, _arg_2:String):void
        {
            windowManager.simpleAlert(_arg_1, null, _arg_2);
        }

        private function getFollowFriendErrorText(_arg_1:int):String
        {
            if (_arg_1 == 0)
            {
                return ("${friendlist.followerror.notfriend}");
            };
            if (_arg_1 == 1)
            {
                return ("${friendlist.followerror.offline}");
            };
            if (_arg_1 == 2)
            {
                return ("${friendlist.followerror.hotelview}");
            };
            if (_arg_1 == 3)
            {
                return ("${friendlist.followerror.prevented}");
            };
            return ("Unknown follow friend error " + _arg_1);
        }

        public function refreshText(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:String):void
        {
            var _local_5:_SafeStr_3109 = _arg_1.getChildByName(_arg_2);
            if (!_arg_3)
            {
                _local_5.visible = false;
            }
            else
            {
                _local_5.visible = true;
                _local_5.caption = _arg_4;
            };
        }

        public function refreshButton(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int):void
        {
            var _local_6:_SafeStr_3109 = (_arg_1.findChildByName(_arg_2) as _SafeStr_3109);
            if (!_arg_3)
            {
                _local_6.visible = false;
            }
            else
            {
                prepareButton(_local_6, _arg_2, _arg_4, _arg_5);
                _local_6.visible = true;
            };
        }

        public function refreshRelationshipRegion(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:int, _arg_4:Function, _arg_5:int):void
        {
            var _local_6:IRegionWindow = IRegionWindow(_arg_1.findChildByName(_arg_2));
            var _local_7:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_local_6.findChildByTag("bitmap"));
            var _local_8:String = "relationship_status_none";
            switch (_arg_3)
            {
                case 1:
                    _local_8 = "relationship_status_heart";
                    break;
                case 2:
                    _local_8 = "relationship_status_smile";
                    break;
                case 3:
                    _local_8 = "relationship_status_bobba";
                default:
            };
            _local_7.assetUri = _local_8;
            _local_7.visible = true;
            _local_6.id = _arg_5;
            _local_6.procedure = _arg_4;
            _local_6.visible = ((_arg_5 > 0) && (getBoolean("relationship.status.enabled")));
        }

        public function refreshIcon(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int):void
        {
            var _local_6:_SafeStr_3109 = _arg_1.findChildByName(_arg_2);
            if (!_arg_3)
            {
                _local_6.visible = false;
            }
            else
            {
                _local_6.id = _arg_5;
                _local_6.procedure = _arg_4;
                _local_6.visible = true;
            };
        }

        private function prepareButton(_arg_1:_SafeStr_3109, _arg_2:String, _arg_3:Function, _arg_4:int):void
        {
            var _local_5:* = null;
            _arg_1.id = _arg_4;
            if ((_arg_1 is _SafeStr_3264))
            {
                _local_5 = (_arg_1 as _SafeStr_3264);
            }
            else
            {
                _local_5 = (_SafeStr_3133(_arg_1).findChildByTag("bitmap") as _SafeStr_3264);
            };
            if (_local_5.bitmap != null)
            {
                return;
            };
            _local_5.bitmap = getButtonImage(_arg_2);
            _local_5.width = _local_5.bitmap.width;
            _local_5.height = _local_5.bitmap.height;
            _arg_1.procedure = _arg_3;
        }

        public function getButtonImage(_arg_1:String):BitmapData
        {
            var _local_4:* = null;
            var _local_5:IAsset = assets.getAssetByName((_arg_1 + "_png"));
            var _local_3:BitmapDataAsset = (_local_5 as BitmapDataAsset);
            _SafeStr_14.log(("GETTING ASSET: " + _arg_1));
            var _local_2:BitmapData = (_local_3.content as BitmapData);
            _SafeStr_14.log(((("GOT ASSET: " + _local_5) + ", ") + _local_2));
            _local_4 = new BitmapData(_local_2.width, _local_2.height, true, 0);
            _local_4.draw(_local_2);
            return (_local_4);
        }

        public function get lastRoomInvitationTime():*
        {
            return (_lastRoomInvitationTime);
        }

        public function resetLastRoomInvitationTime():void
        {
            _lastRoomInvitationTime = getTimer();
        }

        public function get hasfriendsListInitialized():Boolean
        {
            return (_SafeStr_3927);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get categories():FriendCategories
        {
            return (_SafeStr_3921);
        }

        public function get friendRequests():FriendRequests
        {
            return (_SafeStr_3926);
        }

        public function get searchResults():AvatarSearchResults
        {
            return (_avatarSearchResults);
        }

        public function get view():FriendListView
        {
            return (_SafeStr_3882);
        }

        public function get tabs():FriendListTabs
        {
            return (_SafeStr_3742);
        }

        public function get laf():_SafeStr_3113
        {
            return (_SafeStr_3928);
        }

        public function get messenger():_SafeStr_1700
        {
            return (_messenger);
        }

        public function get avatarId():int
        {
            return (_SafeStr_3911);
        }

        public function get notifications():_SafeStr_2081
        {
            return (_notifications);
        }

        public function get tracking():_SafeStr_1704
        {
            return (_tracking);
        }

        public function get mainWindow():_SafeStr_3133
        {
            if (_SafeStr_3882 == null)
            {
                return (null);
            };
            return (_SafeStr_3882.mainWindow);
        }

        public function getFriendNames():Array
        {
            if (_SafeStr_3921 == null)
            {
                return ([]);
            };
            return (_SafeStr_3921.getFriendNames());
        }

        public function acceptFriendRequest(_arg_1:int):void
        {
            if (!_SafeStr_3742)
            {
                return;
            };
            var _local_3:FriendListTab = _SafeStr_3742.findTab(2);
            if (!_local_3)
            {
                return;
            };
            var _local_2:_SafeStr_3112 = (_local_3.tabView as _SafeStr_3112);
            if (!_local_2)
            {
                return;
            };
            _local_2.acceptRequest(_arg_1);
        }

        public function acceptAllFriendRequests():void
        {
            var _local_2:FriendListTab = _SafeStr_3742.findTab(2);
            if (!_local_2)
            {
                return;
            };
            var _local_1:_SafeStr_3112 = (_local_2.tabView as _SafeStr_3112);
            if (!_local_1)
            {
                return;
            };
            _local_1.acceptAllRequests();
        }

        public function declineFriendRequest(_arg_1:int):void
        {
            var _local_3:FriendListTab = _SafeStr_3742.findTab(2);
            if (!_local_3)
            {
                return;
            };
            var _local_2:_SafeStr_3112 = (_local_3.tabView as _SafeStr_3112);
            if (!_local_2)
            {
                return;
            };
            _local_2.declineRequest(_arg_1);
        }

        public function declineAllFriendRequests():void
        {
            var _local_2:FriendListTab = _SafeStr_3742.findTab(2);
            if (!_local_2)
            {
                return;
            };
            var _local_1:_SafeStr_3112 = (_local_2.tabView as _SafeStr_3112);
            if (!_local_1)
            {
                return;
            };
            _local_1.declineAllRequests();
        }

        public function setRelationshipStatus(_arg_1:int, _arg_2:int):void
        {
            send(new _SafeStr_1003(_arg_1, _arg_2));
        }

        public function getRelationshipStatus(_arg_1:int):int
        {
            var _local_2:Friend = _SafeStr_3921.findFriend(_arg_1);
            if (_local_2)
            {
                return (_local_2.relationshipStatus);
            };
            return (0);
        }

        private function onUserRights(_arg_1:IMessageEvent):void
        {
            if (((!(_sessionData)) || (!(_SafeStr_3926))))
            {
                return;
            };
            var _local_2:int;
            if (_sessionData.hasVip)
            {
                _local_2 = _SafeStr_3926.clubLimit;
            }
            else
            {
                if (_sessionData.hasClub)
                {
                    _local_2 = _SafeStr_3926.clubLimit;
                };
            };
            if (_local_2 > _SafeStr_3926.limit)
            {
                _SafeStr_3926.limit = _local_2;
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            var _local_6:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            if (((disposed) || (_SafeStr_3921 == null)))
            {
                return;
            };
            var _local_2:Dictionary = _SafeStr_3921.getAllFriends();
            if (_local_2 == null)
            {
                return;
            };
            for each (var _local_4:Friend in _local_2)
            {
                if ((((!(_local_4 == null)) && (!(_local_4.disposed))) && (_local_4.figure == _arg_1)))
                {
                    if (_local_4.isGroupFriend())
                    {
                        _local_4.face = getSmallGroupBadgeBitmap(_local_4.figure);
                    }
                    else
                    {
                        _local_4.face = getAvatarFaceBitmap(_local_4.figure);
                    };
                    if (_local_4.face != null)
                    {
                        _local_6 = _local_4.view;
                        if (_local_6 != null)
                        {
                            _local_5 = (_local_6.getChildByName("face") as _SafeStr_3264);
                            if (((!(_local_5 == null)) && (!(_local_5.disposed))))
                            {
                                _local_3 = _local_5.bitmap;
                                if (_local_3 != null)
                                {
                                    _local_3.fillRect(_local_3.rect, 0);
                                    _local_3.copyPixels(_local_4.face, _local_4.face.rect, new Point(0, 0), null, null, true);
                                };
                                _local_5.invalidate();
                            };
                        };
                    };
                };
            };
        }

        public function get linkPattern():String
        {
            return ("friendlist/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_3:* = null;
            var _local_4:int;
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length < 2)
            {
                return;
            };
            switch (_local_2[1])
            {
                case "open":
                    openFriendList();
                    return;
                case "openchat":
                    if (((_local_2.length < 3) || (_messenger == null)))
                    {
                        return;
                    };
                    _local_3 = _local_2[2].split(":");
                    if (_local_3.length < 2)
                    {
                        return;
                    };
                    if (_local_3[0] == _SafeStr_3911)
                    {
                        _local_4 = _local_3[1];
                    }
                    else
                    {
                        _local_4 = _local_3[0];
                    };
                    if (((_local_4) && (_local_4 > 0)))
                    {
                        openFriendList();
                        _messenger.startConversation(_local_4);
                    };
                    return;
                default:
                    _SafeStr_14.log(("FriendList unknown link-type received: " + _local_2[1]));
                    return;
            };
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_1003 = "_-j1o" (String#30854, DoABC#4)
// _SafeStr_1007 = "_-gH" (String#24277, DoABC#4)
// _SafeStr_1065 = "_-lZ" (String#32145, DoABC#4)
// _SafeStr_1127 = "_-f1x" (String#38011, DoABC#4)
// _SafeStr_1166 = "_-d1D" (String#37271, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1205 = "_-vj" (String#34436, DoABC#4)
// _SafeStr_1232 = "_-G1x" (String#28910, DoABC#4)
// _SafeStr_1260 = "_-ji" (String#32476, DoABC#4)
// _SafeStr_1350 = "_-Ie" (String#39894, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_142 = "_-Fc" (String#3612, DoABC#4)
// _SafeStr_1420 = "_-Yu" (String#29554, DoABC#4)
// _SafeStr_1496 = "_-nd" (String#32170, DoABC#4)
// _SafeStr_1545 = "_-h1b" (String#29991, DoABC#4)
// _SafeStr_1566 = "_-O1O" (String#40996, DoABC#4)
// _SafeStr_157 = "_-H1l" (String#25946, DoABC#4)
// _SafeStr_1600 = "_-Cu" (String#6879, DoABC#4)
// _SafeStr_1649 = "_-v1E" (String#15412, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_208 = "_-uG" (String#23733, DoABC#4)
// _SafeStr_2081 = "_-TA" (String#4559, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_230 = "_-SR" (String#7982, DoABC#4)
// _SafeStr_231 = "_-D11" (String#27285, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_301 = "_-g6" (String#30162, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3112 = "_-S1u" (String#5103, DoABC#4)
// _SafeStr_3113 = "_-x1g" (String#10821, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3173 = "_-o3" (String#6682, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_344 = "_-te" (String#29054, DoABC#4)
// _SafeStr_373 = "_-U1c" (String#6702, DoABC#4)
// _SafeStr_3742 = "_-p7" (String#1631, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3911 = "_-mj" (String#4093, DoABC#4)
// _SafeStr_3921 = "_-UY" (String#870, DoABC#4)
// _SafeStr_3922 = "_-W1i" (String#6872, DoABC#4)
// _SafeStr_3923 = "_-9O" (String#3164, DoABC#4)
// _SafeStr_3924 = "_-21s" (String#20265, DoABC#4)
// _SafeStr_3925 = "_-y1G" (String#6742, DoABC#4)
// _SafeStr_3926 = "_-Mk" (String#2364, DoABC#4)
// _SafeStr_3927 = "_-M1x" (String#22355, DoABC#4)
// _SafeStr_3928 = "_-91o" (String#19696, DoABC#4)
// _SafeStr_404 = "_-M1U" (String#6652, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_537 = "_-02m" (String#24073, DoABC#4)
// _SafeStr_644 = "_-015" (String#29066, DoABC#4)
// _SafeStr_647 = "_-WX" (String#28656, DoABC#4)
// _SafeStr_726 = "_-3t" (String#11001, DoABC#4)
// _SafeStr_826 = "_-u1m" (String#11868, DoABC#4)
// _SafeStr_890 = "_-F1G" (String#30871, DoABC#4)


