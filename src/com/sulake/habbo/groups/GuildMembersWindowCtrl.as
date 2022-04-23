// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.GuildMembersWindowCtrl

package com.sulake.habbo.groups
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3263;
    import flash.utils.Timer;
    import _-W1K._SafeStr_1135;
    import com.sulake.habbo.utils.InfoText;
    import com.sulake.habbo.utils.LoadingIcon;
    import com.sulake.core.window.components.IIconWindow;
    import _-W1K._SafeStr_221;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-W1K._SafeStr_307;
    import _-W1K._SafeStr_631;
    import _-W1K._SafeStr_169;
    import _-W1K._SafeStr_852;
    import _-NF._SafeStr_1525;
    import _-XO._SafeStr_1029;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-W1K._SafeStr_1171;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import _-XO._SafeStr_981;
    import _-XO._SafeStr_858;
    import _-XO._SafeStr_553;
    import _-XO._SafeStr_124;
    import _-XO._SafeStr_219;
    import _-XO._SafeStr_313;
    import _-XO._SafeStr_304;
    import com.sulake.core.window.components._SafeStr_3269;
    import flash.events.Event;

    public class GuildMembersWindowCtrl implements _SafeStr_13 
    {

        private static const MEMBER_SPACING:Point = new Point(5, 5);

        private var _SafeStr_4144:HabboGroupsManager;
        private var _window:_SafeStr_3263;
        private var _groupId:int;
        private var _SafeStr_5009:Timer = new Timer(1000, 1);
        private var _SafeStr_3740:_SafeStr_1135;
        private var _SafeStr_5010:InfoText;
        private var _loadingIcon:LoadingIcon;

        public function GuildMembersWindowCtrl(_arg_1:HabboGroupsManager)
        {
            _SafeStr_4144 = _arg_1;
            _SafeStr_5009.addEventListener("timer", onSearchTimer);
            _loadingIcon = new LoadingIcon();
        }

        public function dispose():void
        {
            _SafeStr_4144 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_5010 != null)
            {
                _SafeStr_5010.dispose();
                _SafeStr_5010 = null;
            };
            if (_SafeStr_5009)
            {
                _SafeStr_5009.removeEventListener("timer", onSearchTimer);
                _SafeStr_5009.stop();
                _SafeStr_5009 = null;
            };
            if (_loadingIcon)
            {
                _loadingIcon.dispose();
                _loadingIcon = null;
            };
        }

        private function setSearchingIcon(_arg_1:Boolean):void
        {
            if (_window)
            {
                _loadingIcon.setVisible(IIconWindow(_window.findChildByName("searching_icon")), _arg_1);
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4144 == null);
        }

        public function onGuildMembers(_arg_1:IMessageEvent):void
        {
            _SafeStr_3740 = _SafeStr_221(_arg_1).data;
            show();
            populateSearchTypes();
            populateUserNameFilter();
        }

        public function onGuildMembershipUpdated(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_307 = _SafeStr_307(_arg_1);
            if (((!(_SafeStr_3740 == null)) && (_SafeStr_3740.groupId == _local_2.guildId)))
            {
                _SafeStr_3740.update(_local_2.data);
                reload();
            };
        }

        public function onGuildMemberMgmtFailed(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_631 = _SafeStr_631(_arg_1);
            var _local_3:int = _local_2.reason;
            var _local_4:String = ("group.membermgmt.fail." + _local_3);
            var _local_5:String = _SafeStr_4144.localization.getLocalization(_local_4, _local_4);
            _SafeStr_4144.windowManager.alert("${group.membermgmt.fail.title}", _local_5, 0, null);
            if (((((!(_SafeStr_3740 == null)) && (_SafeStr_3740.groupId == _local_2.guildId)) && (!(_window == null))) && (_window.visible)))
            {
                doSearch(_SafeStr_3740.pageIndex);
            };
        }

        public function onGuildMembershipRejected(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_169 = _SafeStr_169(_arg_1);
            if (((((_window) && (_window.visible)) && (!(_SafeStr_3740 == null))) && (_SafeStr_3740.groupId == _local_2.getParser().guildId)))
            {
                doSearch(_SafeStr_3740.pageIndex);
            };
        }

        public function onMembershipRequested(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1525 = _SafeStr_852(_arg_1).getParser();
            if (((((_window) && (_window.visible)) && (!(_SafeStr_3740 == null))) && (_SafeStr_3740.groupId == _local_2.groupId)))
            {
                doSearch(_SafeStr_3740.pageIndex);
            };
        }

        public function onMembersClick(_arg_1:int, _arg_2:int):void
        {
            if (!_SafeStr_4144.getBoolean("groupMembers.enabled"))
            {
                return;
            };
            if ((((!(_window == null)) && (_window.visible)) && (_groupId == _arg_1)))
            {
                close();
            }
            else
            {
                if (_SafeStr_5010)
                {
                    _SafeStr_5010.goBackToInitialState();
                };
                _groupId = _arg_1;
                _SafeStr_4144.send(new _SafeStr_1029(_arg_1, 0, "", _arg_2));
            };
        }

        public function show():void
        {
            prepareWindow();
            refresh();
            _window.visible = true;
            _window.activate();
        }

        public function reload():void
        {
            if (((!(_window == null)) && (_window.visible)))
            {
                refresh();
            };
        }

        private function refresh():void
        {
            var _local_2:int;
            _SafeStr_4144.localization.registerParameter("group.members.title", "groupName", _SafeStr_3740.groupName);
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_window.findChildByName("members_cont"));
            var _local_4:Array = _SafeStr_3740.entries;
            _local_2 = 0;
            while (_local_2 < _SafeStr_3740.pageSize)
            {
                refreshEntry(_local_3, _local_2, _local_4[_local_2]);
                _local_2++;
            };
            var _local_1:_SafeStr_3349 = (_SafeStr_3199(_window.findChildByName("group_logo")).widget as _SafeStr_3349);
            _local_1.badgeId = _SafeStr_3740.badgeCode;
            _local_1.groupId = _SafeStr_3740.groupId;
            _SafeStr_4144.localization.registerParameter("group.members.pageinfo", "amount", ("" + _SafeStr_3740.totalEntries));
            _SafeStr_4144.localization.registerParameter("group.members.pageinfo", "page", ("" + (_SafeStr_3740.pageIndex + 1)));
            _SafeStr_4144.localization.registerParameter("group.members.pageinfo", "totalPages", ("" + _SafeStr_3740.totalPages));
            _window.findChildByName("previous_page_button").visible = hasPreviousPage();
            _window.findChildByName("next_page_button").visible = hasNextPage();
        }

        private function prepareWindow():void
        {
            if (_window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_SafeStr_4144.getXmlWindow("guild_members_window"));
            _window.findChildByTag("close").procedure = onClose;
            _window.findChildByName("previous_page_button").procedure = onPreviousPage;
            _window.findChildByName("next_page_button").procedure = onNextPage;
            _SafeStr_5010 = new InfoText(ITextFieldWindow(_window.findChildByName("filter_members_input")), _SafeStr_4144.localization.getLocalization("group.members.searchinfo"));
            _window.center();
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            close();
        }

        public function close():void
        {
            if (_window != null)
            {
                _groupId = 0;
                _window.visible = false;
            };
        }

        private function refreshEntry(_arg_1:_SafeStr_3133, _arg_2:int, _arg_3:_SafeStr_1171):void
        {
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_arg_1.getChildAt(_arg_2));
            if (_local_4 == null)
            {
                if (_arg_3 == null)
                {
                    return;
                };
                _local_4 = getListEntry();
                _local_4.tags[0] = ("" + _arg_2);
                _arg_1.addChild(_local_4);
                _local_4.x = (((_arg_2 % 2) == 0) ? 0 : (_local_4.width + MEMBER_SPACING.x));
                _local_4.y = (Math.floor((_arg_2 / 2)) * (_local_4.height + MEMBER_SPACING.y));
            };
            if (_arg_3 != null)
            {
                refreshUserEntry(_local_4, _arg_3);
                _local_4.visible = true;
            }
            else
            {
                _local_4.visible = false;
            };
        }

        public function refreshUserEntry(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1171):void
        {
            var _local_8:Boolean;
            _arg_1.findChildByName("user_name_txt").caption = _arg_2.userName;
            _arg_1.findChildByName("icon_owner").visible = _arg_2.owner;
            this.setAdminState(_arg_2.member, _arg_2.admin, _arg_1);
            var _local_5:_SafeStr_3109 = _arg_1.findChildByName("admin_container");
            _local_5.visible = ((!(_local_8)) && ((_arg_2.admin) || (_SafeStr_3740.allowedToManage)));
            var _local_9:IRegionWindow = IRegionWindow(_arg_1.findChildByName("bg_region"));
            _local_9.id = _arg_2.userId;
            this.setRemoveState(false, _arg_1);
            this.setActionLinkState(false, _arg_1);
            _local_8 = (_arg_2.userId == _SafeStr_4144.avatarId);
            var _local_11:IRegionWindow = IRegionWindow(_arg_1.findChildByName("remove_region"));
            _local_11.toolTipCaption = _SafeStr_4144.localization.getLocalization(((_arg_2.member) ? "group.members.kick" : "group.members.reject"));
            _local_11.visible = ((((!(_arg_2.owner)) && (!(_local_8))) && (_SafeStr_3740.allowedToManage)) && (!(_arg_2.blocked)));
            _local_11.id = _arg_2.userId;
            var _local_6:Boolean = ((((((_arg_2.member) && (!(_arg_2.owner))) && (!(_local_8))) && (_SafeStr_3740.allowedToManage)) && (_SafeStr_4144.getBoolean("group.blocking.enabled"))) && (!(_arg_2.blocked)));
            var _local_3:IRegionWindow = IRegionWindow(_arg_1.findChildByName("block_region"));
            _local_3.toolTipCaption = _SafeStr_4144.localization.getLocalization("group.members.block");
            _local_3.visible = _local_6;
            _local_3.id = _arg_2.userId;
            var _local_4:Boolean = ((!(_local_8)) && (_SafeStr_3740.allowedToManage));
            var _local_10:IRegionWindow = IRegionWindow(_arg_1.findChildByName("action_link_region"));
            _local_10.visible = _local_4;
            _local_10.id = _arg_2.userId;
            var _local_7:ITextWindow = ITextWindow(_arg_1.findChildByName("member_since_txt"));
            _local_7.visible = ((!(_local_4)) && (!(_arg_2.memberSince == "")));
            _SafeStr_4144.localization.registerParameter("group.members.since", "date", _arg_2.memberSince);
            _local_7.caption = _SafeStr_4144.localization.getLocalization("group.members.since");
            _SafeStr_3289(_SafeStr_3199(_arg_1.findChildByName("avatar_image")).widget).figure = _arg_2.figure;
            if (_arg_2.blocked)
            {
                setActionLink(_arg_1, "group.members.unblock", false);
            }
            else
            {
                if (_arg_2.owner)
                {
                    setActionLink(_arg_1, "group.members.owner", false);
                }
                else
                {
                    if (_arg_2.admin)
                    {
                        setActionLink(_arg_1, "group.members.removerights", true);
                    }
                    else
                    {
                        if (_arg_2.member)
                        {
                            setActionLink(_arg_1, "group.members.giverights", true);
                        }
                        else
                        {
                            setActionLink(_arg_1, "group.members.accept", true);
                        };
                    };
                };
            };
        }

        public function getListEntry():_SafeStr_3133
        {
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4144.getXmlWindow("member_entry"));
            var _local_3:IRegionWindow = IRegionWindow(_local_1.findChildByName("bg_region"));
            _local_3.procedure = onBg;
            var _local_2:IRegionWindow = IRegionWindow(_local_1.findChildByName("block_region"));
            _local_2.addEventListener("WME_OVER", onRemoveMouseOver);
            _local_2.addEventListener("WME_OUT", onRemoveMouseOut);
            _local_2.addEventListener("WME_CLICK", onBlockMouseClick);
            var _local_5:IRegionWindow = IRegionWindow(_local_1.findChildByName("remove_region"));
            _local_5.addEventListener("WME_OVER", onRemoveMouseOver);
            _local_5.addEventListener("WME_OUT", onRemoveMouseOut);
            _local_5.addEventListener("WME_CLICK", onRemoveMouseClick);
            var _local_4:IRegionWindow = IRegionWindow(_local_1.findChildByName("action_link_region"));
            _local_4.addEventListener("WME_OVER", onActionLinkMouseOver);
            _local_4.addEventListener("WME_OUT", onActionLinkMouseOut);
            _local_4.addEventListener("WME_CLICK", onActionLinkClick);
            return (_local_1);
        }

        private function onRemoveMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_2:IRegionWindow = IRegionWindow(_arg_1.target);
            setRemoveState(true, _local_2);
        }

        private function onRemoveMouseOut(_arg_1:_SafeStr_3116):void
        {
            var _local_2:IRegionWindow = IRegionWindow(_arg_1.target);
            setRemoveState(false, _local_2);
        }

        private function onRemoveMouseClick(_arg_1:_SafeStr_3116):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.target;
            var _local_2:_SafeStr_1171 = _SafeStr_3740.getUser(_local_3.id);
            if (((_local_2 == null) || (_local_2.owner)))
            {
                return;
            };
            if (_local_2.member)
            {
                _SafeStr_4144.handleUserKick(_local_3.id, _SafeStr_3740.groupId);
            }
            else
            {
                _SafeStr_4144.send(new _SafeStr_981(_SafeStr_3740.groupId, _local_2.userId));
            };
        }

        private function onBlockMouseClick(_arg_1:_SafeStr_3116):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.target;
            var _local_2:_SafeStr_1171 = _SafeStr_3740.getUser(_local_3.id);
            if (((_local_2 == null) || (_local_2.owner)))
            {
                return;
            };
            if (_local_2.member)
            {
                _SafeStr_4144.handleUserBlock(_local_3.id, _SafeStr_3740.groupId);
            };
        }

        private function setActionLink(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean):void
        {
            var _local_4:ITextWindow = ITextWindow(_arg_1.findChildByName("action_link"));
            _local_4.text = _SafeStr_4144.localization.getLocalization(_arg_2, _arg_2);
            _local_4.underline = _arg_3;
        }

        private function setRemoveState(_arg_1:Boolean, _arg_2:_SafeStr_3133):void
        {
            _arg_2.findChildByName("icon_close_off").visible = (!(_arg_1));
            _arg_2.findChildByName("icon_close_over").visible = _arg_1;
            _arg_2.findChildByName("icon_close_down").visible = false;
        }

        private function setActionLinkState(_arg_1:Boolean, _arg_2:_SafeStr_3133):void
        {
            var _local_3:ITextWindow = ITextWindow(_arg_2.findChildByName("action_link"));
            _local_3.textColor = ((_arg_1) ? 4280984060 : 4285492837);
        }

        private function onActionLinkMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_3:IRegionWindow = IRegionWindow(_arg_1.target);
            var _local_2:_SafeStr_1171 = _SafeStr_3740.getUser(_arg_1.target.id);
            if (((_local_2 == null) || (_local_2.owner)))
            {
                return;
            };
            setActionLinkState(true, _local_3);
            setAdminState(_local_2.member, (!(_local_2.admin)), _SafeStr_3133(_local_3.parent));
        }

        private function onActionLinkMouseOut(_arg_1:_SafeStr_3116):void
        {
            var _local_3:IRegionWindow = IRegionWindow(_arg_1.target);
            setActionLinkState(false, _local_3);
            var _local_2:_SafeStr_1171 = _SafeStr_3740.getUser(_arg_1.target.id);
            if (_local_2 != null)
            {
                setAdminState(_local_2.member, _local_2.admin, _SafeStr_3133(_local_3.parent));
            };
        }

        private function onActionLinkClick(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_1171 = _SafeStr_3740.getUser(_arg_1.target.id);
            if (((_local_2 == null) || (_local_2.owner)))
            {
                return;
            };
            if (_local_2.blocked)
            {
                _SafeStr_4144.send(new _SafeStr_858(_SafeStr_3740.groupId, _local_2.userId));
            }
            else
            {
                if (_local_2.admin)
                {
                    _SafeStr_4144.send(new _SafeStr_553(_SafeStr_3740.groupId, _local_2.userId));
                }
                else
                {
                    if (_local_2.member)
                    {
                        _SafeStr_4144.send(new _SafeStr_124(_SafeStr_3740.groupId, _local_2.userId));
                    }
                    else
                    {
                        _SafeStr_4144.send(new _SafeStr_219(_SafeStr_3740.groupId, _local_2.userId));
                    };
                };
            };
        }

        private function setAdminState(_arg_1:Boolean, _arg_2:Boolean, _arg_3:_SafeStr_3133):void
        {
            _arg_3.findChildByName("icon_admin_off").visible = ((_arg_1) && (_arg_2));
            _arg_3.findChildByName("icon_admin_over").visible = ((_arg_1) && (!(_arg_2)));
        }

        private function onBg(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4144.send(new _SafeStr_313(_arg_2.id));
            };
        }

        private function onFilterMembers(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WE_CHANGE")
            {
                _SafeStr_5009.reset();
                _SafeStr_5009.start();
                setSearchingIcon(true);
            };
        }

        private function onTypeDropmenu(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WE_SELECTED")
            {
                doSearch(0);
            };
        }

        private function doSearch(_arg_1:int):void
        {
            _SafeStr_5009.stop();
            _SafeStr_5009.reset();
            setSearchingIcon(true);
            var _local_2:_SafeStr_1135 = _SafeStr_3740;
            var _local_3:String = _SafeStr_5010.getText();
            var _local_4:int = getTypeDropMenu().selection;
            _SafeStr_4144.send(new _SafeStr_1029(_local_2.groupId, _arg_1, _local_3, _local_4));
        }

        private function onAcceptAll(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.send(new _SafeStr_304(_SafeStr_3740.groupId));
        }

        private function getTypeDropMenu():_SafeStr_3269
        {
            return (_SafeStr_3269(_window.findChildByName("type_drop_menu")));
        }

        private function onSearchTimer(_arg_1:Event):void
        {
            if (((!(_window == null)) && (_window.visible)))
            {
                doSearch(0);
            };
        }

        private function onNextPage(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            doSearch(limitPageIndex((_SafeStr_3740.pageIndex + 1)));
        }

        private function onPreviousPage(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            doSearch(limitPageIndex((_SafeStr_3740.pageIndex - 1)));
        }

        private function hasPreviousPage():Boolean
        {
            return (!(_SafeStr_3740.pageIndex == limitPageIndex((_SafeStr_3740.pageIndex - 1))));
        }

        private function hasNextPage():Boolean
        {
            return (!(_SafeStr_3740.pageIndex == limitPageIndex((_SafeStr_3740.pageIndex + 1))));
        }

        private function limitPageIndex(_arg_1:int):int
        {
            var _local_2:int = int(Math.ceil((_SafeStr_3740.totalEntries / _SafeStr_3740.pageSize)));
            return (Math.max(0, Math.min(_arg_1, (_local_2 - 1))));
        }

        public function get data():_SafeStr_1135
        {
            return (_SafeStr_3740);
        }

        private function populateSearchTypes():void
        {
            var _local_2:Array = [];
            _local_2.push("${group.members.search.all}");
            _local_2.push("${group.members.search.admins}");
            if (_SafeStr_3740.allowedToManage)
            {
                _local_2.push("${group.members.search.pending}");
                if (_SafeStr_4144.getBoolean("group.blocking.enabled"))
                {
                    _local_2.push("${group.members.search.blocked}");
                };
            };
            var _local_1:_SafeStr_3269 = getTypeDropMenu();
            _local_1.procedure = null;
            _local_1.populate(_local_2);
            _local_1.selection = ((_SafeStr_3740.allowedToManage) ? _SafeStr_3740.searchType : Math.min(_SafeStr_3740.searchType, 1));
            _local_1.procedure = onTypeDropmenu;
        }

        private function populateUserNameFilter():void
        {
            var _local_1:ITextFieldWindow = _SafeStr_5010.input;
            _local_1.procedure = null;
            if (_SafeStr_5010.getText() != _SafeStr_3740.userNameFilter)
            {
                _SafeStr_5010.setText(_SafeStr_3740.userNameFilter);
            };
            _local_1.procedure = onFilterMembers;
            _SafeStr_5009.stop();
            setSearchingIcon(false);
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1029 = "_-r1H" (String#21247, DoABC#4)
// _SafeStr_1135 = "_-is" (String#18084, DoABC#4)
// _SafeStr_1171 = "_-rf" (String#7835, DoABC#4)
// _SafeStr_124 = "_-91y" (String#30467, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1525 = "_-J1s" (String#38739, DoABC#4)
// _SafeStr_169 = "_-n1v" (String#20834, DoABC#4)
// _SafeStr_219 = "_-gy" (String#31351, DoABC#4)
// _SafeStr_221 = "_-ct" (String#23930, DoABC#4)
// _SafeStr_304 = "_-U1u" (String#28800, DoABC#4)
// _SafeStr_307 = "_-X1B" (String#15794, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_5009 = "_-V" (String#5219, DoABC#4)
// _SafeStr_5010 = "_-K1V" (String#5745, DoABC#4)
// _SafeStr_553 = "_-Nq" (String#30689, DoABC#4)
// _SafeStr_631 = "_-D1v" (String#19034, DoABC#4)
// _SafeStr_852 = "_-19" (String#24313, DoABC#4)
// _SafeStr_858 = "_-jt" (String#30722, DoABC#4)
// _SafeStr_981 = "_-3z" (String#28988, DoABC#4)


