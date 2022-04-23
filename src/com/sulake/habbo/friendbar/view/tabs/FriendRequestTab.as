﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.tabs.FriendRequestTab

package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.friendbar.data.FriendEntity;
    import com.sulake.habbo.friendbar.data._SafeStr_3367;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3332;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.friendbar.data.FriendRequest;

    public class FriendRequestTab extends FriendEntityTab 
    {

        protected static const REQUEST_WINDOW_RESOURCE:String = "friend_request_tab_xml";
        protected static const BUBBLE:String = "bubble";
        protected static const MESSAGE:String = "message";
        protected static const BUTTON_ACCEPT:String = "button_accept";
        protected static const _SafeStr_8574:String = "button_close";
        protected static const REGION_REJECT:String = "click_region_reject";
        protected static const REGION_REJECT_TEXT:String = "link_reject";
        private static const DEFAULT_COLOR:uint = 16435481;
        private static const _SafeStr_8565:uint = 16767334;
        private static const REGION_REJECT_COLOR_EXPOSED:uint = 16770666;
        private static const REGION_REJECT_COLOR_NORMAL:uint = 0xFFFFFF;

        private static var _SafeStr_5850:FriendRequestTab;

        private var _SafeStr_8579:String;

        public function FriendRequestTab()
        {
            _window = allocateRequestTabWindow();
            if (_window)
            {
                _window.findChildByName("bubble").visible = false;
            };
        }

        public static function allocate(_arg_1:_SafeStr_3367):FriendRequestTab
        {
            var _local_3:* = null;
            var _local_2:FriendRequestTab = ((_SafeStr_5850) ? _SafeStr_5850 : new (FriendRequestTab)());
            _local_2._SafeStr_4031 = false;
            if (_local_2.friend)
            {
                if (_local_2.friend.figure != _arg_1.figure)
                {
                    _local_3 = _SafeStr_3264(_local_2._window.findChildByName("canvas"));
                    _local_3.bitmap = VIEW.getAvatarFaceBitmap(_arg_1.figure);
                };
            };
            _local_2.friend = new FriendEntity(_arg_1.id, _arg_1.name, null, null, -1, false, false, _arg_1.figure, 0, null);
            return (_local_2);
        }


        override public function dispose():void
        {
            if (_window)
            {
                releaseRequestTabWindow(_window);
                _window = null;
            };
            super.dispose();
        }

        override public function recycle():void
        {
            if (!disposed)
            {
                if (!_SafeStr_4031)
                {
                    _SafeStr_5720 = null;
                    _SafeStr_4031 = true;
                    _SafeStr_5850 = this;
                };
            };
        }

        override public function select(_arg_1:Boolean):void
        {
            var _local_2:* = null;
            if (!selected)
            {
                if (_window)
                {
                    _local_2 = _window.findChildByName("bubble");
                    if (_local_2)
                    {
                        _local_2.visible = true;
                    };
                };
                super.select(_arg_1);
            };
        }

        override public function deselect(_arg_1:Boolean):void
        {
            var _local_2:* = null;
            if (selected)
            {
                if (_window)
                {
                    _local_2 = _window.findChildByName("bubble");
                    if (_local_2)
                    {
                        _local_2.visible = false;
                    };
                };
                super.deselect(_arg_1);
            };
        }

        override protected function expose():void
        {
            super.expose();
            _window.color = ((exposed) ? 16767334 : 16435481);
        }

        override protected function conceal():void
        {
            super.conceal();
            _window.color = ((exposed) ? 16767334 : 16435481);
        }

        private function allocateRequestTabWindow():_SafeStr_3133
        {
            var _local_9:* = null;
            var _local_1:_SafeStr_3133 = (WINDOWING.buildFromXML((ASSETS.getAssetByName("friend_request_tab_xml").content as XML)) as _SafeStr_3133);
            var _local_7:_SafeStr_3264 = _SafeStr_3264(_local_1.findChildByName("canvas"));
            var _local_6:IRegionWindow = IRegionWindow(_local_1.findChildByName("header"));
            var _local_3:IRegionWindow = IRegionWindow(_local_1.findChildByName("region_profile"));
            var _local_8:_SafeStr_3109 = _local_1.findChildByName("icons");
            var _local_2:_SafeStr_3332 = (_local_1.findChildByName("bubble") as _SafeStr_3332);
            _local_1.x = 0;
            _local_1.y = 0;
            _local_1.width = WIDTH;
            _local_1.height = HEIGHT;
            _local_1.addEventListener("WME_CLICK", onMouseClick);
            _local_1.addEventListener("WME_OVER", onMouseOver);
            _local_1.addEventListener("WME_OUT", onMouseOut);
            _local_6.addEventListener("WME_CLICK", onMouseClick);
            _local_6.addEventListener("WME_OVER", onMouseOver);
            _local_6.addEventListener("WME_OUT", onMouseOut);
            _local_3.addEventListener("WME_CLICK", onProfileMouseEvent);
            _local_3.toolTipCaption = _SafeStr_5174.getLocalization("infostand.profile.link.tooltip", "");
            _local_3.toolTipDelay = 100;
            _local_8.addEventListener("WME_CLICK", onMouseClick);
            _local_8.addEventListener("WME_OVER", onMouseOver);
            _local_8.addEventListener("WME_OUT", onMouseOut);
            _local_7.disposesBitmap = true;
            _local_2.procedure = bubbleEventProc;
            _local_2.y = (-(_local_2.height - (_local_2.height - _local_2.margins.bottom)) - 1);
            var _local_5:IRegionWindow = (WINDOWING.create("ICON", 5, 0, 1, new Rectangle(0, 0, 25, 25)) as IRegionWindow);
            _local_5.mouseThreshold = 0;
            var _local_4:_SafeStr_3264 = (WINDOWING.create("BITMAP", 21, 0, 16, new Rectangle(0, 0, 25, 25)) as _SafeStr_3264);
            _local_4.disposesBitmap = false;
            _local_9 = (ASSETS.getAssetByName("plus_friend_icon_png") as BitmapDataAsset);
            if (_local_9)
            {
                _local_4.bitmap = (_local_9.content as BitmapData);
            };
            _local_5.addChild(_local_4);
            IItemListWindow(_local_1.findChildByName("icons")).addListItemAt(_local_5, 0);
            return (_local_1);
        }

        private function releaseRequestTabWindow(_arg_1:_SafeStr_3133):void
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
                _arg_1.color = 16435481;
                _local_4 = _SafeStr_3264(_arg_1.findChildByName("canvas"));
                _local_4.bitmap = null;
                ITextWindow(_arg_1.findChildByTag("label")).underline = false;
            };
        }

        private function bubbleEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "button_accept":
                        DATA.acceptFriendRequest(_SafeStr_5720.id);
                        break;
                    case "button_close":
                        if (selected)
                        {
                            VIEW.deSelect(true);
                        };
                        break;
                    case "button_profile":
                        TRACKING.trackGoogle("extendedProfile", "friendBar_friendRequestButton");
                        DATA.showProfile(_SafeStr_5720.id);
                        break;
                    case "click_region_reject":
                        DATA.declineFriendRequest(_SafeStr_5720.id);
                };
            }
            else
            {
                if (_arg_1.type == "WME_OVER")
                {
                    if (_arg_2.name == "click_region_reject")
                    {
                        ITextWindow(_SafeStr_3133(_arg_2).getChildByName("link_reject")).textColor = 16770666;
                    };
                    if (_arg_2.name == "button_profile")
                    {
                        IIconWindow(_SafeStr_3133(_arg_2).findChildByName("icon")).style = 22;
                    };
                    if (_arg_2.name == "region_profile")
                    {
                        ITextWindow(_SafeStr_3133(_arg_2).getChildByName("name")).underline = true;
                    };
                }
                else
                {
                    if (_arg_1.type == "WME_OUT")
                    {
                        if (_arg_2.name == "click_region_reject")
                        {
                            ITextWindow(_SafeStr_3133(_arg_2).getChildByName("link_reject")).textColor = 0xFFFFFF;
                        };
                        if (_arg_2.name == "button_profile")
                        {
                            IIconWindow(_SafeStr_3133(_arg_2).findChildByName("icon")).style = 21;
                        };
                        if (_arg_2.name == "region_profile")
                        {
                            ITextWindow(_SafeStr_3133(_arg_2).getChildByName("name")).underline = false;
                        };
                    };
                };
            };
        }

        public function avatarImageReady(_arg_1:FriendRequest, _arg_2:BitmapData):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            if (!disposed)
            {
                if (friend)
                {
                    if (friend.figure == _arg_1.figure)
                    {
                        _local_4 = (_window.findChildByName("canvas") as _SafeStr_3264);
                        if (_local_4)
                        {
                            _local_3 = VIEW.getAvatarFaceBitmap(_arg_1.figure);
                            if (_local_3)
                            {
                                _local_4.bitmap = _local_3;
                                _local_4.width = _local_3.width;
                                _local_4.height = _local_3.height;
                            };
                        };
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.friendbar.view.tabs

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3332 = "_-s1R" (String#3135, DoABC#4)
// _SafeStr_3367 = "_-41n" (String#5091, DoABC#4)
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_5174 = "_-qZ" (String#4380, DoABC#4)
// _SafeStr_5720 = "_-S6" (String#1655, DoABC#4)
// _SafeStr_5850 = "_-yd" (String#5011, DoABC#4)
// _SafeStr_8565 = "_-Rm" (String#10674, DoABC#4)
// _SafeStr_8574 = "_-U1r" (String#14514, DoABC#4)
// _SafeStr_8579 = "_-g1K" (String#29967, DoABC#4)


