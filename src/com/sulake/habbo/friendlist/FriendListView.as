// by nota

//com.sulake.habbo.friendlist.FriendListView

package com.sulake.habbo.friendlist
{
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.Dictionary;

    public class FriendListView 
    {

        private static const DEFAULT_LOCATION:Point = new Point(110, 50);
        private static const MIN_LEFT_MARGIN:int = 110;
        private static const _SafeStr_8555:int = 1;

        private var _friendList:HabboFriendList;
        private var _SafeStr_4788:FriendListTabsView;
        private var _SafeStr_4079:_SafeStr_3263;
        private var _SafeStr_4789:_SafeStr_3133;
        private var _footer:_SafeStr_3133;
        private var _SafeStr_4787:ITextWindow;
        private var _SafeStr_4480:int = -1;
        private var _lastWindowWidth:int = -1;
        private var _ignoreResizeEvents:Boolean;

        public function FriendListView(_arg_1:HabboFriendList)
        {
            _friendList = _arg_1;
            _SafeStr_4788 = new FriendListTabsView(_friendList);
        }

        public function openFriendList():void
        {
            if (_SafeStr_4079 == null)
            {
                prepare();
                _SafeStr_4079.position = DEFAULT_LOCATION;
            }
            else
            {
                _SafeStr_4079.visible = true;
                _SafeStr_4079.activate();
            };
        }

        public function showInfo(_arg_1:_SafeStr_3116, _arg_2:String):void
        {
            var _local_3:WindowMouseEvent = (_arg_1 as WindowMouseEvent);
            if (_local_3 == null)
            {
                return;
            };
            if (_local_3.type == "WME_OUT")
            {
                _SafeStr_4787.text = "";
            }
            else
            {
                if (_local_3.type == "WME_OVER")
                {
                    _SafeStr_4787.text = _arg_2;
                };
            };
        }

        public function refresh(_arg_1:String):void
        {
            if (this._SafeStr_4079 == null)
            {
                return;
            };
            _SafeStr_4788.refresh(_arg_1);
            refreshWindowSize();
        }

        public function close():void
        {
            if (this._SafeStr_4079 != null)
            {
                this._SafeStr_4079.visible = false;
            };
        }

        public function isOpen():Boolean
        {
            return ((_SafeStr_4079) && (_SafeStr_4079.visible));
        }

        private function prepare():void
        {
            _SafeStr_4079 = _SafeStr_3263(_friendList.getXmlWindow("main_window"));
            _SafeStr_4079.findChildByTag("close").procedure = onWindowClose;
            _SafeStr_4789 = _SafeStr_3133(_SafeStr_4079.content.findChildByName("main_content"));
            _footer = _SafeStr_3133(_SafeStr_4079.content.findChildByName("footer"));
            _SafeStr_4788.prepare(_SafeStr_4789);
            _SafeStr_4079.procedure = onWindow;
            _SafeStr_4079.content.setParamFlag(0x0C00, false);
            _SafeStr_4079.content.setParamFlag(0, true);
            _SafeStr_4079.header.setParamFlag(192, false);
            _SafeStr_4079.header.setParamFlag(0, true);
            _SafeStr_4079.content.setParamFlag(192, false);
            _SafeStr_4079.content.setParamFlag(0, true);
            var _local_1:Boolean = _friendList.getBoolean("friendship.category.management.enabled");
            if (((_local_1) && (!(_friendList.getInteger("spaweb", 0) == 1))))
            {
                _SafeStr_4079.findChildByName("open_edit_ctgs_but").procedure = onEditCategoriesButtonClick;
            }
            else
            {
                _SafeStr_4079.findChildByName("open_edit_ctgs_but").visible = false;
            };
            _SafeStr_4787 = ITextWindow(_SafeStr_4079.findChildByName("info_text"));
            _SafeStr_4787.text = "";
            _friendList.refreshButton(_SafeStr_4079, "open_edit_ctgs", true, null, 0);
            refresh("prepare");
            _SafeStr_4079.height = 350;
            _SafeStr_4079.width = 230;
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Close window");
            _SafeStr_4079.visible = false;
            _friendList.trackFriendListEvent("HABBO_FRIENDLIST_TRACKING_EVENT_CLOSED");
            _friendList.categories.view.refreshed();
        }

        private function onWindow(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1.type == "WE_RELOCATE") || (_arg_1.type == "WE_RESIZED")))
            {
                _friendList.categories.view.refreshed();
            };
            if (((!(_arg_1.type == "WE_RESIZED")) || (!(_arg_2 == _SafeStr_4079))))
            {
                return;
            };
            if (this._ignoreResizeEvents)
            {
                return;
            };
            var _local_3:int = ((_SafeStr_4480 == -1) ? 0 : (_SafeStr_4079.height - _SafeStr_4480));
            var _local_4:int = ((_lastWindowWidth == -1) ? 0 : (_SafeStr_4079.width - _lastWindowWidth));
            _friendList.tabs.tabContentHeight = Math.max(100, (_friendList.tabs.tabContentHeight + _local_3));
            _friendList.tabs.windowWidth = Math.max(147, (_friendList.tabs.windowWidth + _local_4));
            refresh(("resize: " + _local_3));
        }

        private function refreshWindowSize():void
        {
            this._ignoreResizeEvents = true;
            _footer.visible = false;
            _footer.y = Util.getLowestPoint(_SafeStr_4079.content);
            _footer.width = _friendList.tabs.windowWidth;
            _footer.visible = true;
            _SafeStr_4079.content.height = Util.getLowestPoint(_SafeStr_4079.content);
            _SafeStr_4079.content.width = (_friendList.tabs.windowWidth - 10);
            _SafeStr_4079.header.width = (_friendList.tabs.windowWidth - 10);
            _SafeStr_4079.height = (_SafeStr_4079.content.height + 30);
            _SafeStr_4079.width = _friendList.tabs.windowWidth;
            this._ignoreResizeEvents = false;
            _SafeStr_4079.scaler.setParamFlag(0x3000, false);
            _SafeStr_4079.scaler.setParamFlag(0x3000, (!(this._friendList.tabs.findSelectedTab() == null)));
            _SafeStr_4079.scaler.setParamFlag(192, false);
            _SafeStr_4079.scaler.setParamFlag(0x0C00, false);
            _SafeStr_4079.scaler.x = (_SafeStr_4079.width - _SafeStr_4079.scaler.width);
            _SafeStr_4079.scaler.y = (_SafeStr_4079.height - _SafeStr_4079.scaler.height);
            _SafeStr_4480 = _SafeStr_4079.height;
            _lastWindowWidth = _SafeStr_4079.width;
            _SafeStr_14.log(("RESIZED: " + _friendList.tabs.windowWidth));
        }

        private function onEditCategoriesButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.preferences}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Edit categories clicked");
            var _local_3:WindowMouseEvent = (_arg_1 as WindowMouseEvent);
            _friendList.openHabboWebPage("link.format.friendlist.pref", new Dictionary(), _local_3.stageX, _local_3.stageY);
        }

        public function get mainWindow():_SafeStr_3133
        {
            return (_SafeStr_4079);
        }

        public function alignBottomLeftTo(_arg_1:Point):void
        {
            var _local_2:Point = _arg_1.clone();
            _local_2.y = (_local_2.y - _SafeStr_4079.height);
            var _local_3:int = _friendList.windowManager.getWindowContext(1).getDesktopWindow().width;
            _local_2.x = Math.min((_local_3 - _SafeStr_4079.width), _local_2.x);
            _local_2.x = Math.max(110, _local_2.x);
            _SafeStr_4079.position = _local_2;
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_4480 = "_-cJ" (String#3440, DoABC#4)
// _SafeStr_4787 = "_-B1D" (String#4933, DoABC#4)
// _SafeStr_4788 = "_-n1o" (String#14178, DoABC#4)
// _SafeStr_4789 = "_-j1Z" (String#17298, DoABC#4)
// _SafeStr_8555 = "_-W1U" (String#25037, DoABC#4)


