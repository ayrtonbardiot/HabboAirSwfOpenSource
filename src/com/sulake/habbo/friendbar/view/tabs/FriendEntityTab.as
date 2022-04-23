﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.tabs.FriendEntityTab

package com.sulake.habbo.friendbar.view.tabs
{
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendbar.data._SafeStr_3377;
    import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
    import com.sulake.habbo.friendbar.data.FriendNotification;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.window.motion._SafeStr_3336;
    import com.sulake.core.window.motion.Combo;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.ResizeTo;
    import com.sulake.core.window.motion.MoveTo;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components._SafeStr_3332;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.friendbar.view.tabs.tokens.RoomEventToken;
    import com.sulake.habbo.friendbar.view.tabs.tokens.AchievementToken;
    import com.sulake.habbo.friendbar.view.tabs.tokens.QuestToken;
    import com.sulake.habbo.friendbar.view.tabs.tokens.MessengerToken;
    import com.sulake.habbo.friendbar.view.tabs.tokens.GameToken;
    import com.sulake.habbo.friendbar.data.IFriendNotification;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.utils.getQualifiedClassName;

    public class FriendEntityTab extends Tab 
    {

        private static const _SafeStr_8566:String = "entity_xml";
        private static const _SafeStr_8567:String = "facebook_piece_xml";
        private static const CONTROLS_PIECE_RESOURCE:String = "controls_piece_xml";
        protected static const PIECES:String = "pieces";
        protected static const _SafeStr_8568:String = "icons";
        protected static const HEADER:String = "header";
        protected static const PROFILE:String = "region_profile";
        protected static const _SafeStr_8502:String = "facebook";
        protected static const CONTROLS:String = "controls";
        protected static const CANVAS:String = "canvas";
        protected static const NAME:String = "name";
        protected static const MESSAGE:String = "btn_message";
        protected static const MESSAGE_ICON:String = "icon_message";
        protected static const VISIT:String = "btn_visit";
        protected static const ICON:String = "icon";
        protected static const LABEL:String = "label";
        protected static const _SafeStr_8569:String = "notification";
        protected static const BTN_PROFILE:String = "button_profile";
        protected static const BTN_GAME:String = "btn_game";
        protected static const GAME_ICON:String = "icon_game";
        protected static const GAME_INVITE_ICON:String = "icon_game_invite";
        protected static const BUBBLE:String = "bubble";
        protected static const BUBBLE_MESSAGE:String = "bubble_message";
        protected static const BUBBLE_BUTTON_ACCEPT:String = "bubble_button_accept";
        protected static const _SafeStr_8570:String = "bubble_button_close";
        protected static const _SafeStr_8571:String = "bubble_click_region_reject";
        private static const DEFAULT_COLOR:uint = 10338138;
        private static const _SafeStr_8565:uint = 13891476;
        private static const TOKEN_ICON_TAG_NONE:String = null;
        private static const TOKEN_ICON_TAG_NOTIFY:String = "icon_tag_notify";
        private static const TOKEN_ICON_TAG_MESSAGE:String = "icon_tag_message";
        private static const TOKEN_ICON_TAG_GAME:String = "icon_tag_game";
        private static const _SafeStr_4027:Vector.<FriendEntityTab> = new Vector.<FriendEntityTab>();
        private static const _SafeStr_5723:Vector.<_SafeStr_3133> = new Vector.<_SafeStr_3133>();

        protected var _SafeStr_5720:_SafeStr_3377;
        protected var _SafeStr_5721:Vector.<Token>;
        protected var _isInGame:Boolean = false;
        protected var _SafeStr_5722:String;


        public static function allocate(_arg_1:_SafeStr_3377):FriendEntityTab
        {
            var _local_2:FriendEntityTab = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (FriendEntityTab)());
            _local_2._SafeStr_4031 = false;
            _local_2.friend = _arg_1;
            if (_arg_1.notifications.length > 0)
            {
                for each (var _local_3:FriendNotification in _arg_1.notifications)
                {
                    _local_2.addNotificationToken(_local_3);
                };
            };
            return (_local_2);
        }

        private static function purgeEntityPieces(_arg_1:_SafeStr_3133):void
        {
            var _local_3:* = null;
            var _local_4:IItemListWindow = IItemListWindow(_arg_1.getChildByName("pieces"));
            _local_3 = (_local_4.getListItemByName("facebook") as _SafeStr_3133);
            if (_local_3)
            {
                _local_3.dispose();
            };
            _local_3 = (_local_4.getListItemByName("controls") as _SafeStr_3133);
            if (_local_3)
            {
                _local_3.dispose();
            };
            var _local_5:Array = [];
            _local_4.groupListItemsWithTag("notification", _local_5);
            if (_local_5.length > 0)
            {
                for each (var _local_2:_SafeStr_3109 in _local_5)
                {
                    _local_2.parent = null;
                };
            };
            _arg_1.height = HEIGHT;
            _arg_1.y = 0;
        }


        public function set friend(_arg_1:_SafeStr_3377):void
        {
            _SafeStr_5720 = _arg_1;
            refresh();
        }

        public function get friend():_SafeStr_3377
        {
            return (_SafeStr_5720);
        }

        override public function recycle():void
        {
            if (!disposed)
            {
                if (!_SafeStr_4031)
                {
                    if (_window)
                    {
                        releaseFriendTabWindow(_window);
                        _window = null;
                    };
                    if (_SafeStr_5721)
                    {
                        while (_SafeStr_5721.length > 0)
                        {
                            _SafeStr_5721.pop().dispose();
                        };
                        _SafeStr_5721 = null;
                    };
                    _SafeStr_5720 = null;
                    _isInGame = false;
                    _SafeStr_5722 = "";
                    _SafeStr_4031 = true;
                    _SafeStr_4027.push(this);
                };
            };
        }

        override public function select(_arg_1:Boolean):void
        {
            var _local_9:* = null;
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_8:Boolean;
            var _local_10:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            if (!selected)
            {
                _local_9 = IItemListWindow(window.getChildByName("pieces"));
                _local_8 = false;
                if (((!(friend.realName == null)) && (!(friend.realName == ""))))
                {
                    _local_6 = (WINDOWING.buildFromXML((ASSETS.getAssetByName("facebook_piece_xml").content as XML)) as _SafeStr_3133);
                    _local_6.name = "facebook";
                    _local_10 = (_local_6.getChildByName("name") as ITextWindow);
                    _local_10.caption = friend.realName;
                    if (!_local_10.wordWrap)
                    {
                        CROPPER.crop(_local_10);
                    };
                    _local_7 = _SafeStr_3264(_local_6.getChildByName("icon"));
                    _local_7.bitmap = (ASSETS.getAssetByName(_local_7.bitmapAssetName).content as BitmapData);
                    _local_7.width = _local_7.bitmap.width;
                    _local_7.height = _local_7.bitmap.height;
                    _local_9.addListItem(_local_6);
                    _local_8 = true;
                };
                if (_SafeStr_5721)
                {
                    for each (var _local_11:Token in _SafeStr_5721)
                    {
                        _local_9.addListItem(_local_11.windowElement);
                        _local_8 = true;
                    };
                };
                if (friend.online)
                {
                    _local_6 = (WINDOWING.buildFromXML((ASSETS.getAssetByName("controls_piece_xml").content as XML)) as _SafeStr_3133);
                    _local_6.name = "controls";
                    _local_2 = _local_6.getChildByName("btn_message");
                    if (_local_2)
                    {
                        _local_2.addEventListener("WME_CLICK", onButtonClick);
                    };
                    if (!_isInGame)
                    {
                        _local_4 = _local_6.getChildByName("btn_game");
                        if (_local_4)
                        {
                            _local_4.visible = false;
                        };
                        _local_2 = _local_6.getChildByName("btn_visit");
                        if (_local_2)
                        {
                            if (friend.allowFollow)
                            {
                                _local_2.visible = true;
                                _local_2.addEventListener("WME_CLICK", onButtonClick);
                            }
                            else
                            {
                                _local_2.visible = false;
                            };
                        };
                    }
                    else
                    {
                        _local_3 = _local_6.getChildByName("btn_visit");
                        if (_local_3)
                        {
                            _local_3.visible = false;
                        };
                        _local_2 = _local_6.getChildByName("btn_game");
                        if (_local_2)
                        {
                            _local_5 = _SafeStr_5174.getLocalization((("gamecenter." + _SafeStr_5722) + ".name"));
                            _SafeStr_5174.registerParameter("friend.bar.game", "game", _local_5);
                            _SafeStr_5174.registerParameter("friend.bar.game.tip", "game", _local_5);
                            _local_2.visible = true;
                            _local_2.addEventListener("WME_CLICK", onButtonClick);
                        };
                    };
                    _local_2 = _local_6.getChildByName("button_profile");
                    if (_local_2)
                    {
                        _local_2.addEventListener("WME_CLICK", onButtonClick);
                    };
                    _local_9.addListItem(_local_6);
                    _local_8 = true;
                };
                if (((((_arg_1) && (false)) && (_local_8)) && (_SafeStr_3336.getMotionByTarget(window) == null)))
                {
                    _SafeStr_3336.runMotion(new Combo(new EaseOut(new ResizeTo(window, 80, window.width, _local_9.height), 3), new EaseOut(new MoveTo(window, 80, window.x, (HEIGHT - _local_9.height)), 3)));
                }
                else
                {
                    if (_local_8)
                    {
                        window.height = _local_9.height;
                    };
                    window.y = (HEIGHT - window.height);
                };
                super.select(_arg_1);
                if (_arg_1)
                {
                    if (TRACKING)
                    {
                        TRACKING.trackEventLog("FriendBar", "", "clicked", "", ((friend.logEventId > 0) ? friend.logEventId : 0));
                    };
                    friend.logEventId = -1;
                };
            };
        }

        override public function deselect(_arg_1:Boolean):void
        {
            var _local_3:int;
            var _local_4:* = null;
            if (selected)
            {
                if (_window)
                {
                    purgeEntityPieces(_window);
                    if (_SafeStr_5721)
                    {
                        _local_3 = (_SafeStr_5721.length - 1);
                        while (_local_3 > -1)
                        {
                            _local_4 = _SafeStr_5721[_local_3];
                            if (_local_4.viewOnce)
                            {
                                removeNotificationToken(_local_4.typeCode, _arg_1);
                            };
                            _local_3--;
                        };
                    };
                };
                super.deselect(_arg_1);
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("bubble");
            if (_local_2)
            {
                _local_2.visible = false;
            };
        }

        override protected function expose():void
        {
            super.expose();
            _window.color = ((exposed) ? 13891476 : 10338138);
            ITextWindow(_window.findChildByTag("label")).underline = exposed;
        }

        override protected function conceal():void
        {
            super.conceal();
            _window.color = ((exposed) ? 13891476 : 10338138);
            ITextWindow(_window.findChildByTag("label")).underline = exposed;
        }

        protected function refresh():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (!_window)
            {
                _window = allocateFriendTabWindow();
            };
            if (_SafeStr_5720)
            {
                _window.id = _SafeStr_5720.id;
                _local_2 = (IItemListWindow(_window.getChildByName("pieces")).getListItemByName("header") as _SafeStr_3133);
                _local_2.findChildByName("name").caption = _SafeStr_5720.name;
                CROPPER.crop((_local_2.getChildByName("name") as ITextWindow));
                _local_1 = _SafeStr_3264(_local_2.findChildByName("canvas"));
                if (_SafeStr_5720.id > 0)
                {
                    _local_1.bitmap = VIEW.getAvatarFaceBitmap(_SafeStr_5720.figure);
                }
                else
                {
                    _local_1.bitmap = VIEW.getGroupIconBitmap(_SafeStr_5720.figure);
                };
                _local_1.width = _local_1.bitmap.width;
                _local_1.height = _local_1.bitmap.height;
            };
        }

        private function allocateFriendTabWindow():_SafeStr_3133
        {
            var _local_1:_SafeStr_3133 = ((_SafeStr_5723.length > 0) ? _SafeStr_5723.pop() : (WINDOWING.buildFromXML((ASSETS.getAssetByName("entity_xml").content as XML)) as _SafeStr_3133));
            var _local_5:_SafeStr_3264 = _SafeStr_3264(_local_1.findChildByName("canvas"));
            var _local_4:IRegionWindow = IRegionWindow(_local_1.findChildByName("header"));
            var _local_3:IRegionWindow = IRegionWindow(_local_1.findChildByName("region_profile"));
            var _local_6:_SafeStr_3109 = _local_1.findChildByName("icons");
            var _local_2:_SafeStr_3332 = (_local_1.findChildByName("bubble") as _SafeStr_3332);
            _local_1.x = 0;
            _local_1.y = 0;
            _local_1.width = WIDTH;
            _local_1.height = HEIGHT;
            _local_1.addEventListener("WME_CLICK", onMouseClick);
            _local_1.addEventListener("WME_OVER", onMouseOver);
            _local_1.addEventListener("WME_OUT", onMouseOut);
            _local_4.addEventListener("WME_CLICK", onMouseClick);
            _local_4.addEventListener("WME_OVER", onMouseOver);
            _local_4.addEventListener("WME_OUT", onMouseOut);
            _local_3.addEventListener("WME_CLICK", onProfileMouseEvent);
            _local_3.toolTipCaption = _SafeStr_5174.getLocalization("infostand.profile.link.tooltip", "");
            _local_3.toolTipDelay = 100;
            _local_6.addEventListener("WME_CLICK", onMouseClick);
            _local_6.addEventListener("WME_OVER", onMouseOver);
            _local_6.addEventListener("WME_OUT", onMouseOut);
            _local_5.disposesBitmap = true;
            _local_2.procedure = bubbleEventProc;
            _local_2.y = -(_local_2.height + 5);
            _local_2.visible = false;
            return (_local_1);
        }

        private function releaseFriendTabWindow(_arg_1:_SafeStr_3133):void
        {
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            if (((_arg_1) && (!(_arg_1.disposed))))
            {
                _arg_1.procedure = null;
                _arg_1.removeEventListener("WME_CLICK", onMouseClick);
                _arg_1.removeEventListener("WME_OVER", onMouseOver);
                _arg_1.removeEventListener("WME_OUT", onMouseOut);
                _local_3 = IRegionWindow(_arg_1.findChildByName("header"));
                _local_3.removeEventListener("WME_CLICK", onMouseClick);
                _local_3.removeEventListener("WME_OVER", onMouseOver);
                _local_3.removeEventListener("WME_OUT", onMouseOut);
                _local_5 = _arg_1.findChildByName("icons");
                _local_5.removeEventListener("WME_CLICK", onMouseClick);
                _local_5.removeEventListener("WME_OVER", onMouseClick);
                _local_5.removeEventListener("WME_OUT", onMouseClick);
                _local_2 = IRegionWindow(_arg_1.findChildByName("region_profile"));
                _local_2.removeEventListener("WME_CLICK", onProfileMouseEvent);
                _arg_1.width = WIDTH;
                _arg_1.height = HEIGHT;
                _arg_1.color = 10338138;
                _local_4 = _SafeStr_3264(_arg_1.findChildByName("canvas"));
                _local_4.bitmap = null;
                ITextWindow(_arg_1.findChildByTag("label")).underline = false;
                purgeEntityPieces(_arg_1);
                if (_SafeStr_5723.indexOf(_arg_1) == -1)
                {
                    _SafeStr_5723.push(_arg_1);
                };
            };
        }

        private function onButtonClick(_arg_1:WindowMouseEvent):void
        {
            if (((!(disposed)) && (!(recycled))))
            {
                switch (_arg_1.window.name)
                {
                    case "btn_message":
                    case "icon_message":
                        VIEW.removeMessengerNotifications();
                        if (((DATA) && (_SafeStr_5720)))
                        {
                            DATA.startConversation(_SafeStr_5720.id);
                            deselect(true);
                            if (_arg_1.window.name == "icon_message")
                            {
                                VIEW.setMessengerIconNotify(false);
                            };
                        };
                        return;
                    case "btn_visit":
                        if (((DATA) && (_SafeStr_5720)))
                        {
                            DATA.followToRoom(_SafeStr_5720.id);
                            deselect(true);
                        };
                        return;
                    case "button_profile":
                        if (((DATA) && (_SafeStr_5720)))
                        {
                            TRACKING.trackGoogle("extendedProfile", "friendToolbar_friendButton");
                            DATA.showProfile(_SafeStr_5720.id);
                            deselect(true);
                        };
                        return;
                    case "btn_game":
                    case "icon_game":
                        if (GAMES)
                        {
                            deselect(true);
                            GAMES.initGameDirectoryConnection();
                            DATA.sendGameButtonTracking(_SafeStr_5722);
                        };
                        return;
                    case "icon_game_invite":
                        deselect(true);
                        showBubble();
                        return;
                };
            };
        }

        private function showBubble():void
        {
            var _local_1:* = null;
            if (_window)
            {
                _local_1 = _window.findChildByName("bubble");
                _window.findChildByName("bubble_message").caption = _SafeStr_5174.getLocalization((("gamecenter." + _SafeStr_5722) + ".name"));
                _local_1.visible = true;
            };
        }

        protected function onProfileMouseEvent(_arg_1:WindowMouseEvent):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                TRACKING.trackGoogle("extendedProfile", "friendBar_friendAvatar");
                DATA.showProfile(_SafeStr_5720.id);
                deselect(true);
            };
        }

        public function addNotificationToken(_arg_1:IFriendNotification):void
        {
            var _local_6:*;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            removeNotificationToken(_arg_1.typeCode, false);
            if (!_SafeStr_5721)
            {
                _SafeStr_5721 = new Vector.<Token>();
            };
            var _local_2:Boolean = selected;
            if (_local_2)
            {
                _local_6 = _SafeStr_5721;
                _SafeStr_5721 = null;
                deselect(false);
                _SafeStr_5721 = _local_6;
            };
            var _local_3:String;
            switch (_arg_1.typeCode)
            {
                case 0:
                    _local_7 = new RoomEventToken(friend, _arg_1);
                    _local_7.iconElement.addEventListener("WME_CLICK", onMouseClick);
                    _local_3 = "icon_tag_notify";
                    break;
                case 1:
                    _local_7 = new AchievementToken(friend, _arg_1, _SafeStr_5174);
                    _local_7.iconElement.addEventListener("WME_CLICK", onMouseClick);
                    _local_3 = "icon_tag_notify";
                    break;
                case 2:
                    _local_7 = new QuestToken(friend, _arg_1);
                    _local_7.iconElement.addEventListener("WME_CLICK", onMouseClick);
                    _local_3 = "icon_tag_notify";
                    break;
                case -1:
                    _local_7 = new MessengerToken(friend, _arg_1);
                    _local_7.iconElement.name = "icon_message";
                    _local_7.iconElement.addEventListener("WME_CLICK", onButtonClick);
                    _local_3 = "icon_tag_message";
                    break;
                case 3:
                    _local_7 = new GameToken(friend, _arg_1);
                    _local_7.iconElement.name = "icon_game";
                    _local_7.iconElement.addEventListener("WME_CLICK", onMouseClick);
                    _local_3 = "icon_tag_game";
                    _isInGame = true;
                    _SafeStr_5722 = _local_7.notification.message;
                    break;
                case 4:
                    removeNotificationToken(3, true);
                    _isInGame = false;
                    return;
                default:
                    throw (new Error((("Unknown friend notification type: " + _arg_1.typeCode) + "!")));
            };
            if (_local_7)
            {
                _SafeStr_5721.push(_local_7);
                if (_local_3 != null)
                {
                    _local_5 = IItemListWindow(_window.findChildByName("icons"));
                    if (!_local_5.getListItemByTag(_local_3))
                    {
                        _local_4 = _local_7.iconElement;
                        if (_local_4.tags.indexOf(_local_3) == -1)
                        {
                            _local_4.tags.push(_local_3);
                        };
                        _local_5.addListItemAt(_local_4, 0);
                    };
                };
            };
            if (_local_2)
            {
                select(false);
            };
        }

        public function removeNotificationToken(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_3:int;
            var _local_4:* = null;
            if (!_SafeStr_5721)
            {
                return;
            };
            _local_3 = (_SafeStr_5721.length - 1);
            while (_local_3 > -1)
            {
                _local_4 = _SafeStr_5721[_local_3];
                if (_local_4.typeCode == _arg_1)
                {
                    _SafeStr_5721.splice(_local_3, 1);
                    if (_arg_2)
                    {
                        _SafeStr_5720.notifications.splice(_SafeStr_5720.notifications.indexOf(_local_4.notification), 1);
                    };
                    _local_4.dispose();
                    return;
                };
                _local_3--;
            };
        }

        private function bubbleEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "bubble_button_accept":
                    case "bubble_button_close":
                    case "bubble_click_region_reject":
                        deselect(true);
                        return;
                };
            };
        }

        public function toString():String
        {
            return ((getQualifiedClassName(this) + " ") + _SafeStr_5720.name);
        }


    }
}//package com.sulake.habbo.friendbar.view.tabs

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3332 = "_-s1R" (String#3135, DoABC#4)
// _SafeStr_3336 = "_-TU" (String#3431, DoABC#4)
// _SafeStr_3377 = "_-1d" (String#2910, DoABC#4)
// _SafeStr_4027 = "_-r1I" (String#1329, DoABC#4)
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_5174 = "_-qZ" (String#4380, DoABC#4)
// _SafeStr_5720 = "_-S6" (String#1655, DoABC#4)
// _SafeStr_5721 = "_-FB" (String#1889, DoABC#4)
// _SafeStr_5722 = "_-A1H" (String#4927, DoABC#4)
// _SafeStr_5723 = "_-c5" (String#5304, DoABC#4)
// _SafeStr_8502 = "_-LE" (String#30556, DoABC#4)
// _SafeStr_8565 = "_-Rm" (String#10674, DoABC#4)
// _SafeStr_8566 = "_-Hj" (String#30290, DoABC#4)
// _SafeStr_8567 = "_-41s" (String#31275, DoABC#4)
// _SafeStr_8568 = "_-Z1a" (String#31336, DoABC#4)
// _SafeStr_8569 = "_-n1p" (String#29176, DoABC#4)
// _SafeStr_8570 = "_-i1U" (String#30307, DoABC#4)
// _SafeStr_8571 = "_-c1P" (String#29208, DoABC#4)


