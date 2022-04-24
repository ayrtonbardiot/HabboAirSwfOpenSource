// by nota

//com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab

package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3332;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.data.FriendRequest;

    public class FriendRequestsTab extends Tab 
    {

        protected static const REQUESTS_WINDOW_RESOURCE:String = "friend_requests_tab_xml";
        protected static const ICON:String = "icon";
        protected static const LABEL:String = "label";
        protected static const HEADER:String = "header";
        protected static const CANVAS:String = "canvas";
        protected static const BUBBLE:String = "bubble";
        protected static const REQUEST_LIST:String = "request_entity_list";
        protected static const NAME:String = "name";
        protected static const COUNTER:String = "badge_counter";
        protected static const REGION_PROFILE:String = "region_profile";
        protected static const REGION_PROFILE_NAME:String = "region_profile_name";
        protected static const _SafeStr_8572:String = "button_accept_all";
        protected static const _SafeStr_8573:String = "click_area_discard_all";
        protected static const _SafeStr_8574:String = "button_close";
        protected static const BUTTON_ACCEPT:String = "button_accept";
        protected static const _SafeStr_8575:String = "click_area_discard";
        protected static const _SafeStr_8576:String = "text_discard";
        private static const DEFAULT_COLOR:uint = 4294625561;
        private static const _SafeStr_8565:uint = 0xFFFFD966;
        private static const _SafeStr_8577:uint = 4289431312;
        private static const _SafeStr_8578:uint = 4290616362;
        private static const REGION_REJECT_COLOR_EXPOSED:uint = 16770666;
        private static const REGION_REJECT_COLOR_NORMAL:uint = 0xFFFFFF;

        private static var _SafeStr_5850:FriendRequestsTab;

        private var _SafeStr_4369:Array;
        private var _SafeStr_6216:Boolean = false;
        private var _entity:_SafeStr_3133;

        public function FriendRequestsTab()
        {
            _window = allocateRequestsTabWindow();
        }

        public static function allocate(_arg_1:Array):FriendRequestsTab
        {
            var _local_2:FriendRequestsTab = ((_SafeStr_5850) ? _SafeStr_5850 : new (FriendRequestsTab)());
            _local_2._SafeStr_4031 = false;
            _local_2._SafeStr_4369 = _arg_1;
            _local_2._window.findChildByName("badge_counter").caption = _arg_1.length;
            return (_local_2);
        }


        override public function dispose():void
        {
            if (_window)
            {
                releaseRequestsTabWindow(_window);
                _window = null;
            };
            if (_entity)
            {
                _entity.dispose();
                _entity = null;
            };
            super.dispose();
        }

        override public function recycle():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (!disposed)
            {
                if (!_SafeStr_4031)
                {
                    if (_window)
                    {
                        _local_1 = (_window.findChildByName("bubble") as _SafeStr_3332);
                        if (_local_1)
                        {
                            _local_2 = (_local_1.content.getChildByName("request_entity_list") as IItemListWindow);
                            if (_local_2)
                            {
                                while (_local_2.numListItems > 0)
                                {
                                    _local_2.removeListItemAt(0).dispose();
                                };
                            };
                        };
                    };
                    _SafeStr_6216 = false;
                    _SafeStr_4369 = null;
                    _SafeStr_4031 = true;
                    _SafeStr_5850 = this;
                };
            };
        }

        override public function select(_arg_1:Boolean):void
        {
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_8:* = null;
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_9:int;
            var _local_6:int;
            var _local_4:* = null;
            if (!selected)
            {
                if (_window)
                {
                    _local_3 = (_window.findChildByName("bubble") as _SafeStr_3332);
                    if (_local_3)
                    {
                        _local_3.visible = true;
                        if (!_SafeStr_6216)
                        {
                            _local_7 = (_local_3.content.getChildByName("request_entity_list") as IItemListWindow);
                            if (_local_7)
                            {
                                _local_9 = 0;
                                _local_6 = 0;
                                while (_local_6 < _SafeStr_4369.length)
                                {
                                    _local_8 = (_entity.clone() as _SafeStr_3133);
                                    _local_8.color = (((_local_6 % 2) == 0) ? 4289431312 : 4290616362);
                                    _local_2 = _SafeStr_4369[_local_6];
                                    _local_8.id = _local_2.id;
                                    _local_8.findChildByName("name").caption = _local_2.name;
                                    _local_5 = (_local_8.findChildByName("canvas") as _SafeStr_3264);
                                    _local_4 = VIEW.getAvatarFaceBitmap(_local_2.figure);
                                    if (_local_4)
                                    {
                                        _local_5.disposesBitmap = false;
                                        _local_5.bitmap = _local_4;
                                        _local_5.width = _local_4.width;
                                        _local_5.height = _local_4.height;
                                        _local_5.disposesBitmap = true;
                                    };
                                    _local_7.addListItem(_local_8);
                                    _local_9 = (_local_9 + (_local_8.height + _local_7.spacing));
                                    _local_6++;
                                };
                                _local_7.height = _local_9;
                            };
                        };
                        _SafeStr_6216 = true;
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
            _window.color = ((exposed) ? 0xFFFFD966 : 4294625561);
            ITextWindow(_window.findChildByTag("label")).underline = exposed;
        }

        override protected function conceal():void
        {
            super.conceal();
            _window.color = ((exposed) ? 0xFFFFD966 : 4294625561);
            ITextWindow(_window.findChildByTag("label")).underline = exposed;
        }

        private function allocateRequestsTabWindow():_SafeStr_3133
        {
            var _local_8:* = null;
            var _local_1:_SafeStr_3133 = (WINDOWING.buildFromXML((ASSETS.getAssetByName("friend_requests_tab_xml").content as XML)) as _SafeStr_3133);
            var _local_7:_SafeStr_3264 = _SafeStr_3264(_local_1.findChildByName("canvas"));
            var _local_6:IRegionWindow = IRegionWindow(_local_1.findChildByName("header"));
            var _local_5:IRegionWindow = IRegionWindow(_local_1.findChildByName("region_profile"));
            var _local_2:IRegionWindow = IRegionWindow(_local_1.findChildByName("region_profile_name"));
            var _local_4:_SafeStr_3332 = (_local_1.findChildByName("bubble") as _SafeStr_3332);
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
            _local_5.toolTipCaption = _SafeStr_5174.getLocalization("infostand.profile.link.tooltip", "");
            _local_5.toolTipDelay = 100;
            _local_2.toolTipCaption = _SafeStr_5174.getLocalization("infostand.profile.link.tooltip", "");
            _local_2.toolTipDelay = 100;
            _local_7.disposesBitmap = true;
            _local_4.visible = false;
            _local_4.y = (-(_local_4.height - (_local_4.height - _local_4.margins.bottom)) - 1);
            _local_4.procedure = bubbleEventProc;
            _local_8 = (ASSETS.getAssetByName("add_friends_icon_png") as BitmapDataAsset);
            var _local_3:_SafeStr_3264 = (_local_1.findChildByName("icon") as _SafeStr_3264);
            _local_3.disposesBitmap = false;
            _local_3.bitmap = (_local_8.content as BitmapData);
            var _local_9:IItemListWindow = (_local_4.content.getChildByName("request_entity_list") as IItemListWindow);
            _entity = (_local_9.removeListItemAt(0) as _SafeStr_3133);
            return (_local_1);
        }

        private function releaseRequestsTabWindow(_arg_1:_SafeStr_3133):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (((_arg_1) && (!(_arg_1.disposed))))
            {
                _arg_1.procedure = null;
                _arg_1.removeEventListener("WME_CLICK", onMouseClick);
                _arg_1.removeEventListener("WME_OVER", onMouseOver);
                _arg_1.removeEventListener("WME_OUT", onMouseOut);
                _local_2 = IRegionWindow(_arg_1.findChildByName("header"));
                _local_2.removeEventListener("WME_CLICK", onMouseClick);
                _local_2.removeEventListener("WME_OVER", onMouseOver);
                _local_2.removeEventListener("WME_OUT", onMouseOut);
                _arg_1.width = WIDTH;
                _arg_1.height = HEIGHT;
                _arg_1.color = 4294625561;
                _local_3 = _SafeStr_3264(_arg_1.findChildByName("canvas"));
                if (_local_3)
                {
                    _local_3.bitmap = null;
                };
                ITextWindow(_arg_1.findChildByTag("label")).underline = false;
            };
        }

        private function bubbleEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "button_close":
                        if (selected)
                        {
                            VIEW.deSelect(true);
                        };
                        break;
                    case "button_accept_all":
                        DATA.acceptAllFriendRequests();
                        break;
                    case "click_area_discard_all":
                        DATA.declineAllFriendRequests();
                        break;
                    case "button_accept":
                        DATA.acceptFriendRequest(_arg_2.parent.id);
                        break;
                    case "click_area_discard":
                        DATA.declineFriendRequest(_arg_2.parent.id);
                        break;
                    case "region_profile":
                        TRACKING.trackGoogle("extendedProfile", "friendBar_multipleFriendRequestsAvatar");
                        DATA.showProfile(_arg_2.parent.id);
                        break;
                    case "region_profile_name":
                        TRACKING.trackGoogle("extendedProfile", "friendBar_multipleFriendRequestsName");
                        DATA.showProfile(_arg_2.parent.id);
                };
            }
            else
            {
                if (_arg_1.type == "WME_OVER")
                {
                    if (_arg_2.name == "click_area_discard")
                    {
                        ITextWindow(_SafeStr_3133(_arg_2).getChildByName("text_discard")).textColor = 16770666;
                    };
                    if (_arg_2.name == "region_profile_name")
                    {
                        ITextWindow(_SafeStr_3133(_arg_2).getChildByName("name")).underline = true;
                    };
                }
                else
                {
                    if (_arg_1.type == "WME_OUT")
                    {
                        if (_arg_2.name == "click_area_discard")
                        {
                            ITextWindow(_SafeStr_3133(_arg_2).getChildByName("text_discard")).textColor = 0xFFFFFF;
                        };
                        if (_arg_2.name == "region_profile_name")
                        {
                            ITextWindow(_SafeStr_3133(_arg_2).getChildByName("name")).underline = false;
                        };
                    };
                };
            };
        }

        public function avatarImageReady(_arg_1:FriendRequest, _arg_2:BitmapData):void
        {
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_5:int;
            var _local_3:* = null;
            if (disposed)
            {
                return;
            };
            var _local_4:_SafeStr_3332 = (_window.findChildByName("bubble") as _SafeStr_3332);
            if (_local_4)
            {
                _local_6 = (_local_4.content.getChildByName("request_entity_list") as IItemListWindow);
                if (_local_6)
                {
                    _local_5 = 0;
                    while (_local_5 < _local_6.numListItems)
                    {
                        _local_7 = (_local_6.getListItemAt(_local_5) as _SafeStr_3133);
                        if (_local_7.id == _arg_1.id)
                        {
                            _local_3 = (_local_7.findChildByName("canvas") as _SafeStr_3264);
                            _local_3.disposesBitmap = true;
                            _local_3.bitmap = _arg_2;
                            _local_3.width = _arg_2.width;
                            _local_3.height = _arg_2.height;
                            return;
                        };
                        _local_5++;
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
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_4369 = "_-cz" (String#2498, DoABC#4)
// _SafeStr_5174 = "_-qZ" (String#4380, DoABC#4)
// _SafeStr_5850 = "_-yd" (String#5011, DoABC#4)
// _SafeStr_6216 = "_-41X" (String#13272, DoABC#4)
// _SafeStr_8565 = "_-Rm" (String#10674, DoABC#4)
// _SafeStr_8572 = "_-a1E" (String#37086, DoABC#4)
// _SafeStr_8573 = "_-ue" (String#31582, DoABC#4)
// _SafeStr_8574 = "_-U1r" (String#14514, DoABC#4)
// _SafeStr_8575 = "_-pv" (String#32279, DoABC#4)
// _SafeStr_8576 = "_-Cy" (String#39661, DoABC#4)
// _SafeStr_8577 = "_-Q1P" (String#40229, DoABC#4)
// _SafeStr_8578 = "_-sy" (String#34373, DoABC#4)


