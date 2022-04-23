// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.HabboFriendBarView

package com.sulake.habbo.friendbar.view
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.friendbar.data._SafeStr_3134;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.friendbar.view.tabs.ITab;
    import com.sulake.habbo.friendbar.view.utils.TextCropper;
    import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
    import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
    import com.sulake.habbo.friendbar.view.tabs._SafeStr_3347;
    import flash.utils.Timer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboFriendBarData;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboGameManager;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.room.utils.RoomEnterEffect;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.friendbar.view.tabs.NewFriendRequestTab;
    import com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab;
    import com.sulake.habbo.friendbar.view.tabs.NewFriendEntityTab;
    import com.sulake.habbo.friendbar.view.tabs._SafeStr_3340;
    import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
    import com.sulake.habbo.friendbar.view.tabs.Tab;
    import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.friendbar.data.FriendRequest;
    import com.sulake.habbo.friendbar.view.tabs.FriendRequestTab;
    import com.sulake.habbo.friendbar.data._SafeStr_3377;
    import flash.events.Event;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
    import com.sulake.habbo.friendbar.events.FriendRequestUpdateEvent;
    import com.sulake.habbo.friendbar.events.NewMessageEvent;
    import com.sulake.habbo.friendbar.events.NotificationEvent;
    import com.sulake.habbo.friendbar.events.ActiveConversationsCountEvent;
    import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.friendbar.events.FriendBarResizeEvent;

    public class HabboFriendBarView extends AbstractView implements _SafeStr_3185, _SafeStr_1875, ILinkEventTracker 
    {

        private static const TAB_WIDTH:int = 127;
        private static const _SafeStr_8555:int = 1;
        private static const USE_TOGGLE_WINDOW:Boolean = false;
        private static const _SafeStr_8584:int = 3;
        private static const MAIN_WINDOW_RESOURCE:String = "new_bar_xml";
        private static const TOGGLE_WINDOW_RESOURCE:String = "toggle_xml";
        private static const BORDER:String = "border";
        private static const LIST:String = "list";
        private static const HEADER:String = "header";
        private static const CANVAS:String = "canvas";
        private static const PIECES:String = "pieces";
        private static const TOOLS:String = "friendtools";
        private static const _SafeStr_8585:String = "collapse_left";
        private static const BUTTON_COLLAPSE_RIGHT:String = "collapse_right";
        private static const _SafeStr_8586:String = "button_left";
        private static const _SafeStr_8587:String = "button_right";
        private static const BUTTON_LEFT_PAGE:String = "button_left_page";
        private static const BUTTON_RIGHT_PAGE:String = "button_right_page";
        private static const _SafeStr_8588:String = "button_left_end";
        private static const _SafeStr_8589:String = "button_right_end";
        private static const _SafeStr_8574:String = "button_close";
        private static const _SafeStr_8590:String = "button_open";
        private static const LINK_FRIEND_LIST:String = "link_friendlist";
        private static const ICON_FIND_FRIENDS:String = "icon_find_friends";
        private static const ICON_ALL_FRIENDS:String = "icon_all_friends";
        private static const COLLAPSED_MARGIN:int = 150;
        private static const NEW_BAR_BOTTOM_OFFSET:int = 1;
        private static const NEW_BAR_RIGHT_MARGIN:int = 16;

        private var _friendBarData:_SafeStr_3134;
        private var _gameManager:_SafeStr_1699;
        private var _friendList:_SafeStr_1874;
        private var _toolbar:IHabboToolbar;
        private var _SafeStr_5162:_SafeStr_3133;
        private var _SafeStr_5165:_SafeStr_3133;
        private var _SafeStr_5164:_SafeStr_3133;
        private var _SafeStr_5166:Vector.<ITab>;
        private var _SafeStr_5175:ITab;
        private var _SafeStr_5168:int = -1;
        private var _SafeStr_5170:int = 0;
        private var _SafeStr_5167:TextCropper;
        private var _friendListIcon:FriendListIcon;
        private var _messengerIcon:MessengerIcon;
        private var _SafeStr_5161:_SafeStr_3133;
        private var _SafeStr_5176:_SafeStr_3347;
        private var _SafeStr_5169:Boolean = true;
        private var _SafeStr_3920:Timer;
        private var _SafeStr_5163:Boolean = false;
        private var _SafeStr_5173:IRegionWindow;
        private var _SafeStr_5172:IRegionWindow;
        private var _SafeStr_5171:Boolean = false;
        private var _SafeStr_5177:IStaticBitmapWrapperWindow;
        private var _SafeStr_4582:Timer;
        private var _notifyMessengerOnStartup:Boolean = false;

        public function HabboFriendBarView(_arg_1:_SafeStr_31, _arg_2:uint, _arg_3:_SafeStr_21)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_5167 = new TextCropper();
            _SafeStr_5166 = new Vector.<ITab>();
            _SafeStr_5166 = new Vector.<ITab>();
        }

        public function setMessengerIconNotify(_arg_1:Boolean):void
        {
            if (_messengerIcon)
            {
                _messengerIcon.notify(_arg_1);
            };
            if (_SafeStr_5161)
            {
                notifyMessenger(_arg_1);
            };
        }

        public function get friendBarWidth():int
        {
            return ((_SafeStr_5162 == null) ? 0 : ((_SafeStr_5163) ? 150 : _SafeStr_5162.width));
        }

        public function setFriendListIconNotify(_arg_1:Boolean):void
        {
            if (_friendListIcon)
            {
                _friendListIcon.notify(_arg_1);
            };
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboFriendList(), function (_arg_1:_SafeStr_1874):void
            {
                _friendList = _arg_1;
            }), new ComponentDependency(new IIDHabboFriendBarData(), function (_arg_1:_SafeStr_3134):void
            {
                _friendBarData = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }), new ComponentDependency(new IIDHabboGameManager(), function (_arg_1:_SafeStr_1699):void
            {
                _gameManager = _arg_1;
            })]));
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_4582 != null)
                {
                    _SafeStr_4582.removeEventListener("timer", onTimerEvent);
                    _SafeStr_4582.stop();
                    _SafeStr_4582 = null;
                };
                if (_SafeStr_3920)
                {
                    _SafeStr_3920.removeEventListener("timerComplete", onRemoveDimmer);
                    _SafeStr_3920 = null;
                };
                if (_messengerIcon)
                {
                    _messengerIcon.dispose();
                    _messengerIcon = null;
                };
                if (_friendListIcon)
                {
                    _friendListIcon.dispose();
                    _friendListIcon = null;
                };
                if (_SafeStr_5164)
                {
                    _SafeStr_5164.dispose();
                    _SafeStr_5164 = null;
                };
                if (_SafeStr_5162)
                {
                    _SafeStr_5162.dispose();
                    _SafeStr_5162 = null;
                };
                if (_SafeStr_5165)
                {
                    _SafeStr_5165.dispose();
                    _SafeStr_5165 = null;
                };
                while (_SafeStr_5166.length > 0)
                {
                    ITab(_SafeStr_5166.pop()).dispose();
                };
                while (_SafeStr_5166.length > 0)
                {
                    ITab(_SafeStr_5166.pop()).dispose();
                };
                if ((((!(_friendBarData == null)) && (!(_friendBarData.disposed))) && (!(_friendBarData.events == null))))
                {
                    _friendBarData.events.removeEventListener("FBE_UPDATED", onRefreshView);
                    _friendBarData.events.removeEventListener("FIND_FRIENDS_RESULT", onFindFriendsNotification);
                    _friendBarData.events.removeEventListener("FBE_REQUESTS", onFriendRequestUpdate);
                    _friendBarData.events.removeEventListener("FBE_MESSAGE", onNewInstantMessage);
                    _friendBarData.events.removeEventListener("FBE_NOTIFICATION_EVENT", onFriendNotification);
                    _friendBarData.events.removeEventListener("AMC_EVENT", onRefreshMessengerConversations);
                };
                if (_sessionDataManager)
                {
                    _sessionDataManager.events.removeEventListener("APUE_UPDATED", onSessionDataPreferences);
                };
                if (((!(_windowManager == null)) && (!(_windowManager.disposed))))
                {
                    _windowManager.getWindowContext(1).getDesktopWindow().removeEventListener("WE_RESIZED", onDesktopResized);
                };
                _SafeStr_5167.dispose();
                _SafeStr_5167 = null;
                super.dispose();
            };
        }

        override protected function initComponent():void
        {
            context.addLinkEventTracker(this);
            _friendBarData.events.addEventListener("FBE_UPDATED", onRefreshView);
            _friendBarData.events.addEventListener("FIND_FRIENDS_RESULT", onFindFriendsNotification);
            _friendBarData.events.addEventListener("FBE_REQUESTS", onFriendRequestUpdate);
            _friendBarData.events.addEventListener("FBE_MESSAGE", onNewInstantMessage);
            _friendBarData.events.addEventListener("FBE_NOTIFICATION_EVENT", onFriendNotification);
            _friendBarData.events.addEventListener("AMC_EVENT", onRefreshMessengerConversations);
            _sessionDataManager.events.addEventListener("APUE_UPDATED", onSessionDataPreferences);
        }

        public function set visible(_arg_1:Boolean):void
        {
            if (_SafeStr_5162)
            {
                _SafeStr_5162.visible = _arg_1;
                _SafeStr_5162.activate();
            };
            if (_SafeStr_5164)
            {
                _SafeStr_5164.visible = (!(_arg_1));
                if (_SafeStr_5162)
                {
                    _SafeStr_5164.x = _SafeStr_5162.x;
                    _SafeStr_5164.y = _SafeStr_5162.y;
                    _SafeStr_5164.activate();
                };
            };
        }

        private function addDimmerToFriendBar():void
        {
            var _local_1:_SafeStr_3109 = _windowManager.createWindow("bar_dimmer", "", 30, 1, ((0x80 | 0x0800) | 0x01), new Rectangle(0, 0, _SafeStr_5162.width, _SafeStr_5162.height), null, 0);
            _local_1.color = 0;
            _local_1.blend = 0.3;
            _SafeStr_5162.addChild(_local_1);
            _SafeStr_5162.invalidate();
            if (_SafeStr_3920 == null)
            {
                _SafeStr_3920 = new Timer(RoomEnterEffect.totalRunningTime, 1);
                _SafeStr_3920.addEventListener("timerComplete", onRemoveDimmer);
                _SafeStr_3920.start();
            };
        }

        private function onRemoveDimmer(_arg_1:TimerEvent):void
        {
            _SafeStr_3920.removeEventListener("timerComplete", onRemoveDimmer);
            _SafeStr_3920 = null;
            var _local_2:_SafeStr_3109 = _SafeStr_5162.findChildByName("bar_dimmer");
            if (_local_2 != null)
            {
                _SafeStr_5162.removeChild(_local_2);
                _windowManager.destroy(_local_2);
            };
        }

        public function get visible():Boolean
        {
            return ((_SafeStr_5162) && (_SafeStr_5162.visible));
        }

        public function populate():void
        {
            var _local_6:int;
            var _local_2:* = null;
            var _local_15:* = null;
            var _local_9:* = null;
            var _local_7:int;
            var _local_11:* = null;
            if (!(!(_SafeStr_5162 == null)))
            {
                return;
            };
            var _local_14:int = _SafeStr_5168;
            deSelect(false);
            var _local_10:IItemListWindow = (_SafeStr_5162.findChildByName("list") as IItemListWindow);
            if (!(!(_local_10 == null)))
            {
                return;
            };
            _local_10.autoArrangeItems = false;
            var _local_4:int = _local_10.numListItems;
            _local_6 = _local_4;
            while (_local_6 > 0)
            {
                _local_10.removeListItemAt((_local_6 - 1));
                _local_6--;
            };
            while (_SafeStr_5166.length > 0)
            {
                _SafeStr_5166.pop().recycle();
            };
            updateFriendRequestCounter(_friendBarData.numFriendRequests);
            var _local_3:int = _friendBarData.numFriends;
            var _local_5:int;
            var _local_1:int = maxNumOfTabsVisible;
            var _local_12:int = ((_local_3 + ((_SafeStr_5169) ? 1 : 0)) + ((_local_5 > 0) ? 1 : 0));
            var _local_13:int = Math.min(_local_1, _local_12);
            if ((_SafeStr_5170 + _local_13) > _local_12)
            {
                _SafeStr_5170 = Math.max(0, (_SafeStr_5170 - ((_SafeStr_5170 + _local_13) - _local_12)));
            };
            var _local_8:int = _SafeStr_5170;
            if (_local_5 > 0)
            {
                if (_SafeStr_5170 == 0)
                {
                    if (_SafeStr_5166.length < _local_1)
                    {
                        if (_local_5 == 1)
                        {
                            _local_2 = _friendBarData.getFriendRequestAt(0);
                            _local_9 = NewFriendRequestTab.allocate(_local_2);
                            _SafeStr_5166.push(_local_9);
                            _local_10.addListItem(_local_9.window);
                        }
                        else
                        {
                            if (_local_5 > 1)
                            {
                                _local_9 = FriendRequestsTab.allocate(_friendBarData.getFriendRequestList());
                                _SafeStr_5166.push(_local_9);
                                _local_10.addListItem(_local_9.window);
                            };
                        };
                    };
                }
                else
                {
                    _local_8--;
                };
            };
            _local_6 = _local_8;
            while (_local_6 < (_local_3 + _local_8))
            {
                if (_local_6 >= _local_3) break;
                if (_SafeStr_5166.length >= _local_1) break;
                _local_15 = _friendBarData.getFriendAt(_local_6);
                if (_local_15.id > 0)
                {
                    _local_9 = NewFriendEntityTab.allocate(_local_15);
                    _SafeStr_5166.push(_local_9);
                    _local_10.addListItem(_local_9.window);
                };
                _local_6++;
            };
            if (_SafeStr_5169)
            {
                _local_7 = getNumberOfFindFriendsTabs(_local_1, _local_12, _local_3, _local_5);
                _local_12 = ((_local_3 + _local_7) + ((_local_5 > 0) ? 1 : 0));
                while (_local_7-- > 0)
                {
                    _local_11 = _SafeStr_3340.allocate();
                    _local_10.addListItem(_local_11.window);
                    _SafeStr_5166.push(_local_11);
                };
            };
            _local_10.autoArrangeItems = true;
            if (_local_14 > -1)
            {
                selectFriendEntity(_local_14);
            };
            setCollapseButtonVisibility();
            toggleArrowButtons(((_SafeStr_5166.length < _local_12) && (_local_12 > 0)), (!(_SafeStr_5170 == 0)), ((_SafeStr_5170 + _SafeStr_5166.length) < _local_12));
            if (!_SafeStr_5171)
            {
                _SafeStr_5171 = true;
                resizeAndPopulate(false);
                resizeAndPopulate(true);
            };
        }

        private function getNumberOfFindFriendsTabs(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):int
        {
            if (_SafeStr_5166.length >= _arg_1)
            {
                return (0);
            };
            if (_SafeStr_5166.length >= _arg_1)
            {
                return (0);
            };
            var _local_5:int = 1;
            if ((_SafeStr_5166.length + _local_5) < 3)
            {
                _local_5 = Math.min((_arg_1 - _SafeStr_5166.length), (3 - _SafeStr_5166.length));
            };
            return (_local_5);
        }

        private function getFriendEntityTabByID(_arg_1:int):FriendEntityTab
        {
            var _local_2:* = null;
            var _local_4:int;
            var _local_3:int = _SafeStr_5166.length;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = (_SafeStr_5166[_local_4] as FriendEntityTab);
                if (_local_2)
                {
                    if (_local_2.friend.id == _arg_1)
                    {
                        return (_local_2);
                    };
                };
                _local_4++;
            };
            return (null);
        }

        private function isUserInterfaceReady():Boolean
        {
            return ((_SafeStr_5162) && (!(_SafeStr_5162.disposed)));
        }

        private function buildUserInterface():void
        {
            Tab.DATA = _friendBarData;
            Tab.GAMES = _gameManager;
            Tab.FRIENDS = _friendList;
            Tab.VIEW = this;
            Tab.ASSETS = assets;
            Tab.WINDOWING = _windowManager;
            Tab._SafeStr_5174 = _localizationManager;
            Tab.CROPPER = _SafeStr_5167;
            Tab.TRACKING = _tracking;
            Token.WINDOWING = _windowManager;
            Token.ASSETS = assets;
            Token.GAMES = _gameManager;
            var _local_4:IAsset = assets.getAssetByName("new_bar_xml");
            _SafeStr_5162 = (_windowManager.buildFromXML((_local_4.content as XML), 1) as _SafeStr_3133);
            _SafeStr_5162.y = (_SafeStr_5162.parent.height - (_SafeStr_5162.height + 1));
            _SafeStr_5162.setParamFlag(0x0400, true);
            _SafeStr_5162.procedure = barWindowEventProc;
            if (RoomEnterEffect.isRunning())
            {
                addDimmerToFriendBar();
            };
            var _local_2:_SafeStr_3133 = (_SafeStr_5162.findChildByName("friendtools") as _SafeStr_3133);
            _SafeStr_5177 = (_local_2.getChildByName("line") as IStaticBitmapWrapperWindow);
            _SafeStr_5161 = _SafeStr_3133(_local_2.findChildByName("icon_messenger"));
            if (_SafeStr_5161)
            {
                _SafeStr_5161.addEventListener("WME_CLICK", onOpenMessenger);
                _SafeStr_5161.visible = false;
            };
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_local_2.findChildByName("icon_all_friends"));
            if (_local_3)
            {
                _local_3.addEventListener("WME_CLICK", onOpenFriendsList);
            };
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_local_2.findChildByName("icon_find_friends"));
            if (_local_1)
            {
                _local_1.addEventListener("WME_CLICK", onOpenSearchFriends);
            };
            _SafeStr_5172 = (_SafeStr_5162.findChildByName("collapse_left") as IRegionWindow);
            if (_SafeStr_5172)
            {
                _SafeStr_5172.addEventListener("WME_CLICK", onCollapseFriendList);
            };
            _SafeStr_5173 = (_SafeStr_5162.findChildByName("collapse_right") as IRegionWindow);
            if (_SafeStr_5173)
            {
                _SafeStr_5173.addEventListener("WME_CLICK", onCollapseFriendList);
            };
            _windowManager.getWindowContext(1).getDesktopWindow().addEventListener("WE_RESIZED", onDesktopResized);
            populate();
            if (_notifyMessengerOnStartup)
            {
                notifyMessenger(true);
            };
        }

        public function getAvatarFaceBitmap(_arg_1:String):BitmapData
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_avatarManager)
            {
                _local_3 = _avatarManager.createAvatarImage(_arg_1, "h", null, this);
                if (_local_3)
                {
                    _local_2 = _local_3.getCroppedImage("head");
                    _local_3.dispose();
                };
            };
            return (_local_2);
        }

        public function getGroupIconBitmap(_arg_1:String):BitmapData
        {
            return (_sessionDataManager.getGroupBadgeImage(_arg_1));
        }

        public function avatarImageReady(_arg_1:String):void
        {
            var _local_11:* = null;
            var _local_3:int;
            var _local_10:* = null;
            var _local_13:* = null;
            var _local_6:* = null;
            var _local_12:* = null;
            var _local_4:* = null;
            var _local_8:IItemListWindow = (_SafeStr_5162.findChildByName("list") as IItemListWindow);
            var _local_9:int = _friendBarData.numFriends;
            _local_3 = 0;
            while (_local_3 < _local_9)
            {
                _local_11 = _friendBarData.getFriendAt(_local_3);
                if (_local_11.figure == _arg_1)
                {
                    _local_10 = null;
                    if (_local_11.id > 0)
                    {
                        _local_10 = getAvatarFaceBitmap(_local_11.figure);
                    }
                    else
                    {
                        _local_10 = getGroupIconBitmap(_local_11.figure);
                    };
                    if (_local_10)
                    {
                        _local_13 = (_local_8.getListItemByID(_local_11.id) as _SafeStr_3133);
                        if (_local_13)
                        {
                            _local_6 = (_local_13.getChildByName("pieces") as IItemListWindow);
                            if (_local_6)
                            {
                                _local_12 = _SafeStr_3133(_local_6.getListItemByName("header"));
                                if (_local_12)
                                {
                                    _local_4 = (_local_12.findChildByName("canvas") as _SafeStr_3264);
                                    _local_4.bitmap = _local_10;
                                    _local_4.width = _local_10.width;
                                    _local_4.height = _local_10.height;
                                };
                            };
                        };
                    };
                    return;
                };
                _local_3++;
            };
            var _local_5:Array = _friendBarData.getFriendRequestList();
            for each (var _local_2:FriendRequest in _local_5)
            {
                if (_local_2.figure == _arg_1)
                {
                    for each (var _local_7:Tab in _SafeStr_5166)
                    {
                        if ((_local_7 is FriendRequestTab))
                        {
                            FriendRequestTab(_local_7).avatarImageReady(_local_2, getAvatarFaceBitmap(_arg_1));
                            return;
                        };
                        if ((_local_7 is NewFriendRequestTab))
                        {
                            NewFriendRequestTab(_local_7).avatarImageReady(_local_2, getAvatarFaceBitmap(_arg_1));
                            return;
                        };
                        if ((_local_7 is FriendRequestsTab))
                        {
                            FriendRequestsTab(_local_7).avatarImageReady(_local_2, getAvatarFaceBitmap(_arg_1));
                            return;
                        };
                    };
                };
            };
        }

        private function isFriendSelected(_arg_1:_SafeStr_3377):Boolean
        {
            return (_SafeStr_5168 == _arg_1.id);
        }

        public function selectTab(_arg_1:ITab, _arg_2:Boolean):void
        {
            if (!_arg_1.selected)
            {
                if (_SafeStr_5175)
                {
                    deSelect(true);
                };
                _arg_1.select(_arg_2);
                _SafeStr_5175 = _arg_1;
                if ((_arg_1 is FriendEntityTab))
                {
                    _SafeStr_5168 = FriendEntityTab(_arg_1).friend.id;
                };
                if ((_arg_1 is NewFriendEntityTab))
                {
                    _SafeStr_5168 = NewFriendEntityTab(_arg_1).friend.id;
                };
            };
        }

        public function selectFriendEntity(_arg_1:int):void
        {
            if (_SafeStr_5168 == _arg_1)
            {
                return;
            };
            var _local_2:FriendEntityTab = getFriendEntityTabByID(_arg_1);
            if (_local_2)
            {
                selectTab(_local_2, false);
                _SafeStr_5168 = _arg_1;
            };
        }

        public function deSelect(_arg_1:Boolean):void
        {
            if (_SafeStr_5175)
            {
                _SafeStr_5175.deselect(_arg_1);
                _SafeStr_5175 = null;
                _SafeStr_5168 = -1;
            };
        }

        public function getIconLocation(_arg_1:String):_SafeStr_3133
        {
            var _local_2:* = null;
            return (_SafeStr_3133(_SafeStr_5162.findChildByName(_arg_1)));
        }

        private function onRefreshView(_arg_1:Event):void
        {
            if (!isUserInterfaceReady())
            {
                buildUserInterface();
            }
            else
            {
                resizeAndPopulate(true);
            };
        }

        private function onFindFriendsNotification(_arg_1:FindFriendsNotificationEvent):void
        {
            var event = _arg_1;
            var title:String = ((event.success) ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}");
            var text:String = ((event.success) ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}");
            _windowManager.notify(title, text, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
            {
                _arg_1.dispose();
            }, 16);
        }

        private function onFriendRequestUpdate(_arg_1:FriendRequestUpdateEvent):void
        {
            if (_friendListIcon)
            {
                _friendListIcon.notify((_friendBarData.numFriendRequests > 0));
            };
            if (_SafeStr_5162)
            {
                updateFriendRequestCounter(_friendBarData.numFriendRequests);
                resizeAndPopulate(true);
            }
            else
            {
                buildUserInterface();
            };
        }

        protected function onTimerEvent(_arg_1:TimerEvent):void
        {
            _SafeStr_5161.visible = true;
            var _local_2:_SafeStr_3109 = (_SafeStr_5161.getChildByName("icon_1") as _SafeStr_3109);
            var _local_3:_SafeStr_3109 = (_SafeStr_5161.getChildByName("icon_2") as _SafeStr_3109);
            if (((_local_2) && (_local_3)))
            {
                if (_local_2.visible)
                {
                    _local_2.visible = false;
                    _local_3.visible = true;
                }
                else
                {
                    if (_local_3.visible)
                    {
                        _local_3.visible = false;
                        _local_2.visible = true;
                    };
                };
            };
        }

        private function notifyMessenger(_arg_1:Boolean):void
        {
            var _local_2:_SafeStr_3109 = (_SafeStr_5161.getChildByName("icon") as _SafeStr_3109);
            var _local_3:_SafeStr_3109 = (_SafeStr_5161.getChildByName("icon_1") as _SafeStr_3109);
            if (_arg_1)
            {
                if (!_SafeStr_4582)
                {
                    _local_2.visible = false;
                    _local_3.visible = true;
                    _SafeStr_4582 = new Timer(500, 0);
                    _SafeStr_4582.addEventListener("timer", onTimerEvent);
                    _SafeStr_4582.start();
                };
            }
            else
            {
                if (_SafeStr_4582 != null)
                {
                    _SafeStr_4582.removeEventListener("timer", onTimerEvent);
                    _SafeStr_4582.stop();
                    _SafeStr_4582 = null;
                };
                _local_2.visible = true;
                _local_3.visible = false;
                (_SafeStr_5161.getChildByName("icon_2") as _SafeStr_3109).visible = false;
            };
        }

        private function onNewInstantMessage(_arg_1:NewMessageEvent):void
        {
            if (_arg_1.notify)
            {
                _notifyMessengerOnStartup = true;
            };
            if (_SafeStr_5161)
            {
                if (_arg_1.notify)
                {
                    notifyMessenger(true);
                }
                else
                {
                    _SafeStr_5161.visible = true;
                    notifyMessenger(false);
                };
            };
            if (_SafeStr_5176)
            {
                if (_arg_1.notify)
                {
                    _SafeStr_5176.window.visible = true;
                };
            };
        }

        private function onFriendNotification(_arg_1:NotificationEvent):void
        {
            var _local_2:FriendEntityTab = getFriendEntityTabByID(_arg_1.friendId);
            if (!_local_2)
            {
                return;
            };
            _local_2.addNotificationToken(_arg_1.notification);
        }

        private function onRefreshMessengerConversations(_arg_1:ActiveConversationsCountEvent):void
        {
            if (_SafeStr_5161 != null)
            {
                _SafeStr_5161.visible = (!(_arg_1.activeConversationsCount == 0));
            };
        }

        private function onSessionDataPreferences(_arg_1:SessionDataPreferencesEvent):void
        {
            if (!(_arg_1.uiFlags & 0x01))
            {
                if (!_SafeStr_5163)
                {
                    toggleCollapsedState();
                };
            };
        }

        private function barWindowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:int;
            var _local_3:int;
            if (_arg_1.type == "WME_DOWN")
            {
                _local_4 = _SafeStr_5170;
                _local_3 = ((_friendBarData.numFriends + ((_SafeStr_5169) ? 1 : 0)) + ((_friendBarData.numFriendRequests > 0) ? 1 : 0));
                switch (_arg_2.name)
                {
                    case "button_left":
                        _local_4 = Math.max(0, (_SafeStr_5170 - 1));
                        break;
                    case "button_left_page":
                        _local_4 = Math.max(0, (_SafeStr_5170 - maxNumOfTabsVisible));
                        break;
                    case "button_left_end":
                        _local_4 = 0;
                        break;
                    case "button_right":
                        _local_4 = Math.max(0, Math.min((_local_3 - maxNumOfTabsVisible), (_SafeStr_5170 + 1)));
                        break;
                    case "button_right_page":
                        _local_4 = Math.max(0, Math.min((_local_3 - maxNumOfTabsVisible), (_SafeStr_5170 + maxNumOfTabsVisible)));
                        break;
                    case "button_right_end":
                        _local_4 = Math.max(0, (_local_3 - maxNumOfTabsVisible));
                        break;
                    case "button_close":
                        visible = false;
                        break;
                    case "border":
                        deSelect(true);
                        break;
                    case "link_friendlist":
                        _friendBarData.toggleFriendList();
                };
                if (_local_4 != _SafeStr_5170)
                {
                    deSelect(true);
                    _SafeStr_5170 = _local_4;
                    resizeAndPopulate(true);
                };
            };
            if (_arg_1.type == "WE_DEACTIVATED")
            {
                deSelect(true);
            };
        }

        private function setCollapseButtonVisibility():void
        {
            if (_SafeStr_5172)
            {
                _SafeStr_5172.visible = _SafeStr_5163;
            };
            if (_SafeStr_5173)
            {
                _SafeStr_5173.visible = (!(_SafeStr_5163));
            };
        }

        private function onCollapseFriendList(_arg_1:WindowMouseEvent):void
        {
            toggleCollapsedState();
        }

        private function toggleCollapsedState():void
        {
            _SafeStr_5163 = (!(_SafeStr_5163));
            _sessionDataManager.setFriendBarState((!(_SafeStr_5163)));
            deSelect(true);
            resizeAndPopulate(true);
            setCollapseButtonVisibility();
            if (!_SafeStr_5163)
            {
                resizeAndPopulate(true);
            };
            var _local_1:FriendBarResizeEvent = new FriendBarResizeEvent();
            events.dispatchEvent(_local_1);
        }

        private function onOpenMessenger(_arg_1:WindowMouseEvent):void
        {
            _friendBarData.toggleMessenger();
            notifyMessenger(false);
        }

        private function onOpenFriendsList(_arg_1:WindowMouseEvent):void
        {
            _friendBarData.toggleFriendList();
        }

        private function onOpenSearchFriends(_arg_1:WindowMouseEvent):void
        {
            _friendBarData.openUserTextSearch();
        }

        public function removeMessengerNotifications():void
        {
            for each (var _local_1:ITab in _SafeStr_5166)
            {
                if ((_local_1 is FriendEntityTab))
                {
                    FriendEntityTab(_local_1).removeNotificationToken(-1, true);
                };
            };
        }

        public function updateFriendRequestCounter(_arg_1:int):void
        {
            var _local_2:* = null;
            if (!_SafeStr_5165)
            {
                _SafeStr_5165 = _windowManager.createUnseenItemCounter();
            };
            if (_SafeStr_5165)
            {
                _local_2 = (_SafeStr_5162.findChildByName("icon_all_friends") as IRegionWindow);
                if (_local_2)
                {
                    _local_2.addChild(_SafeStr_5165);
                    _SafeStr_5165.x = ((_local_2.width - _SafeStr_5165.width) - 5);
                    _SafeStr_5165.y = 0;
                    if (_arg_1 > 0)
                    {
                        _SafeStr_5165.visible = true;
                        _SafeStr_5165.findChildByName("count").caption = _arg_1.toString();
                    }
                    else
                    {
                        _SafeStr_5165.visible = false;
                    };
                };
            };
        }

        private function toggleWindowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_SafeStr_5164.visible)
            {
                if (_arg_1.type == "WME_DOWN")
                {
                    switch (_arg_2.name)
                    {
                        case "button_open":
                            visible = true;
                            return;
                    };
                };
            };
        }

        private function toggleArrowButtons(_arg_1:Boolean, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:IRegionWindow = (_SafeStr_5162.findChildByName("button_left_page") as IRegionWindow);
            var _local_5:IRegionWindow = (_SafeStr_5162.findChildByName("button_right_page") as IRegionWindow);
            if (_local_4 != null)
            {
                _local_4.visible = _arg_1;
                if (_arg_2)
                {
                    _local_4.enable();
                    _local_4.blend = 1;
                }
                else
                {
                    _local_4.disable();
                    _local_4.blend = 0.2;
                };
            };
            if (_local_5 != null)
            {
                _local_5.visible = _arg_1;
                if (_arg_3)
                {
                    _local_5.enable();
                    _local_5.blend = 1;
                }
                else
                {
                    _local_5.disable();
                    _local_5.blend = 0.2;
                };
            };
            arrangeWindows();
        }

        private function resizeAndPopulate(_arg_1:Boolean=false):void
        {
            var _local_2:* = null;
            var _local_3:int;
            if (!disposed)
            {
                if (_SafeStr_5162)
                {
                    _local_2 = _toolbar.getRect();
                    _SafeStr_5162.width = (_SafeStr_5162.parent.width - _local_2.right);
                    _SafeStr_5177.visible = (!(_SafeStr_5163));
                    if (!_arg_1)
                    {
                        _local_3 = maxNumOfTabsVisible;
                        if (_local_3 < _SafeStr_5166.length)
                        {
                            _arg_1 = true;
                        }
                        else
                        {
                            if (_local_3 > _SafeStr_5166.length)
                            {
                                if (_SafeStr_5166.length < 3)
                                {
                                    _arg_1 = true;
                                }
                                else
                                {
                                    if (_SafeStr_5166.length < (_friendBarData.numFriends + ((_SafeStr_5169) ? 1 : 0)))
                                    {
                                        _arg_1 = true;
                                    }
                                    else
                                    {
                                        if (numFriendEntityTabsVisible < _friendBarData.numFriends)
                                        {
                                            _arg_1 = true;
                                        };
                                    };
                                };
                            };
                        };
                    };
                    if (_arg_1)
                    {
                        populate();
                        arrangeWindows();
                    };
                    if (_SafeStr_5163)
                    {
                        _SafeStr_5162.x = (_SafeStr_5162.desktop.width - 150);
                    }
                    else
                    {
                        _SafeStr_5162.x = (_SafeStr_5162.desktop.width - _SafeStr_5162.width);
                        _SafeStr_5177.x = 1;
                    };
                };
            };
        }

        private function arrangeWindows():void
        {
            var _local_1:int;
            for each (var _local_2:_SafeStr_3109 in _SafeStr_5162.iterator)
            {
                if (_local_2.visible)
                {
                    _local_2.x = _local_1;
                    _local_1 = (_local_1 + _local_2.width);
                };
            };
            _SafeStr_5162.width = _local_1;
        }

        private function get numFriendEntityTabsVisible():int
        {
            var _local_2:int;
            var _local_3:int = _SafeStr_5166.length;
            while (_local_3-- > 0)
            {
                if ((_SafeStr_5166[_local_3] is FriendEntityTab))
                {
                    _local_2++;
                };
            };
            var _local_1:int = _SafeStr_5166.length;
            while (_local_1-- > 0)
            {
                if ((_SafeStr_5166[_local_1] is FriendEntityTab))
                {
                    _local_2++;
                };
            };
            return (_local_2);
        }

        private function get maxNumOfTabsVisible():int
        {
            var _local_1:IItemListWindow = (_SafeStr_5162.findChildByName("list") as IItemListWindow);
            var _local_2:_SafeStr_3133 = (_SafeStr_5162.findChildByName("friendtools") as _SafeStr_3133);
            return (int((((_SafeStr_5162.width - _local_2.width) - 16) / (127 + _local_1.spacing))));
        }

        private function onDesktopResized(_arg_1:_SafeStr_3116):void
        {
            resizeAndPopulate(true);
        }

        public function get linkPattern():String
        {
            return ("friendbar/");
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
                case "findfriends":
                    _friendBarData.findNewFriends();
                    return;
                case "user":
                    if (_local_2.length > 2)
                    {
                        _friendBarData.showProfileByName(_local_2[2]);
                    };
                    return;
                default:
                    _SafeStr_14.log(("HabboFriendBarView unknown link-type received: " + _local_2[1]));
                    return;
            };
        }


    }
}//package com.sulake.habbo.friendbar.view

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3134 = "_-Jw" (String#11081, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3185 = "_-jn" (String#5721, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3340 = "_-d10" (String#12853, DoABC#4)
// _SafeStr_3347 = "_-x1I" (String#12830, DoABC#4)
// _SafeStr_3367 = "_-41n" (String#5091, DoABC#4)
// _SafeStr_3377 = "_-1d" (String#2910, DoABC#4)
// _SafeStr_3920 = "_-V4" (String#2294, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5161 = "_-gK" (String#4386, DoABC#4)
// _SafeStr_5162 = "_-f1p" (String#1665, DoABC#4)
// _SafeStr_5163 = "_-F1k" (String#3265, DoABC#4)
// _SafeStr_5164 = "_-Hv" (String#4298, DoABC#4)
// _SafeStr_5165 = "_-PX" (String#4614, DoABC#4)
// _SafeStr_5166 = "_-U1w" (String#2390, DoABC#4)
// _SafeStr_5167 = "_-g1D" (String#11419, DoABC#4)
// _SafeStr_5168 = "_-ON" (String#6100, DoABC#4)
// _SafeStr_5169 = "_-51s" (String#14627, DoABC#4)
// _SafeStr_5170 = "_-x1C" (String#2797, DoABC#4)
// _SafeStr_5171 = "_-M14" (String#22401, DoABC#4)
// _SafeStr_5172 = "_-c1b" (String#10479, DoABC#4)
// _SafeStr_5173 = "_-F" (String#11044, DoABC#4)
// _SafeStr_5174 = "_-qZ" (String#4380, DoABC#4)
// _SafeStr_5175 = "_-qr" (String#9974, DoABC#4)
// _SafeStr_5176 = "_-91V" (String#25616, DoABC#4)
// _SafeStr_5177 = "_-g1C" (String#6539, DoABC#4)
// _SafeStr_8555 = "_-W1U" (String#25037, DoABC#4)
// _SafeStr_8574 = "_-U1r" (String#14514, DoABC#4)
// _SafeStr_8584 = "_-o1C" (String#40343, DoABC#4)
// _SafeStr_8585 = "_-11u" (String#35213, DoABC#4)
// _SafeStr_8586 = "_-ZE" (String#32040, DoABC#4)
// _SafeStr_8587 = "_-Un" (String#39401, DoABC#4)
// _SafeStr_8588 = "_-l1z" (String#40423, DoABC#4)
// _SafeStr_8589 = "_-J17" (String#38735, DoABC#4)
// _SafeStr_8590 = "_-E1p" (String#32391, DoABC#4)


