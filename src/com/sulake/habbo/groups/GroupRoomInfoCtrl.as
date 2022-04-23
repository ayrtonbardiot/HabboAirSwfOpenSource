// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.GroupRoomInfoCtrl

package com.sulake.habbo.groups
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import _-W1K._SafeStr_1123;
    import _-XO._SafeStr_197;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-XO._SafeStr_130;
    import _-XO._SafeStr_312;
    import _-qv._SafeStr_895;

    public class GroupRoomInfoCtrl implements _SafeStr_13 
    {

        private static const TOOLBAR_EXTENSION_ID:String = "room_group_info";

        private var _SafeStr_4144:HabboGroupsManager;
        private var _window:_SafeStr_3133;
        private var _expanded:Boolean = true;
        private var _group:_SafeStr_1123;
        private var _SafeStr_4848:int;

        public function GroupRoomInfoCtrl(_arg_1:HabboGroupsManager)
        {
            _SafeStr_4144 = _arg_1;
        }

        public function dispose():void
        {
            if (toolbarAttachAllowed())
            {
                _SafeStr_4144.toolbar.extensionView.detachExtension("room_group_info");
            };
            _SafeStr_4144 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4144 == null);
        }

        public function onRoomInfo(_arg_1:_SafeStr_1569):void
        {
            if (!_SafeStr_4144.groupRoomInfoEnabled)
            {
                return;
            };
            if (_arg_1.habboGroupId > 0)
            {
                _SafeStr_4848 = _arg_1.habboGroupId;
                _SafeStr_4144.send(new _SafeStr_197(_arg_1.habboGroupId, false));
            }
            else
            {
                _SafeStr_4848 = 0;
                close();
            };
        }

        public function onGroupDeactivated(_arg_1:int):void
        {
            if (((_arg_1 == _group.groupId) || (_arg_1 == _SafeStr_4848)))
            {
                expectedGroupId = 0;
                close();
            };
        }

        public function onGroupDetails(_arg_1:_SafeStr_1123):void
        {
            if (!_SafeStr_4144.groupRoomInfoEnabled)
            {
                return;
            };
            if (_arg_1.groupId == _SafeStr_4848)
            {
                _expanded = true;
                _group = _arg_1;
                refresh();
            };
        }

        public function isDisplayingGroup(_arg_1:int):Boolean
        {
            return (((!(_window == null)) && (!(_group == null))) && (_arg_1 == _group.groupId));
        }

        private function refresh():void
        {
            if (!_group.isGuild)
            {
                return;
            };
            prepareWindow();
            _window.findChildByName("bg_expanded").visible = _expanded;
            _window.findChildByName("bg_contracted").visible = (!(_expanded));
            _window.findChildByName("group_name_txt").visible = _expanded;
            _window.findChildByName("join_button").visible = ((_expanded) && (_group.joiningAllowed));
            _window.findChildByName("join_button").enable();
            _window.findChildByName("request_membership_button").visible = ((_expanded) && (_group.requestMembershipAllowed));
            _window.findChildByName("manage_button").visible = ((_expanded) && (_group.isOwner));
            _window.findChildByName("group_logo").visible = _expanded;
            _window.findChildByName("group_name_txt").caption = _group.groupName;
            _window.findChildByName("info_region").visible = _expanded;
            var _local_1:_SafeStr_3349 = (_SafeStr_3199(_window.findChildByName("group_logo")).widget as _SafeStr_3349);
            _local_1.badgeId = _group.badgeCode;
            _local_1.groupId = _group.groupId;
            _window.x = 0;
            _window.y = 0;
            _window.height = ((_expanded) ? _window.findChildByName("bg_expanded").height : _window.findChildByName("bg_contracted").height);
            if (toolbarAttachAllowed())
            {
                _SafeStr_4144.toolbar.extensionView.attachExtension("room_group_info", _window, -1, ["next_quest_timer", "quest_tracker", "event_info_window"]);
            };
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            _window = _SafeStr_3133(_SafeStr_4144.getXmlWindow("group_room_info"));
            _window.findChildByName("join_button").procedure = onJoin;
            _window.findChildByName("request_membership_button").procedure = onJoin;
            _window.findChildByName("manage_button").procedure = onManage;
            _window.findChildByName("title_region").procedure = onTitleClick;
            _window.findChildByName("info_region").procedure = onInfoClick;
        }

        public function close():void
        {
            if (_window != null)
            {
                if (toolbarAttachAllowed())
                {
                    _SafeStr_4144.toolbar.extensionView.detachExtension("room_group_info");
                };
                _SafeStr_4848 = 0;
                _group = null;
            };
        }

        private function onTitleClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _expanded = (!(_expanded));
            refresh();
            _SafeStr_4144.toolbar.events.dispatchEvent(new HabboToolbarEvent("HTE_GROUP_ROOM_INFO_CLICK"));
        }

        private function onInfoClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4144.trackGoogle("groupRoomInfo", "groupInfo");
                _SafeStr_4144.send(new _SafeStr_197(_group.groupId, true));
                _SafeStr_4144.toolbar.events.dispatchEvent(new HabboToolbarEvent("HTE_GROUP_ROOM_INFO_CLICK"));
            };
        }

        private function onManage(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4144.trackGoogle("groupRoomInfo", "manageGroup");
                _SafeStr_4144.send(new _SafeStr_130(_group.groupId));
                _SafeStr_4144.toolbar.events.dispatchEvent(new HabboToolbarEvent("HTE_GROUP_ROOM_INFO_CLICK"));
            };
        }

        private function onJoin(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4144.trackGoogle("groupRoomInfo", "joinGroup");
                _window.findChildByName("join_button").disable();
                _SafeStr_4144.send(new _SafeStr_312(_group.groupId));
                _SafeStr_4144.send(new _SafeStr_895("HabboGroups", ("" + _group.groupId), "join"));
                _SafeStr_4144.toolbar.events.dispatchEvent(new HabboToolbarEvent("HTE_GROUP_ROOM_INFO_CLICK"));
            };
        }

        public function set expectedGroupId(_arg_1:int):void
        {
            _SafeStr_4848 = _arg_1;
        }

        private function toolbarAttachAllowed():Boolean
        {
            return ((((!(_SafeStr_4144 == null)) && (!(_SafeStr_4144.toolbar == null))) && (!(_SafeStr_4144.toolbar.extensionView == null))) && (_SafeStr_4144.toolbarAttachEnabled));
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1123 = "_-r1M" (String#6272, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_130 = "_-N1T" (String#21311, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_197 = "_-G1o" (String#2651, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_312 = "_-18" (String#13699, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_4848 = "_-y10" (String#6628, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


