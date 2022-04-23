// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.groupforums.ThreadListView

package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import _-Wi._SafeStr_1645;
    import com.sulake.core.window.components.ITextWindow;
    import _-Wi._SafeStr_1633;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class ThreadListView 
    {

        private var _SafeStr_4360:GroupForumController;
        private var _SafeStr_3761:GroupForumView;
        private var _SafeStr_4162:IScrollableListWindow;
        private var _SafeStr_6579:_SafeStr_3133;
        private var _SafeStr_5321:_SafeStr_1645;
        private var _SafeStr_5326:ThreadsListData;

        public function ThreadListView(_arg_1:GroupForumView, _arg_2:IScrollableListWindow, _arg_3:_SafeStr_1645, _arg_4:ThreadsListData)
        {
            _SafeStr_3761 = _arg_1;
            _SafeStr_4360 = _SafeStr_3761.controller;
            _SafeStr_4162 = _arg_2;
            _SafeStr_6579 = (_SafeStr_4360.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_thread_list_item_xml())) as _SafeStr_3133);
            _SafeStr_5321 = _arg_3;
            _SafeStr_5326 = _arg_4;
        }

        private static function getThreadColor(_arg_1:int, _arg_2:int):uint
        {
            switch (_arg_1)
            {
                case 10:
                    return (4289374890);
                case 20:
                    return (0xFFFFB0A5);
                case 0:
                case 1:
                default:
                    return (((_arg_2 + 1) % 2) ? 4293852927 : 4289914618);
            };
        }


        public function update():void
        {
            var _local_2:int;
            var _local_1:* = null;
            var _local_3:* = null;
            _SafeStr_4162.invalidate();
            _local_2 = 0;
            while (_local_2 < _SafeStr_5326.size)
            {
                _local_3 = _SafeStr_5326.threads[_local_2];
                _local_1 = (_SafeStr_6579.clone() as _SafeStr_3133);
                _local_1.name = ("thread_" + _local_3.threadId);
                updateListItem(_local_1, _local_3, _local_2);
                _SafeStr_4162.addListItem(_local_1);
                _local_2++;
            };
            updateItemWidths();
        }

        private function updateListItem(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1633, _arg_3:int):void
        {
            var _local_13:* = null;
            var _local_10:* = null;
            var _local_7:_SafeStr_3133 = (_arg_1 as _SafeStr_3133);
            var _local_11:int = _arg_2.state;
            var _local_8:Boolean = _SafeStr_5321.canModerate;
            var _local_4:Boolean = _SafeStr_5321.isStaff;
            var _local_6:Boolean = _arg_2.isSticky;
            var _local_9:Boolean = _arg_2.isLocked;
            var _local_5:int = ((_arg_2.nMessages - _SafeStr_4360.getThreadLastReadMessageIndex(_arg_2.threadId)) - 1);
            _local_13 = _local_7.findChildByName("texts_container");
            if (_local_13 != null)
            {
                _local_13.id = _arg_2.threadId;
                _local_13.color = getThreadColor(_local_11, _arg_3);
            };
            var _local_12:ITextWindow = (_local_7.findChildByName("header") as ITextWindow);
            if (_local_12 != null)
            {
                _local_12.bold = (_local_5 > 0);
                _local_10 = _arg_2.header;
                if (_arg_2.header == "")
                {
                    _local_10 = "(No Subject)";
                };
                if ((((_local_11 > 1) && (!(_local_8))) && (!(_local_4))))
                {
                    _local_10 = getModerationMessage(_arg_2);
                };
                _local_12.text = _local_10;
            };
            _local_13 = _local_7.findChildByName("header_region");
            if (_local_13 != null)
            {
                _local_13.id = _arg_2.threadId;
                _local_13.removeEventListener("WME_CLICK", onGoToFirstUnread);
                _local_13.addEventListener("WME_CLICK", onGoToFirstUnread);
            };
            _local_13 = _local_7.findChildByName("details");
            if (_local_13 != null)
            {
                _local_13.caption = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.thread_details", "", "thread_author_id", _arg_2.threadAuthorId, "thread_author_name", _arg_2.threadAuthorName, "last_author_id", _arg_2.lastMessageAuthorId, "last_author_name", _arg_2.lastMessageAuthorName, "creation_time", _SafeStr_3761.getAsDaysHoursMinutes(_arg_2.creationTimeAsSecondsAgo), "update_time", _SafeStr_3761.getAsDaysHoursMinutes(_arg_2.lastMessageTimeAsSecondsAgo));
            };
            _local_13 = _local_7.findChildByName("unread_texts_container");
            if (_local_13 != null)
            {
                _local_13.id = _arg_2.threadId;
                _local_13.color = getThreadColor(_local_11, _arg_3);
            };
            _local_13 = _local_7.findChildByName("unread_region");
            if (_local_13 != null)
            {
                _local_13.id = _arg_2.threadId;
                _local_13.removeEventListener("WME_CLICK", onGoToFirstUnread);
                _local_13.addEventListener("WME_CLICK", onGoToFirstUnread);
            };
            _local_12 = (_local_7.findChildByName("messages1") as ITextWindow);
            if (_local_12 != null)
            {
                _local_12.bold = (_local_5 > 0);
                _local_12.text = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.thread_details1", "", "total_messages", _arg_2.nMessages, "new_messages", _local_5);
            };
            _local_12 = (_local_7.findChildByName("messages2") as ITextWindow);
            if (_local_12 != null)
            {
                _local_12.bold = (_local_5 > 0);
                _local_12.text = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.thread_details2", "", "total_messages", _arg_2.nMessages, "new_messages", _local_5);
            };
            _local_13 = _local_7.findChildByName("button_container");
            if (_local_13 != null)
            {
                _local_13.id = _arg_2.threadId;
                _local_13.color = getThreadColor(_local_11, _arg_3);
                handleButtonVisibility((_local_13 as _SafeStr_3133), _arg_2, _local_11);
                _local_13.color = getThreadColor(_local_11, _arg_3);
            };
            _local_13 = _local_7.findChildByName("left_button_container");
            if (_local_13 != null)
            {
                _local_13.id = _arg_2.threadId;
                _local_13.color = getThreadColor(_local_11, _arg_3);
                handleLeftButtonsVisibility((_local_13 as _SafeStr_3133), _arg_2, _local_9, _local_6);
                _local_13.color = getThreadColor(_local_11, _arg_3);
            };
        }

        public function updateItemWidths():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < _SafeStr_4162.numListItems)
            {
                _SafeStr_4162.getListItemAt(_local_1).width = (_SafeStr_4162.scrollableWindow.width - 2);
                _local_1++;
            };
        }

        private function handleButtonVisibility(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1633, _arg_3:int):void
        {
            var _local_9:* = null;
            var _local_7:* = null;
            var _local_6:Boolean = _SafeStr_5321.canModerate;
            var _local_5:Boolean = _SafeStr_5321.isStaff;
            var _local_4:Boolean = _SafeStr_5321.canReport;
            var _local_8:IItemListWindow = (_arg_1.findChildByName("mod_buttons") as IItemListWindow);
            _local_9 = (_local_8.getListItemAt(0) as IRegionWindow);
            if (_local_9 != null)
            {
                _local_9.removeEventListener("WME_CLICK", onDelete);
                _local_9.removeEventListener("WME_CLICK", onUndelete);
                if (((_local_6) || (_local_5)))
                {
                    _local_9.id = _arg_2.threadId;
                    _local_7 = (_local_9.getChildByName("icon") as IStaticBitmapWrapperWindow);
                    switch (_arg_3)
                    {
                        case 0:
                        case 1:
                            _local_9.addEventListener("WME_CLICK", onDelete);
                            _local_7.assetUri = "forum_forum_hide";
                            break;
                        case 10:
                            _local_9.addEventListener("WME_CLICK", onUndelete);
                            _local_7.assetUri = "forum_forum_unhide";
                            break;
                        case 20:
                            if (_local_5)
                            {
                                _local_9.addEventListener("WME_CLICK", onUndelete);
                                _local_7.assetUri = "forum_forum_unhide";
                            }
                            else
                            {
                                _local_9.visible = false;
                            };
                    };
                }
                else
                {
                    _local_9.visible = false;
                };
            };
            _local_9 = (_local_8.getListItemAt(1) as IRegionWindow);
            if (_local_9 != null)
            {
                _local_9.removeEventListener("WME_CLICK", onReport);
                if ((((_local_6) || (_local_5)) || (_local_4)))
                {
                    _local_9.id = _arg_2.threadId;
                    _local_9.addEventListener("WME_CLICK", onReport);
                }
                else
                {
                    _local_9.visible = false;
                };
            };
        }

        private function handleLeftButtonsVisibility(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1633, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_8:* = null;
            var _local_6:* = null;
            var _local_10:Boolean = _SafeStr_5321.canModerate;
            var _local_9:Boolean = _SafeStr_5321.isStaff;
            var _local_11:IItemListWindow = (_arg_1.findChildByName("info_buttons") as IItemListWindow);
            var _local_7:IRegionWindow = (_local_11.getListItemByName("thread_lock") as IRegionWindow);
            if (_local_7 != null)
            {
                _local_7.removeEventListener("WME_CLICK", onToggleLock);
                _local_8 = (_local_7.getChildByName("icon") as IStaticBitmapWrapperWindow);
                if (((_local_10) || (_local_9)))
                {
                    _local_7.id = _arg_2.threadId;
                    _local_7.addEventListener("WME_CLICK", onToggleLock);
                    if (_arg_3)
                    {
                        _local_8.assetUri = "forum_forum_locked";
                    }
                    else
                    {
                        _local_8.assetUri = "forum_forum_unlocked";
                    };
                    _local_7.visible = true;
                }
                else
                {
                    if (_arg_3)
                    {
                        _local_8.assetUri = "forum_forum_locked";
                    };
                    _local_7.visible = _arg_3;
                    _local_7.disable();
                };
            };
            var _local_5:IRegionWindow = (_local_11.getListItemByName("thread_pin") as IRegionWindow);
            if (_local_5 != null)
            {
                _local_5.removeEventListener("WME_CLICK", onToggleSticky);
                _local_6 = (_local_5.getChildByName("icon") as IStaticBitmapWrapperWindow);
                if (((_local_10) || (_local_9)))
                {
                    _local_5.id = _arg_2.threadId;
                    _local_5.addEventListener("WME_CLICK", onToggleSticky);
                    if (_arg_4)
                    {
                        _local_6.assetUri = "forum_forum_pinned";
                    }
                    else
                    {
                        _local_6.assetUri = "forum_forum_unpinned";
                    };
                    _local_5.visible = true;
                }
                else
                {
                    if (_arg_4)
                    {
                        _local_6.assetUri = "forum_forum_pinned";
                    };
                    _local_5.visible = _arg_4;
                    _local_5.disable();
                };
            };
        }

        private function getModerationMessage(_arg_1:_SafeStr_1633):String
        {
            var _local_2:* = null;
            switch (_arg_1.state)
            {
                case 0:
                    break;
                case 1:
                    break;
                case 10:
                    _local_2 = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.thread_hidden_by_admin", "", "admin_name", _arg_1.adminName);
                    break;
                case 20:
                    _local_2 = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.thread_hidden_by_staff", "", "admin_name", _arg_1.adminName);
            };
            return (_local_2);
        }

        public function updateElement(_arg_1:_SafeStr_1633):void
        {
            var _local_3:int = _arg_1.threadId;
            var _local_2:_SafeStr_3133 = (_SafeStr_4162.getListItemByName(("thread_" + _local_3)) as _SafeStr_3133);
            var _local_4:int = _SafeStr_4162.getListItemIndex(_local_2);
            if (_local_2 != null)
            {
                updateListItem(_local_2, _arg_1, _local_4);
            };
        }

        private function onToggleLock(_arg_1:WindowMouseEvent):void
        {
            var _local_2:int = _arg_1.target.id;
            var _local_3:_SafeStr_1633 = _SafeStr_5326.threadsById[_local_2];
            if (_local_3 == null)
            {
                return;
            };
            _SafeStr_4360.lockThread(_SafeStr_5321, _local_2, (!(_local_3.isLocked)), _local_3.isSticky);
        }

        private function onToggleSticky(_arg_1:WindowMouseEvent):void
        {
            var _local_2:int = _arg_1.target.id;
            var _local_3:_SafeStr_1633 = _SafeStr_5326.threadsById[_local_2];
            if (_local_3 == null)
            {
                return;
            };
            _SafeStr_4360.stickThread(_SafeStr_5321, _local_2, _local_3.isLocked, (!(_local_3.isSticky)));
        }

        private function onReport(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.reportThread(_SafeStr_5321, _arg_1.target.id);
        }

        private function onDelete(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.deleteThread(_SafeStr_5321, _arg_1.target.id);
        }

        private function onUndelete(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.unDeleteThread(_SafeStr_5321, _arg_1.target.id);
        }

        private function onGoToFirstUnread(_arg_1:WindowMouseEvent):void
        {
            var _local_3:int;
            var _local_2:int = _arg_1.target.id;
            var _local_4:_SafeStr_1633 = _SafeStr_5326.threadsById[_local_2];
            if (_local_4)
            {
                _local_3 = Math.min((_SafeStr_4360.getThreadLastReadMessageIndex(_local_2) + 1), (_local_4.nMessages - 1));
                _SafeStr_4360.goToMessageIndex(_SafeStr_5321.groupId, _local_2, _local_3);
            };
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1633 = "_-XN" (String#3408, DoABC#4)
// _SafeStr_1645 = "_-oc" (String#5516, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5321 = "_-p1M" (String#856, DoABC#4)
// _SafeStr_5326 = "_-E5" (String#2507, DoABC#4)
// _SafeStr_6579 = "_-e1j" (String#4516, DoABC#4)


