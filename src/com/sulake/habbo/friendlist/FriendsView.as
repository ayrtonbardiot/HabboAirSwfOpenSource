// by nota

//com.sulake.habbo.friendlist.FriendsView

package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendlist.domain.FriendCategory;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.friendlist.domain.Friend;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.habbo.utils.ExtendedProfileIcon;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-Po._SafeStr_428;
    import _-qv._SafeStr_895;
    import _-XO._SafeStr_313;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.utils.Dictionary;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.utils.getTimer;
    import com.sulake.core.window.components.ITextWindow;

    public class FriendsView implements ITabView, _SafeStr_3132 
    {

        public static const BG_NAME:String = "bg";
        private static const VIP_ICON_STYLE:int = 14;
        public static const ROOM_INVITATION_DELAY:int = 60000;

        private var _friendList:HabboFriendList;
        private var _minimailButton:_SafeStr_3240;
        private var _homeButton:_SafeStr_3240;
        private var _inviteButton:_SafeStr_3240;
        private var _removeButton:_SafeStr_3240;
        private var _SafeStr_4162:IItemListWindow;
        private var _SafeStr_4161:RelationshipStatusSelector;


        public function init(_arg_1:HabboFriendList):void
        {
            _friendList = _arg_1;
        }

        public function getEntryCount():int
        {
            return (_friendList.categories.getFriendCount(true));
        }

        public function fillFooter(_arg_1:_SafeStr_3133):void
        {
            _minimailButton = initButton("open_minimail", onMinimailButtonClick, _arg_1);
            _homeButton = initButton("open_homepage", onHomeButtonClick, _arg_1);
            _inviteButton = initButton("room_invite", onInviteButtonClick, _arg_1);
            _removeButton = initButton("remove_friend", onRemoveButtonClick, _arg_1);
            refreshButtons();
        }

        public function fillList(_arg_1:IItemListWindow):void
        {
            _SafeStr_4162 = _arg_1;
            this.refreshList();
        }

        public function tabClicked(_arg_1:int):void
        {
            if (_SafeStr_4161)
            {
                _SafeStr_4161.disappear();
            };
        }

        public function setNewMessageArrived():void
        {
            _friendList.tabs.findTab(1).setNewMessageArrived(true);
        }

        public function refreshList():void
        {
            var _local_1:int;
            var _local_5:int;
            var _local_3:int;
            var _local_2:Boolean;
            if (_SafeStr_4162 == null)
            {
                return;
            };
            if (!_SafeStr_4161)
            {
                _SafeStr_4161 = new RelationshipStatusSelector(_friendList);
            };
            _SafeStr_4161.disappear();
            _SafeStr_4162.autoArrangeItems = false;
            var _local_6:int;
            for each (var _local_4:FriendCategory in _friendList.categories.getCategories())
            {
                refreshEntry(true, _local_6, _local_4, null);
                _local_6++;
                if (_local_4.open)
                {
                    _local_1 = _local_4.getStartFriendIndex();
                    _local_5 = _local_4.getEndFriendIndex();
                    _local_3 = _local_1;
                    while (_local_3 < _local_5)
                    {
                        refreshEntry(true, _local_6, _local_4, _local_4.friends[_local_3]);
                        _local_6++;
                        _local_3++;
                    };
                };
            };
            while (true)
            {
                _local_2 = refreshEntry(false, _local_6, null, null);
                if (_local_2) break;
                _local_6++;
            };
            _SafeStr_4162.autoArrangeItems = true;
            refreshButtons();
        }

        public function refreshed():void
        {
            if (_SafeStr_4161)
            {
                _SafeStr_4161.disappear();
            };
        }

        private function initButton(_arg_1:String, _arg_2:Function, _arg_3:_SafeStr_3133):_SafeStr_3240
        {
            var _local_4:_SafeStr_3240 = _SafeStr_3240(_arg_3.findChildByName(("button_" + _arg_1)));
            _local_4.procedure = _arg_2;
            var _local_5:_SafeStr_3264 = _SafeStr_3264(_local_4.findChildByName("icon"));
            _local_5.bitmap = _friendList.getButtonImage(_arg_1);
            _local_5.width = _local_5.bitmap.width;
            _local_5.height = _local_5.bitmap.height;
            return (_local_4);
        }

        private function refreshEntry(_arg_1:Boolean, _arg_2:int, _arg_3:FriendCategory, _arg_4:Friend):Boolean
        {
            var _local_6:* = ((_arg_2 % 2) == 1);
            var _local_5:_SafeStr_3133 = (_SafeStr_4162.getListItemAt(_arg_2) as _SafeStr_3133);
            if (_local_5 == null)
            {
                if (!_arg_1)
                {
                    return (true);
                };
                _local_5 = _SafeStr_3133(_friendList.getXmlWindow("friend_entry"));
                _local_5.findChildByName("user_info_region").procedure = onUserInfo;
                _SafeStr_4162.addListItem(_local_5);
            };
            Util.hideChildren(_local_5);
            if (!_arg_1)
            {
                _local_5.height = 0;
                _local_5.visible = false;
                return (false);
            };
            _local_5.height = 20;
            _local_5.visible = true;
            _local_5.color = _friendList.laf.getRowShadingColor(1, _local_6);
            if (_arg_4 == null)
            {
                _arg_3.view = _local_5;
                this.refreshCategoryEntry(_arg_3, _local_6);
            }
            else
            {
                _arg_4.view = _local_5;
                this.refreshFriendEntry(_arg_3, _arg_4, _local_6);
            };
            return (false);
        }

        public function refreshCategoryEntry(_arg_1:FriendCategory, _arg_2:Boolean):void
        {
            if (this._SafeStr_4162 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3133 = _arg_1.view;
            _local_3.tags.splice(0, _local_3.tags.length);
            _local_3.tags.push(_arg_1.id);
            _friendList.refreshText(_local_3, "caption", true, (((_arg_1.name + " (") + _arg_1.friends.length) + ")"));
            refreshCatIcon(_local_3, "arrow_down_black", _arg_1.open, _arg_1.id, 6);
            refreshCatIcon(_local_3, "arrow_right_black", (!(_arg_1.open)), _arg_1.id, 9);
            _local_3.procedure = onCategoryClick;
            _local_3.visible = false;
            refreshPager(_arg_1, _arg_2);
            _local_3.height = Math.max(Util.getLowestPoint(_local_3), 20);
            _local_3.visible = true;
        }

        private function refreshFriendEntry(_arg_1:FriendCategory, _arg_2:Friend, _arg_3:Boolean=false):void
        {
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return;
            };
            var _local_4:_SafeStr_3133 = _arg_2.view;
            if (_local_4 == null)
            {
                return;
            };
            _local_4.id = _arg_2.id;
            _local_4.procedure = onFriendClick;
            _local_4.visible = true;
            if (_arg_2.selected)
            {
                _local_4.color = _friendList.laf.getSelectedEntryBgColor();
            }
            else
            {
                if (_arg_3)
                {
                    _local_4.color = _friendList.laf.getRowShadingColor(1, true);
                };
            };
            ILabelWindow(_arg_2.view.findChildByName("name")).textColor = _friendList.laf.getFriendTextColor(_arg_2.selected);
            var _local_5:String = _arg_2.name;
            if (((!(_arg_2.realName == null)) && (!(_arg_2.realName == ""))))
            {
                _local_5 = (((_local_5 + " (") + _arg_2.realName) + ")");
            };
            _friendList.refreshText(_local_4, "name", true, _local_5);
            var _local_6:Boolean = ((_friendList.isMessagesPersisted()) && ((_arg_2.persistedMessageUser) || (_arg_2.pocketHabboUser)));
            _friendList.refreshButton(_local_4, "start_chat", ((_arg_2.online) || (_local_6)), onChatButtonClick, _arg_2.id);
            _friendList.refreshButton(_local_4, "follow_friend", _arg_2.followingAllowed, onFollowButtonClick, _arg_2.id);
            _friendList.refreshRelationshipRegion(_local_4, "relationship_status", _arg_2.relationshipStatus, onRelationshipStatusRegion, _arg_2.id);
            refreshFigure(_local_4, _arg_2);
            _local_4.findChildByName("user_info_region").visible = true;
            _local_4.findChildByName("user_info_region").id = _arg_2.id;
            ExtendedProfileIcon.setUserInfoState(false, _local_4);
        }

        private function refreshCatIcon(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:int):void
        {
            var _local_6:* = null;
            var _local_7:* = null;
            _friendList.refreshButton(_arg_1, _arg_2, _arg_3, onCategoryClick, _arg_4);
            if (_arg_3)
            {
                _local_6 = ILabelWindow(_arg_1.findChildByName("caption"));
                _local_7 = _arg_1.findChildByName(_arg_2);
                _local_7.x = (_local_6.textWidth + _arg_5);
            };
        }

        private function refreshFigure(_arg_1:_SafeStr_3133, _arg_2:Friend):void
        {
            var _local_3:* = null;
            if (!_arg_1)
            {
                ErrorReportStorage.addDebugData("FriendsView", "refreshFigure: e is null!");
            };
            if (!_arg_2)
            {
                ErrorReportStorage.addDebugData("FriendsView", "refreshFigure: f is null!");
            };
            var _local_4:_SafeStr_3264 = (_arg_1.getChildByName("face") as _SafeStr_3264);
            if (!_local_4)
            {
                ErrorReportStorage.addDebugData("FriendsView", "refreshFigure: child is null!");
            };
            if (!_friendList)
            {
                ErrorReportStorage.addDebugData("FriendsView", "refreshFigure: _friendList is null!");
            };
            if (((_arg_2.figure == null) || (_arg_2.figure == "")))
            {
                _local_4.visible = false;
            }
            else
            {
                if (_arg_2.face == null)
                {
                    if (_arg_2.isGroupFriend())
                    {
                        _arg_2.face = _friendList.getSmallGroupBadgeBitmap(_arg_2.figure);
                    }
                    else
                    {
                        _arg_2.face = _friendList.getAvatarFaceBitmap(_arg_2.figure);
                    };
                };
                if (_local_4.bitmap == null)
                {
                    _local_4.bitmap = new BitmapData(_local_4.width, _local_4.height);
                };
                if (_local_4.tags[0] != _arg_2.figure)
                {
                    _local_4.tags.splice(0, _local_4.tags.length);
                    _local_4.tags.push(_arg_2.figure);
                    _local_4.bitmap.fillRect(_local_4.bitmap.rect, 0);
                    _local_3 = _arg_2.face;
                    if (_local_3)
                    {
                        _local_4.bitmap.copyPixels(_local_3, _local_3.rect, new Point(0, 0), null, null, true);
                    };
                }
                else
                {
                    _SafeStr_14.log(("Figure unchanged: " + _local_4.tags[0]));
                };
                _local_4.visible = true;
            };
        }

        private function getBgColor(_arg_1:Boolean):uint
        {
            return (_friendList.laf.getRowShadingColor(1, _arg_1));
        }

        private function refreshButtons():void
        {
            var _local_1:Array = _friendList.categories.getSelectedFriends();
            setEnabled(_minimailButton, isEnableMinimailButton(_local_1));
            setEnabled(_homeButton, isEnableHomeButton(_local_1));
            setEnabled(_inviteButton, isEnableInviteButton(_local_1));
            setEnabled(_removeButton, isEnableRemoveButton(_local_1));
        }

        private function setEnabled(_arg_1:_SafeStr_3240, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                _arg_1.enable();
            }
            else
            {
                _arg_1.disable();
            };
        }

        private function isEnableMinimailButton(_arg_1:Array):Boolean
        {
            return ((_friendList.isEmbeddedMinimailEnabled()) || (_arg_1.length == 1));
        }

        private function isEnableHomeButton(_arg_1:Array):Boolean
        {
            return (_arg_1.length == 1);
        }

        private function isEnableInviteButton(_arg_1:Array):Boolean
        {
            if (_arg_1.length < 1)
            {
                return (false);
            };
            for each (var _local_2:Friend in _arg_1)
            {
                if (_local_2.online)
                {
                    return (true);
                };
            };
            return (true);
        }

        private function isEnableRemoveButton(_arg_1:Array):Boolean
        {
            return (_arg_1.length > 0);
        }

        private function onCategoryClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log(((("Category clicked: " + _arg_2.name) + ", ") + _arg_2.tags[0]));
            if (_arg_2.tags.length == 0)
            {
                _arg_2 = _arg_2.parent;
            };
            _SafeStr_14.log(((("Category id: " + _arg_2.name) + ", ") + _arg_2.tags[0]));
            var _local_3:int = _arg_2.tags[0];
            _SafeStr_14.log(("Cat id: " + _local_3));
            var _local_4:FriendCategory = _friendList.categories.findCategory(_local_3);
            _local_4.setOpen((!(_local_4.open)));
            this.refreshList();
            this._friendList.view.refresh("Cat open/closed");
        }

        private function onFriendClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_2 == null)
            {
                return;
            };
            if (_arg_2.id == 0)
            {
                _arg_2 = _arg_2.parent;
                if (_arg_2 == null)
                {
                    return;
                };
            };
            if (((_arg_1.type == "WME_CLICK") || (_arg_1.type == "WME_DOUBLE_CLICK")))
            {
                _local_3 = _friendList.categories.findFriend(_arg_2.id);
                if (_local_3.id > 0)
                {
                    _local_3.selected = ((!(_local_3 == null)) && (!(_local_3.selected)));
                    refreshButtons();
                    refreshList();
                };
                if ((((_arg_1.type == "WME_DOUBLE_CLICK") && (!(_local_3 == null))) && (_local_3.online)))
                {
                    _friendList.messenger.startConversation(_local_3.id);
                };
            };
        }

        private function onChatButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.im}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log(((("chat clicked: " + _arg_2.name) + ", ") + _arg_2.id));
            _friendList.messenger.startConversation(_arg_2.id);
        }

        private function onFollowButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.follow}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _friendList.send(new _SafeStr_428(_arg_2.id));
            _friendList.send(new _SafeStr_895("Navigation", "Friend List", "go.friendlist"));
        }

        private function onRelationshipStatusRegion(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            if (_arg_2.id == 0)
            {
                _arg_2 = _arg_2.parent;
                if (_arg_2 == null)
                {
                    return;
                };
            };
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.relationship}");
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4161.friendId = _arg_2.id;
                _SafeStr_4161.appearAt(_arg_2, _friendList.view.mainWindow);
            };
        }

        private function onUserInfo(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${infostand.profile.link.tooltip}");
            if (_arg_1.type == "WME_OVER")
            {
                ExtendedProfileIcon.setUserInfoState(true, _SafeStr_3133(_arg_2));
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    ExtendedProfileIcon.setUserInfoState(false, _SafeStr_3133(_arg_2));
                }
                else
                {
                    if (_arg_1.type == "WME_CLICK")
                    {
                        _friendList.trackGoogle("extendedProfile", "friendList_friendsView");
                        _friendList.send(new _SafeStr_313(_arg_2.parent.id));
                    };
                };
            };
        }

        private function onMinimailButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_5:int;
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.compose}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            var _local_4:Array = _friendList.categories.getSelectedFriends();
            if (_local_4.length == 0)
            {
                _SafeStr_14.log("No friend found when minimail clicked");
                if (_friendList.isEmbeddedMinimailEnabled())
                {
                    HabboWebTools.openMinimail("#mail/inbox/");
                };
                return;
            };
            var _local_6:Dictionary = new Dictionary();
            var _local_3:Array = [];
            _local_5 = 0;
            while (((_local_5 < _local_4.length) && (_local_5 < 50)))
            {
                _local_3.push(_local_4[_local_5].id);
                _local_5++;
            };
            _local_6["recipientid"] = _local_3.join(",");
            _local_6["random"] = ("" + Math.round((Math.random() * 100000000)));
            var _local_7:WindowMouseEvent = (_arg_1 as WindowMouseEvent);
            if (_friendList.isEmbeddedMinimailEnabled())
            {
                HabboWebTools.openMinimail((((("#mail/compose/" + _local_6["recipientid"]) + "/") + _local_6["random"]) + "/"));
            }
            else
            {
                _friendList.openHabboWebPage("link.format.mail.compose", _local_6, _local_7.stageX, _local_7.stageY);
            };
        }

        private function onHomeButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.home}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            var _local_3:Friend = _friendList.categories.getSelectedFriend();
            if (_local_3 == null)
            {
                _SafeStr_14.log("No friend found when home clicked");
                return;
            };
            var _local_4:Dictionary = new Dictionary();
            _local_4["ID"] = ("" + _local_3.id);
            _local_4["username"] = _local_3.name;
            var _local_5:WindowMouseEvent = (_arg_1 as WindowMouseEvent);
            _friendList.openHabboWebPage("link.format.userpage", _local_4, _local_5.stageX, _local_5.stageY);
        }

        private function onInviteButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.invite}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if ((getTimer() - _friendList.lastRoomInvitationTime) < 60000)
            {
                _friendList.simpleAlert("${friendlist.invite.frequentalert.title}", "${friendlist.invite.frequentalert.text}");
                return;
            };
            new RoomInviteView(_friendList).show();
        }

        private function onRemoveButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.remove}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            new FriendRemoveView(_friendList).show();
        }

        private function refreshPager(_arg_1:FriendCategory, _arg_2:Boolean):void
        {
            var _local_3:int;
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_arg_1.view.findChildByName("pager"));
            if (((_arg_1.getPageCount() < 2) || (!(_arg_1.open))))
            {
                _SafeStr_14.log(((("PAGER NOT VISIBLE: " + _arg_1.open) + ", ") + _arg_1.getPageCount()));
                _local_4.visible = false;
                return;
            };
            _local_4.visible = true;
            Util.hideChildren(_local_4);
            _local_3 = 0;
            while (_local_3 < _arg_1.getPageCount())
            {
                refreshPageLink(_local_4, _local_3, _arg_1.pageIndex, _arg_2);
                _local_3++;
            };
            Util.layoutChildrenInArea(_local_4, _local_4.width, 15);
            _local_4.height = Util.getLowestPoint(_local_4);
        }

        private function refreshPageLink(_arg_1:_SafeStr_3133, _arg_2:int, _arg_3:int, _arg_4:Boolean):void
        {
            var _local_5:String = ("page." + _arg_2);
            var _local_6:ITextWindow = ITextWindow(_arg_1.getChildByName(_local_5));
            if (_local_6 == null)
            {
                _local_6 = ITextWindow(_friendList.getXmlWindow("pagelink"));
                _local_6.name = _local_5;
                _arg_1.addChild(_local_6);
            };
            _local_6.underline = (!(_arg_2 == _arg_3));
            _local_6.text = ((("" + ((_arg_2 * 100) + 1)) + "-") + ("" + ((_arg_2 + 1) * 100)));
            _local_6.id = _arg_2;
            _local_6.procedure = onPageLinkClick;
            _local_6.width = (_local_6.textWidth + 5);
            _local_6.color = _friendList.laf.getRowShadingColor(1, _arg_4);
            _local_6.visible = true;
        }

        private function onPageLinkClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            var _local_6:ITextWindow = ITextWindow(_arg_2);
            var _local_3:int = _local_6.parent.parent.tags[0];
            var _local_5:int = _local_6.id;
            _SafeStr_14.log(((("Page link clicked: " + _local_3) + ", ") + _local_5));
            var _local_4:FriendCategory = _friendList.categories.findCategory(_local_3);
            _local_4.pageIndex = _local_5;
            this.refreshList();
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3132 = "_-31A" (String#9784, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4161 = "_-qi" (String#6867, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_428 = "_-5Z" (String#7229, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


