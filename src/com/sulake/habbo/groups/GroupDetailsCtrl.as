// by nota

//com.sulake.habbo.groups.GroupDetailsCtrl

package com.sulake.habbo.groups
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import _-W1K._SafeStr_1123;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-XO._SafeStr_312;
    import _-qv._SafeStr_895;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import _-XO._SafeStr_130;
    import _-XO._SafeStr_971;
    import com.sulake.habbo.window.utils._SafeStr_3198;

    public class GroupDetailsCtrl implements _SafeStr_13 
    {

        private var _SafeStr_4144:HabboGroupsManager;
        private var _window:_SafeStr_3133;
        private var _selectedGroup:_SafeStr_1123;

        public function GroupDetailsCtrl(_arg_1:HabboGroupsManager, _arg_2:Boolean)
        {
            _SafeStr_4144 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4144 = null;
            _selectedGroup = null;
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

        private function prepareWindow(_arg_1:_SafeStr_3133):void
        {
            if (_window != null)
            {
                return;
            };
            _window = _SafeStr_3133(_SafeStr_4144.getXmlWindow("group"));
            setProc("group_room_link_region", onRoomLink);
            setProc("manage_guild_region", onManageGuild);
            setProc("delete_guild_region", onDeleteGuild);
            setProc("members_region", onMembers);
            setProc("pending_members_region", onPendingMembers);
            setProc("show_groups_link_region", onShowGroups);
            setProc("buy_furni_link_region", onBuyFurni);
            _window.findChildByName("leave_button").procedure = onLeave;
            _window.findChildByName("join_button").procedure = onJoin;
            _window.findChildByName("request_membership_button").procedure = onJoin;
        }

        private function attachWindow(_arg_1:_SafeStr_3133):void
        {
            if (_arg_1.getChildIndex(_window) == -1)
            {
                _arg_1.addChild(_window);
            };
        }

        public function onGroupDetails(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1123):void
        {
            _selectedGroup = _arg_2;
            prepareWindow(_arg_1);
            attachWindow(_arg_1);
            var _local_10:_SafeStr_3109 = _window.findChildByName("group_decorate_icon_region");
            var _local_9:_SafeStr_3109 = _window.findChildByName("group_name");
            _local_9.caption = _arg_2.groupName;
            _local_10.visible = _arg_2.membersCanDecorate;
            _local_9.x = ((_arg_2.membersCanDecorate) ? (_local_10.x + _local_10.width) : _local_10.x);
            var _local_6:ITextWindow = ITextWindow(_window.findChildByName("group_description"));
            _local_6.caption = _arg_2.description;
            _local_6.height = (_local_6.textHeight + 5);
            _window.findChildByName("group_description_scrollbar").visible = (_local_6.height > _window.findChildByName("group_description_item_list").height);
            var _local_8:Boolean = _selectedGroup.hasBoard;
            _window.findChildByName("show_forum_link_region").visible = _local_8;
            _window.findChildByName("show_forum_link").visible = _local_8;
            if (_local_8)
            {
                setProc("show_forum_link_region", onForumLink);
            };
            _SafeStr_4144.windowManager.registerLocalizationParameter("group.created", "date", ("" + _arg_2.creationDate));
            _SafeStr_4144.windowManager.registerLocalizationParameter("group.created", "owner", ("" + _arg_2.ownerName));
            _window.findChildByName("created_txt").caption = _SafeStr_4144.localization.getLocalization("group.created");
            _SafeStr_4144.windowManager.registerLocalizationParameter("group.membercount", "totalMembers", ("" + _arg_2.totalMembers));
            _window.findChildByName("members_txt").caption = _SafeStr_4144.localization.getLocalization("group.membercount");
            _window.findChildByName("group_room_link_region").visible = (_arg_2.roomId > -1);
            _SafeStr_4144.windowManager.registerLocalizationParameter("group.linktobase", "room_name", _arg_2.roomName);
            _window.findChildByName("group_room_link").caption = _SafeStr_4144.localization.getLocalization("group.linktobase");
            var _local_4:_SafeStr_3349 = (_SafeStr_3199(_window.findChildByName("group_logo")).widget as _SafeStr_3349);
            _local_4.badgeId = _selectedGroup.badgeCode;
            _local_4.groupId = _selectedGroup.groupId;
            _window.findChildByName("join_button").visible = _arg_2.joiningAllowed;
            _window.findChildByName("join_button").enable();
            _window.findChildByName("request_membership_button").visible = _arg_2.requestMembershipAllowed;
            _window.findChildByName("leave_button").visible = _arg_2.leaveAllowed;
            _window.findChildByName("membership_pending_txt").visible = (_arg_2.status == 2);
            _window.findChildByName("youaremember_txt").visible = ((!(_selectedGroup.isGuild)) && (_arg_2.status == 1));
            _window.findChildByName("youaremember_icon").visible = ((!(_selectedGroup.isGuild)) && (_arg_2.status == 1));
            var _local_5:_SafeStr_3109 = _window.findChildByName("pending_members_region");
            _local_5.visible = (_selectedGroup.pendingMemberCount > 0);
            if (_selectedGroup.pendingMemberCount > 0)
            {
                _SafeStr_4144.windowManager.registerLocalizationParameter("group.pendingmembercount", "amount", ("" + _arg_2.pendingMemberCount));
                _window.findChildByName("pending_members_txt").caption = _SafeStr_4144.localization.getLocalization("group.pendingmembercount");
            };
            var _local_3:_SafeStr_3109 = _window.findChildByName("manage_guild_region");
            _local_3.visible = ((_selectedGroup.isOwner) && (_selectedGroup.isGuild));
            _local_3.y = ((_local_5.visible) ? (_local_5.y + 16) : _local_5.y);
            var _local_7:_SafeStr_3109 = _window.findChildByName("delete_guild_region");
            _local_7.visible = (((_selectedGroup.isGuild) && (_SafeStr_4144.groupDeletionEnabled)) && ((_selectedGroup.isOwner) || (_SafeStr_4144.sessionDataManager.hasSecurity(5))));
            _local_7.y = ((_local_3.visible) ? (_local_3.y + 16) : _local_5.y);
            _window.findChildByName("you_are_owner_region").visible = ((_selectedGroup.isGuild) && (_selectedGroup.isOwner));
            _window.findChildByName("you_are_admin_region").visible = (((_selectedGroup.isGuild) && (_selectedGroup.isAdmin)) && (!(_selectedGroup.isOwner)));
            _window.findChildByName("you_are_member_region").visible = ((_selectedGroup.isGuild) && ((_selectedGroup.status == 1) && (!((_selectedGroup.isAdmin) || (_selectedGroup.isOwner)))));
            getGroupTypeRegion(0).visible = false;
            getGroupTypeRegion(1).visible = false;
            getGroupTypeRegion(2).visible = false;
            if (getGroupTypeRegion(_arg_2.type) != null)
            {
                getGroupTypeRegion(_arg_2.type).visible = true;
            };
        }

        private function getGroupTypeRegion(_arg_1:int):_SafeStr_3109
        {
            return (_window.findChildByName(("grouptype_region_" + _arg_1)));
        }

        private function getGroupTypeIcon(_arg_1:int):_SafeStr_3109
        {
            return (_window.findChildByName(("grouptype_icon_" + _arg_1)));
        }

        private function setProc(_arg_1:String, _arg_2:Function):void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName(_arg_1);
            _local_3.mouseThreshold = 0;
            _local_3.procedure = _arg_2;
        }

        private function onLeave(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.trackGoogle("groupDetails", "leaveGroup");
            _SafeStr_4144.handleUserKick(_SafeStr_4144.avatarId, _selectedGroup.groupId);
        }

        private function onJoin(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.trackGoogle("groupDetails", "joinGroup");
            _window.findChildByName("join_button").disable();
            _SafeStr_4144.send(new _SafeStr_312(_selectedGroup.groupId));
            _SafeStr_4144.send(new _SafeStr_895("HabboGroups", ("" + _selectedGroup.groupId), "join"));
        }

        private function onRoomLink(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.trackGoogle("groupDetails", "groupBaseRoom");
            _SafeStr_4144.navigator.goToPrivateRoom(_selectedGroup.roomId);
            _SafeStr_4144.send(new _SafeStr_895("HabboGroups", ("" + _selectedGroup.groupId), "base"));
        }

        private function onForumLink(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.openGroupForum(_selectedGroup.groupId);
        }

        private function openExternalLink(_arg_1:String):void
        {
            if (_arg_1 != "")
            {
                _SafeStr_4144.windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, onExternalLink);
                HabboWebTools.navigateToURL(_arg_1, "_empty");
            };
        }

        private function onExternalLink(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        private function onManageGuild(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.trackGoogle("groupDetails", "groupManage");
            _SafeStr_4144.send(new _SafeStr_130(_selectedGroup.groupId));
        }

        private function onDeleteGuild(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.windowManager.confirm("${group.deleteconfirm.title}", "${group.deleteconfirm.desc}", 0, onDeleteGuildConfirmation);
        }

        private function onDeleteGuildConfirmation(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            if (_arg_2.type == "WE_OK")
            {
                _SafeStr_4144.trackGoogle("groupDetails", "groupDelete");
                _SafeStr_4144.send(new _SafeStr_971(_selectedGroup.groupId));
            };
        }

        private function onMembers(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.trackGoogle("groupDetails", "groupMembers");
            _SafeStr_4144.guildMembersWindowCtrl.onMembersClick(_selectedGroup.groupId, 0);
        }

        private function onPendingMembers(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.trackGoogle("groupDetails", "groupPendingMembers");
            _SafeStr_4144.guildMembersWindowCtrl.onMembersClick(_selectedGroup.groupId, 2);
        }

        private function onShowGroups(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.trackGoogle("groupDetails", "hottestGroups");
            _SafeStr_4144.navigator.performGuildBaseSearch();
        }

        private function onBuyFurni(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.trackGoogle("groupDetails", "groupFurni");
            _SafeStr_4144.openCatalog("guild_custom_furni");
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1123 = "_-r1M" (String#6272, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_130 = "_-N1T" (String#21311, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_312 = "_-18" (String#13699, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)
// _SafeStr_971 = "_-tD" (String#28958, DoABC#4)


