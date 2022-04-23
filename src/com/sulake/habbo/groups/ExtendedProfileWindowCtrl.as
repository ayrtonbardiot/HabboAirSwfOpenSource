// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.ExtendedProfileWindowCtrl

package com.sulake.habbo.groups
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import _-W1K._SafeStr_1479;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.friendlist._SafeStr_3259;
    import _-XO._SafeStr_313;
    import _-W1K._SafeStr_1637;
    import _-XO._SafeStr_197;
    import _-XO._SafeStr_691;
    import _-XO._SafeStr_841;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.utils.FriendlyTime;
    import _-W1K._SafeStr_1648;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import _-W1K._SafeStr_1123;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-qv._SafeStr_895;
    import _-XO._SafeStr_193;
    import _-XO._SafeStr_759;
    import com.sulake.habbo.window.utils._SafeStr_3114;

    public class ExtendedProfileWindowCtrl implements _SafeStr_13 
    {

        private var _SafeStr_4144:HabboGroupsManager;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5191:IItemListWindow;
        private var _SafeStr_5187:_SafeStr_3133;
        private var _SafeStr_5189:int;
        private var _SafeStr_4650:GroupDetailsCtrl;
        private var _SafeStr_5188:_SafeStr_3133;
        private var _SafeStr_3740:_SafeStr_1479;
        private var _SafeStr_5190:Boolean;
        private var _SafeStr_5192:Boolean = false;
        private var _SafeStr_5186:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_5193:Boolean = false;

        public function ExtendedProfileWindowCtrl(_arg_1:HabboGroupsManager)
        {
            _SafeStr_4144 = _arg_1;
            _SafeStr_4650 = new GroupDetailsCtrl(_arg_1, false);
        }

        public function dispose():void
        {
            _SafeStr_4144 = null;
            _SafeStr_5191 = null;
            _SafeStr_3740 = null;
            if (_SafeStr_5186)
            {
                _SafeStr_5186.dispose();
                _SafeStr_5186 = null;
            };
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_4650)
            {
                _SafeStr_4650.dispose();
                _SafeStr_4650 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4144 == null);
        }

        private function prepareWindow():void
        {
            if (_window != null)
            {
                return;
            };
            if (_SafeStr_5187 == null)
            {
                _SafeStr_5187 = _SafeStr_3133(_SafeStr_4144.getXmlWindow("group_entry"));
            };
            if (_SafeStr_5188 == null)
            {
                _SafeStr_5188 = _SafeStr_3133(_SafeStr_4144.getXmlWindow("no_groups"));
                _SafeStr_5188.findChildByName("view_groups_button").procedure = onViewGroups;
            };
            _window = _SafeStr_3263(_SafeStr_4144.getXmlWindow("new_extended_profile"));
            _window.findChildByTag("close").procedure = onClose;
            _window.findChildByName("addasfriend_button").procedure = onAddAsFriend;
            _window.findChildByName("rooms_button").procedure = onRooms;
            _SafeStr_5191 = IItemListWindow(_window.findChildByName("groups_list"));
            _window.center();
            _window.findChildByName("change_looks").procedure = onChangeLooks;
            _window.findChildByName("change_badges").procedure = onChangeBadges;
            _window.findChildByName("user_activity_points").visible = _SafeStr_4144.isActivityDisplayEnabled;
            for each (var _local_1:int in _SafeStr_3259.displayableStatuses)
            {
                _window.findChildByName((_SafeStr_3259.statusAsString(_local_1) + "_friend_name_link_region")).procedure = onRelationshipLink;
            };
        }

        public function onProfileChanged(_arg_1:int):void
        {
            if (((((!(_SafeStr_3740 == null)) && (_SafeStr_3740.userId == _arg_1)) && (!(_window == null))) && (_window.visible)))
            {
                _SafeStr_4144.send(new _SafeStr_313(_arg_1));
                _SafeStr_5190 = true;
            };
        }

        public function onProfile(_arg_1:_SafeStr_1479):void
        {
            _SafeStr_3740 = _arg_1;
            var _local_2:_SafeStr_1637 = getSelectedGroup();
            if (_local_2 == null)
            {
                if (_SafeStr_3740.guilds.length > 0)
                {
                    _SafeStr_5189 = _SafeStr_3740.guilds[0].groupId;
                    _local_2 = _SafeStr_3740.guilds[0];
                }
                else
                {
                    _SafeStr_5189 = 0;
                };
            };
            if (_SafeStr_5189 > 0)
            {
                _SafeStr_4144.send(new _SafeStr_197(_SafeStr_5189, false));
            };
            refresh();
            _window.visible = true;
            if (!_SafeStr_5190)
            {
                _window.activate();
            };
            _SafeStr_5190 = false;
        }

        private function getSelectedGroup():_SafeStr_1637
        {
            for each (var _local_1:_SafeStr_1637 in _SafeStr_3740.guilds)
            {
                if (_local_1.groupId == _SafeStr_5189)
                {
                    return (_local_1);
                };
            };
            return (null);
        }

        private function refresh():void
        {
            _SafeStr_4144.send(new _SafeStr_691(_SafeStr_3740.userId));
            _SafeStr_4144.send(new _SafeStr_841(_SafeStr_3740.userId));
            prepareWindow();
            refreshHeader();
            refreshGroupList();
        }

        private function refreshGroupList():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:* = (_SafeStr_3740.userId == _SafeStr_4144.avatarId);
            _SafeStr_5191.visible = (_SafeStr_3740.guilds.length > 0);
            _SafeStr_5191.destroyListItems();
            for each (var _local_5:_SafeStr_1637 in _SafeStr_3740.guilds)
            {
                _local_1 = _SafeStr_3133(_SafeStr_5187.clone());
                _local_1.id = _local_5.groupId;
                _local_1.findChildByName("bg_region").procedure = onSelectGroup;
                _local_1.findChildByName("bg_region").id = _local_5.groupId;
                _local_1.findChildByName("clear_favourite").procedure = onClearFavourite;
                _local_1.findChildByName("clear_favourite").visible = ((_local_5.favourite) && (_local_3));
                _local_1.findChildByName("clear_favourite").id = _local_5.groupId;
                _local_1.findChildByName("make_favourite").procedure = onMakeFavourite;
                _local_1.findChildByName("make_favourite").visible = ((!(_local_5.favourite)) && (_local_3));
                _local_1.findChildByName("make_favourite").id = _local_5.groupId;
                _local_2 = _SafeStr_3349(_SafeStr_3199(_local_1.findChildByName("group_pic_bitmap")).widget);
                _local_2.type = "group";
                _local_2.badgeId = _local_5.badgeCode;
                _local_2.groupId = _local_5.groupId;
                _SafeStr_5191.addListItem(_local_1);
            };
            refreshGroupListSelection();
            _SafeStr_4144.localization.registerParameter("extendedprofile.groups.count", "count", _SafeStr_3740.guilds.length.toString());
            if (_SafeStr_3740.guilds.length < 1)
            {
                _local_4 = _SafeStr_3133(_window.findChildByName("group_cont"));
                _local_4.removeChildAt(0);
                _local_4.addChild(_SafeStr_5188);
                _SafeStr_5188.findChildByName("no_groups_caption").caption = _SafeStr_4144.localization.getLocalization(((_local_3) ? "extendedprofile.nogroups.me" : "extendedprofile.nogroups.user"));
                _SafeStr_5188.findChildByName("view_groups_button").visible = true;
            };
        }

        private function refreshGroupListSelection():void
        {
            var _local_2:int;
            var _local_1:* = null;
            _local_2 = 0;
            while (_local_2 < _SafeStr_5191.numListItems)
            {
                _local_1 = _SafeStr_3133(_SafeStr_5191.getListItemAt(_local_2));
                _local_1.findChildByName("bg_selected_bitmap").visible = (_SafeStr_5189 == _local_1.id);
                _local_1.findChildByName("bg_unselected_bitmap").visible = (!(_SafeStr_5189 == _local_1.id));
                _local_2++;
            };
        }

        private function refreshHeader():void
        {
            var _local_1:* = (_SafeStr_3740.userId == _SafeStr_4144.avatarId);
            _window.findChildByName("motto_txt").caption = _SafeStr_3740.motto;
            _window.findChildByName("status_txt").visible = ((_SafeStr_3740.isFriend) || (_local_1));
            _window.findChildByName("friend_request_sent_txt").visible = _SafeStr_3740.isFriendRequestSent;
            _window.findChildByName("offline_icon").visible = (!(_SafeStr_3740.isOnline));
            _window.findChildByName("online_icon").visible = _SafeStr_3740.isOnline;
            _window.findChildByName("status").invalidate();
            _SafeStr_4144.localization.registerParameter("extendedprofile.username", "username", _SafeStr_3740.userName);
            _SafeStr_4144.localization.registerParameter("extendedprofile.created", "created", _SafeStr_3740.creationDate);
            _SafeStr_4144.localization.registerParameter("extendedprofile.activitypoints", "activitypoints", _SafeStr_3740.achievementScore.toString());
            _SafeStr_4144.localization.registerParameter("extendedprofile.last.login", "lastlogin", FriendlyTime.getFriendlyTime(_SafeStr_4144.localization, _SafeStr_3740.lastAccessSinceInSeconds, ".ago"));
            _window.findChildByName("user_last_login").visible = (_SafeStr_3740.lastAccessSinceInSeconds > -1);
            refreshAvatarImage();
            var _local_2:* = (_SafeStr_3740.friendCount > -1);
            var _local_3:Boolean = (((_SafeStr_3740.isFriend) && (_local_2)) || (_local_1));
            _window.findChildByName("addasfriend_button").visible = (((((!(_SafeStr_3740.isFriend)) && (!(_SafeStr_3740.isFriendRequestSent))) && (!(_local_1))) && (_SafeStr_4144.friendlist.canBeAskedForAFriend(_SafeStr_3740.userId))) && (_local_2));
            _window.findChildByName("ok_icon").visible = _local_3;
            _window.findChildByName("status_txt").visible = _local_3;
            _window.findChildByName("top_right").visible = _local_2;
            _window.findChildByName("status_txt").caption = _SafeStr_4144.localization.getLocalization(((_SafeStr_3740.isFriend) ? "extendedprofile.friend" : "extendedprofile.me"));
            _window.findChildByName("change_own_attributes").visible = _local_1;
            _window.findChildByName("levelValue").caption = _SafeStr_3740.accountLevel.toString();
            _window.findChildByName("starGemCount").caption = _SafeStr_3740.starGemCount.toString();
        }

        private function refreshRelationships():void
        {
            var _local_1:Boolean = _SafeStr_4144.getBoolean("relationship.status.enabled");
            if (((_local_1) && (_window)))
            {
                _window.findChildByName("rel_status_label_txt").visible = true;
                for each (var _local_2:int in _SafeStr_3259.displayableStatuses)
                {
                    setRelationshipDetails(_local_2);
                };
            };
            _SafeStr_4144.localization.registerParameter("extendedprofile.friends.count", "count", _SafeStr_3740.friendCount.toString());
        }

        private function setRelationshipDetails(_arg_1:int):void
        {
            var _local_4:_SafeStr_1648 = _SafeStr_5186.getValue(_arg_1);
            var _local_5:String = _SafeStr_3259.statusAsString(_arg_1);
            var _local_6:_SafeStr_3109 = _window.findChildByName((_local_5 + "_txt"));
            var _local_3:_SafeStr_3109 = _window.findChildByName((_local_5 + "_friend_name_link_text"));
            var _local_2:_SafeStr_3199 = _SafeStr_3199(_window.findChildByName((_local_5 + "_head")));
            if (((_local_4) && (_local_4.friendCount > 0)))
            {
                _local_3.caption = _local_4.randomFriendName;
                _local_2.visible = true;
                _SafeStr_3289(_local_2.widget).figure = _local_4.randomFriendFigure;
                if (_local_4.friendCount > 1)
                {
                    _local_6.visible = true;
                    _local_6.invalidate();
                    _local_6.caption = _SafeStr_4144.localization.getLocalizationWithParams(("extendedprofile.relstatus.others." + _local_5), "", "count", ("" + (_local_4.friendCount - 1)));
                }
                else
                {
                    _local_6.visible = false;
                };
            }
            else
            {
                _local_2.visible = false;
                _local_3.caption = "${extendedprofile.add.friends}";
                _local_6.caption = "${extendedprofile.no.friends.in.this.category}";
                _local_6.visible = true;
            };
        }

        public function onGroupDetails(_arg_1:_SafeStr_1123):void
        {
            var _local_2:* = null;
            if (_SafeStr_5189 == _arg_1.groupId)
            {
                _local_2 = _SafeStr_3133(_window.findChildByName("group_cont"));
                _local_2.removeChildAt(0);
                _local_2.invalidate();
                _SafeStr_4650.onGroupDetails(_local_2, _arg_1);
            };
        }

        public function onRelationshipStatusInfo(_arg_1:int, _arg_2:_SafeStr_24):void
        {
            if (((_SafeStr_3740) && (relationshipUpdateExpected)))
            {
                _SafeStr_5186 = _arg_2.clone();
                refreshRelationships();
                relationshipUpdateExpected = false;
            };
        }

        public function onUserBadges(_arg_1:int, _arg_2:Array):void
        {
            var _local_4:int;
            var _local_3:* = null;
            if ((((_SafeStr_3740) && (badgeUpdateExpected)) && (!(_window == null))))
            {
                _local_4 = 0;
                while (_local_4 < 5)
                {
                    _local_3 = _SafeStr_3349(_SafeStr_3199(_window.findChildByName(("badge_" + _local_4))).widget);
                    _local_3.type = "normal";
                    _local_3.badgeId = ((_local_4 < _arg_2.length) ? _arg_2[_local_4] : "");
                    _local_4++;
                };
                badgeUpdateExpected = false;
            };
        }

        private function setProc(_arg_1:String, _arg_2:Function):void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName(_arg_1);
            _local_3.mouseThreshold = 0;
            _local_3.procedure = _arg_2;
        }

        private function onAddAsFriend(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.friendlist.askForAFriend(_SafeStr_3740.userId, _SafeStr_3740.userName);
            _SafeStr_3740.isFriendRequestSent = true;
            refresh();
        }

        private function onRooms(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.newNavigator.performSearch("hotel_view", ("owner:" + _SafeStr_3740.userName));
        }

        private function onRelationshipLink(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_5:int;
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if ((((!(_arg_1.target == null)) && (!(_arg_2.name == null))) && (!(_SafeStr_5186 == null))))
            {
                _local_4 = _arg_2.name.substr(0, _arg_2.name.indexOf("_"));
                _local_3 = _SafeStr_5186.getValue(_SafeStr_3259.stringAsStatus(_local_4));
                if (_local_3 != null)
                {
                    _local_5 = _local_3.randomFriendId;
                    if (_local_5)
                    {
                        _SafeStr_4144.showExtendedProfile(_local_5);
                    };
                }
                else
                {
                    _SafeStr_4144.windowManager.alert("${extendedprofile.add.friends.alert.title}", "${extendedprofile.add.friends.alert.body}", 0, addFriendsAlertCallback);
                };
            };
        }

        private function onViewGroups(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.navigator.performGuildBaseSearch();
        }

        private function onSelectGroup(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_5189 = _arg_2.id;
            _SafeStr_4144.send(new _SafeStr_197(_SafeStr_5189, false));
            _SafeStr_4144.send(new _SafeStr_895("HabboGroups", ("" + _arg_2.id), "select"));
            this.refreshGroupListSelection();
        }

        private function onMakeFavourite(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.send(new _SafeStr_193(_arg_2.id));
            _SafeStr_4144.send(new _SafeStr_895("HabboGroups", ("" + _arg_2.parent.id), "make favourite"));
            _SafeStr_5189 = _arg_2.id;
        }

        private function onClearFavourite(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.send(new _SafeStr_759(_arg_2.id));
            _SafeStr_4144.send(new _SafeStr_895("HabboGroups", ("" + _arg_2.parent.id), "clear favourite"));
            _SafeStr_5189 = _arg_2.id;
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            close();
        }

        private function onChangeLooks(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.context.createLinkEvent("avatareditor/open");
        }

        private function onChangeBadges(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.context.createLinkEvent("inventory/open/badges");
        }

        public function close():void
        {
            if (_window != null)
            {
                _window.visible = false;
            };
        }

        private function refreshAvatarImage(_arg_1:Boolean=false):void
        {
            var _local_2:_SafeStr_3199 = _SafeStr_3199(_window.findChildByName("avatar_image"));
            var _local_3:_SafeStr_3289 = _SafeStr_3289(_local_2.widget);
            _local_3.figure = _SafeStr_3740.figure;
        }

        public function updateVisibleExtendedProfile(_arg_1:int):void
        {
            if (((((!(_window == null)) && (_window.visible)) && (!(_SafeStr_3740 == null))) && (!(_SafeStr_3740.userId == _arg_1))))
            {
                _SafeStr_4144.send(new _SafeStr_313(_arg_1));
            };
        }

        public function get badgeUpdateExpected():Boolean
        {
            return (_SafeStr_5192);
        }

        public function set badgeUpdateExpected(_arg_1:Boolean):void
        {
            _SafeStr_5192 = _arg_1;
        }

        public function set relationshipUpdateExpected(_arg_1:Boolean):void
        {
            _SafeStr_5193 = _arg_1;
        }

        public function get relationshipUpdateExpected():Boolean
        {
            return (_SafeStr_5193);
        }

        private function addFriendsAlertCallback(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            if (_arg_2.type == "WE_OK")
            {
                _SafeStr_4144.context.createLinkEvent("friendbar/findfriends");
                close();
            };
            _arg_1.dispose();
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1123 = "_-r1M" (String#6272, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1479 = "_-hd" (String#24156, DoABC#4)
// _SafeStr_1637 = "_-M5" (String#6982, DoABC#4)
// _SafeStr_1648 = "_-Ne" (String#22961, DoABC#4)
// _SafeStr_193 = "_-J1w" (String#30866, DoABC#4)
// _SafeStr_197 = "_-G1o" (String#2651, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3259 = "_-CW" (String#5979, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_4650 = "_-u1K" (String#4879, DoABC#4)
// _SafeStr_5186 = "_-Ph" (String#6246, DoABC#4)
// _SafeStr_5187 = "_-I11" (String#14587, DoABC#4)
// _SafeStr_5188 = "_-x14" (String#8817, DoABC#4)
// _SafeStr_5189 = "_-J" (String#4203, DoABC#4)
// _SafeStr_5190 = "_-u11" (String#13691, DoABC#4)
// _SafeStr_5191 = "_-lS" (String#7723, DoABC#4)
// _SafeStr_5192 = "_-91I" (String#19702, DoABC#4)
// _SafeStr_5193 = "_-nn" (String#18135, DoABC#4)
// _SafeStr_691 = "_-b1s" (String#15927, DoABC#4)
// _SafeStr_759 = "_-sk" (String#29179, DoABC#4)
// _SafeStr_841 = "_-vv" (String#18502, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


