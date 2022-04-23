// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.groupforums.GroupForumView

package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.window.components.ITextWindow;
    import _-Wi._SafeStr_1645;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import _-Wi._SafeStr_1644;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import _-Wi._SafeStr_1633;
    import _-Wi._SafeStr_1560;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.core.window.events._SafeStr_3116;

    public class GroupForumView 
    {

        private static const _SafeStr_8550:int = 100;

        private var _SafeStr_4360:GroupForumController;
        private var _SafeStr_5737:ForumsListView;
        private var _SafeStr_5735:ThreadListView;
        private var _SafeStr_5736:MessageListView;
        private var _window:_SafeStr_3263;
        private var _SafeStr_5743:IScrollableListWindow;
        private var _SafeStr_5740:_SafeStr_3109;
        private var _SafeStr_5741:_SafeStr_3109;
        private var _SafeStr_5739:_SafeStr_3109;
        private var _SafeStr_5742:_SafeStr_3109;
        private var _txtElement:_SafeStr_3109;
        private var _backButton:_SafeStr_3240;
        private var _postButton:_SafeStr_3240;
        private var _SafeStr_5744:_SafeStr_3109;
        private var _SafeStr_5745:_SafeStr_3109;
        private var _SafeStr_5747:ITextWindow;
        private var _SafeStr_5324:ForumsListData;
        private var _SafeStr_5321:_SafeStr_1645;
        private var _SafeStr_5326:ThreadsListData;
        private var _SafeStr_5328:MessagesListData;
        private var _SafeStr_4780:int = 1;
        private var _SafeStr_5738:int = 1;
        private var _SafeStr_5746:int;

        public function GroupForumView(_arg_1:GroupForumController)
        {
            _SafeStr_4360 = _arg_1;
            _SafeStr_5746 = 20;
        }

        private static function enable(_arg_1:_SafeStr_3109, _arg_2:Boolean):void
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

        internal static function initTopAreaForForum(_arg_1:_SafeStr_3263, _arg_2:_SafeStr_1644):IRegionWindow
        {
            var _local_4:_SafeStr_3133 = (_arg_1.findChildByName("top_part") as _SafeStr_3133);
            var _local_6:_SafeStr_3199 = _SafeStr_3199(_local_4.findChildByName("group_icon"));
            _local_6.visible = true;
            var _local_3:_SafeStr_3349 = (_local_6.widget as _SafeStr_3349);
            _local_3.badgeId = _arg_2.icon;
            _local_3.groupId = _arg_2.groupId;
            _local_3.type = "group";
            var _local_8:IStaticBitmapWrapperWindow = (_local_4.findChildByName("header_icon") as IStaticBitmapWrapperWindow);
            if (_local_8 != null)
            {
                _local_8.visible = false;
            };
            var _local_7:ITextWindow = (_local_4.findChildByName("top_header_text") as ITextWindow);
            _local_7.text = _arg_2.name;
            var _local_5:ITextWindow = (_local_4.findChildByName("top_text") as ITextWindow);
            _local_5.text = _arg_2.description;
            return (_local_4.findChildByName("top_click_area") as IRegionWindow);
        }


        public function dispose():void
        {
            if (_SafeStr_4360)
            {
                _SafeStr_4360.closeMainView();
            };
            if (_window != null)
            {
                _window.removeEventListener("click", onClickButton);
                _window.dispose();
                _window = null;
                _SafeStr_4360 = null;
            };
        }

        private function initCommonControls():void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName("settings_button");
            if (((!(_SafeStr_5321 == null)) && (_SafeStr_5321.canChangeSettings)))
            {
                _local_2.removeEventListener("WME_CLICK", onSettingsButtonClick);
                _local_2.addEventListener("WME_CLICK", onSettingsButtonClick);
                _local_2.visible = true;
            }
            else
            {
                _local_2.visible = false;
            };
            var _local_1:ILabelWindow = (_backButton.findChildByName("back_button_label") as ILabelWindow);
            if (_SafeStr_5735 != null)
            {
                _backButton.visible = true;
                _local_1.text = _SafeStr_4360.localizationManager.getLocalization("groupforum.view.mark_read");
            }
            else
            {
                if (_SafeStr_5736 != null)
                {
                    _backButton.visible = true;
                    _local_1.text = _SafeStr_4360.localizationManager.getLocalization("groupforum.view.back");
                }
                else
                {
                    if (_SafeStr_5737 != null)
                    {
                        _backButton.visible = true;
                        _local_1.text = _SafeStr_4360.localizationManager.getLocalization("groupforum.view.mark_read");
                    }
                    else
                    {
                        _backButton.visible = false;
                    };
                };
            };
            var _local_3:ILabelWindow = (_postButton.findChildByName("post_button_label") as ILabelWindow);
            if (_SafeStr_5735 != null)
            {
                _postButton.visible = true;
                _local_3.text = _SafeStr_4360.localizationManager.getLocalization("groupforum.view.start_thread");
            }
            else
            {
                if (_SafeStr_5736 != null)
                {
                    _postButton.visible = true;
                    _local_3.text = _SafeStr_4360.localizationManager.getLocalization("groupforum.view.reply");
                }
                else
                {
                    _postButton.visible = false;
                };
            };
            var _local_4:int = (_SafeStr_4780 + 1);
            _txtElement.caption = ((_local_4 + " / ") + _SafeStr_5738);
            _window.scaler.enable();
            _window.scaler.visible = true;
            enable(_SafeStr_5739, (_SafeStr_4780 > 0));
            enable(_SafeStr_5740, (_SafeStr_4780 > 0));
            enable(_SafeStr_5741, (_SafeStr_4780 < (_SafeStr_5738 - 1)));
            enable(_SafeStr_5742, (_SafeStr_4780 < (_SafeStr_5738 - 1)));
            updateUnreadForumsCount(_SafeStr_4360.unreadForumsCount);
        }

        private function resetWindow():void
        {
            if (_window != null)
            {
                _SafeStr_5743.destroyListItems();
                _SafeStr_5737 = null;
                _SafeStr_5735 = null;
                _SafeStr_5736 = null;
            }
            else
            {
                _window = (_SafeStr_4360.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_main_view_xml())) as _SafeStr_3263);
                _SafeStr_5743 = (_window.findChildByName("scrollable_message_list") as IScrollableListWindow);
                _SafeStr_5743.scrollableWindow.addEventListener("WE_RESIZED", onResized, 100);
                _window.center();
                _window.y = 100;
                _txtElement = _window.findChildByName("page_info");
                _SafeStr_5740 = _window.findChildByName("show_previous");
                _SafeStr_5740.addEventListener("WME_CLICK", onClickButton);
                _SafeStr_5741 = _window.findChildByName("show_next");
                _SafeStr_5741.addEventListener("WME_CLICK", onClickButton);
                _SafeStr_5742 = _window.findChildByName("show_last");
                _SafeStr_5742.addEventListener("WME_CLICK", onClickButton);
                _SafeStr_5739 = _window.findChildByName("show_first");
                _SafeStr_5739.addEventListener("WME_CLICK", onClickButton);
                _backButton = _SafeStr_3240(_window.findChildByName("back_button"));
                _backButton.addEventListener("WME_CLICK", onClickButton);
                _postButton = _SafeStr_3240(_window.findChildByName("post_button"));
                _postButton.addEventListener("WME_CLICK", onClickButton);
                _SafeStr_5744 = _window.findChildByTag("close");
                _SafeStr_5744.addEventListener("WME_CLICK", onClickButton);
                _SafeStr_5745 = _window.findChildByName("list_header");
                _SafeStr_5747 = ITextWindow(IItemListWindow(_window.findChildByName("shortcuts")).getListItemByName("my"));
            };
        }

        private function setStatusTextError(_arg_1:String, _arg_2:String):void
        {
            var _local_3:ITextWindow = ITextWindow(_window.findChildByName("status"));
            if (((_arg_2 == null) || (_arg_2.length == 0)))
            {
                _local_3.caption = "";
            }
            else
            {
                _arg_1 = _SafeStr_4360.localizationManager.getLocalization(("groupforum.view.error.operation_" + _arg_1));
                _local_3.text = _SafeStr_4360.localizationManager.getLocalizationWithParams(("groupforum.view.error." + _arg_2), "", "operation", _arg_1);
            };
        }

        private function onSettingsButtonClick(_arg_1:WindowMouseEvent):void
        {
            openForumSettingsView();
        }

        private function onTopAreaClick(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_5321 != null)
            {
                _SafeStr_4360.context.createLinkEvent(("group/" + _SafeStr_5321.groupId));
            };
        }

        public function openForumsList(_arg_1:ForumsListData):void
        {
            resetWindow();
            _SafeStr_5324 = _arg_1;
            _SafeStr_5321 = null;
            _SafeStr_5326 = null;
            _SafeStr_5328 = null;
            _SafeStr_5738 = calculateNumOfPagesAvailable(_SafeStr_5324.totalAmount);
            _SafeStr_4780 = Math.ceil((_SafeStr_5324.startIndex / 20));
            _SafeStr_5737 = new ForumsListView(this, _SafeStr_5743, _SafeStr_5324.forums);
            _SafeStr_5737.update();
            _SafeStr_5745.caption = _SafeStr_4360.localizationManager.getLocalization(("groupforum.view.forums_list." + _SafeStr_5324.listCode));
            var _local_3:_SafeStr_3133 = (_window.findChildByName("top_part") as _SafeStr_3133);
            var _local_6:_SafeStr_3199 = _SafeStr_3199(_local_3.findChildByName("group_icon"));
            _local_6.visible = false;
            var _local_8:IStaticBitmapWrapperWindow = (_local_3.findChildByName("header_icon") as IStaticBitmapWrapperWindow);
            _local_8.visible = true;
            _local_8.assetUri = ("forum_forum_list" + _SafeStr_5324.listCode);
            var _local_7:ITextWindow = (_local_3.findChildByName("top_header_text") as ITextWindow);
            _local_7.text = _SafeStr_4360.localizationManager.getLocalization(("groupforum.view.forums_header." + _SafeStr_5324.listCode));
            var _local_4:ITextWindow = (_local_3.findChildByName("top_text") as ITextWindow);
            _local_4.text = _SafeStr_4360.localizationManager.getLocalization(("groupforum.view.forums_description." + _SafeStr_5324.listCode));
            var _local_2:IRegionWindow = (_local_3.findChildByName("top_click_area") as IRegionWindow);
            _local_2.removeEventListener("WME_CLICK", onTopAreaClick);
            _local_2.disable();
            initCommonControls();
            var _local_5:ITextWindow = ITextWindow(_window.findChildByName("status"));
            _local_5.text = _SafeStr_4360.localizationManager.getLocalization("groupforum.view.forums_list.status");
        }

        public function get isForumsListOpened():Boolean
        {
            return (!(_SafeStr_5737 == null));
        }

        public function openThreadList(_arg_1:ForumsListData, _arg_2:_SafeStr_1645, _arg_3:ThreadsListData):void
        {
            resetWindow();
            _SafeStr_5324 = _arg_1;
            _SafeStr_5321 = _arg_2;
            _SafeStr_5326 = _arg_3;
            _SafeStr_5328 = null;
            _SafeStr_5738 = calculateNumOfPagesAvailable(_SafeStr_5326.totalThreads);
            _SafeStr_4780 = Math.ceil((_SafeStr_5326.startIndex / 20));
            _SafeStr_5735 = new ThreadListView(this, _SafeStr_5743, _SafeStr_5321, _SafeStr_5326);
            _SafeStr_5735.update();
            _SafeStr_5745.caption = _SafeStr_4360.localizationManager.getLocalization("groupforum.view.all_threads");
            if (_SafeStr_5321.canPostThread)
            {
                _postButton.enable();
                setStatusTextError("post_thread", null);
            }
            else
            {
                _postButton.disable();
                setStatusTextError("post_thread", _SafeStr_5321.postThreadPermissionError);
            };
            var _local_4:IRegionWindow = GroupForumView.initTopAreaForForum(_window, _SafeStr_5321);
            _local_4.removeEventListener("WME_CLICK", onTopAreaClick);
            _local_4.addEventListener("WME_CLICK", onTopAreaClick);
            _local_4.enable();
            initCommonControls();
        }

        public function updateThread(_arg_1:_SafeStr_1633):void
        {
            if (_SafeStr_5735 != null)
            {
                _SafeStr_5735.updateElement(_arg_1);
            };
        }

        public function updateMessage(_arg_1:_SafeStr_1560):void
        {
            if (_SafeStr_5736 != null)
            {
                _SafeStr_5736.updateElement(_arg_1);
            };
        }

        public function openMessagesList(_arg_1:ForumsListData, _arg_2:_SafeStr_1645, _arg_3:ThreadsListData, _arg_4:MessagesListData):void
        {
            resetWindow();
            _SafeStr_5324 = _arg_1;
            _SafeStr_5321 = _arg_2;
            _SafeStr_5326 = _arg_3;
            _SafeStr_5328 = _arg_4;
            var _local_7:int = _arg_4.threadId;
            var _local_5:_SafeStr_1633 = _SafeStr_5326.threadsById[_local_7];
            _SafeStr_5738 = calculateNumOfPagesAvailable(_arg_4.totalMessages);
            var _local_8:int = _arg_4.startIndex;
            _SafeStr_4780 = Math.ceil((_local_8 / 20));
            _SafeStr_5745.caption = _local_5.header;
            _SafeStr_5736 = new MessageListView(this, _SafeStr_5743, _SafeStr_5321, _local_5, _arg_4);
            _SafeStr_5736.update();
            if (((_SafeStr_4360.getGoToMessageIndex() > 0) && (_SafeStr_4360.getGoToThreadId() == _local_7)))
            {
                _SafeStr_5736.scrollToSpecificElement(_SafeStr_4360.getGoToMessageIndex(), true);
                _SafeStr_4360.resetGoTo();
            };
            if (_SafeStr_5321.canPostMessage)
            {
                if (((_SafeStr_5321.canModerate) || (!(_local_5.isLocked))))
                {
                    _postButton.enable();
                    setStatusTextError("post_message", null);
                }
                else
                {
                    _postButton.disable();
                    setStatusTextError("post_in_locked", _SafeStr_5321.moderatePermissionError);
                };
            }
            else
            {
                _postButton.disable();
                setStatusTextError("post_message", _SafeStr_5321.postMessagePermissionError);
            };
            var _local_6:IRegionWindow = GroupForumView.initTopAreaForForum(_window, _SafeStr_5321);
            _local_6.removeEventListener("WME_CLICK", onTopAreaClick);
            _local_6.addEventListener("WME_CLICK", onTopAreaClick);
            _local_6.enable();
            initCommonControls();
        }

        public function get controller():GroupForumController
        {
            return (_SafeStr_4360);
        }

        private function calculateNumOfPagesAvailable(_arg_1:int):int
        {
            return (Math.ceil((_arg_1 / _SafeStr_5746)));
        }

        private function getPreviousPageData():void
        {
            var _local_1:int = (_SafeStr_4780 - 1);
            if (_local_1 >= 0)
            {
                requestNewPageData(_local_1);
            };
        }

        private function getNextPageData():void
        {
            var _local_1:int = (_SafeStr_4780 + 1);
            if (_local_1 <= _SafeStr_5738)
            {
                requestNewPageData(_local_1);
            };
        }

        private function getFirstPageData():void
        {
            if (_SafeStr_4780 == 0)
            {
                return;
            };
            requestNewPageData(0);
        }

        private function getLastPageData():void
        {
            if (_SafeStr_4780 >= _SafeStr_5738)
            {
                return;
            };
            requestNewPageData((_SafeStr_5738 - 1));
        }

        private function requestNewPageData(_arg_1:int):void
        {
            var _local_2:int = (_arg_1 * _SafeStr_5746);
            if (_SafeStr_5737 != null)
            {
                _SafeStr_4360.openForumsList(_SafeStr_5324.listCode, _local_2);
            }
            else
            {
                if (_SafeStr_5735 != null)
                {
                    _SafeStr_4360.requestThreadList(_SafeStr_5321.groupId, _local_2);
                }
                else
                {
                    if (_SafeStr_5736 != null)
                    {
                        _SafeStr_4360.requestThreadMessageList(_SafeStr_5321.groupId, _SafeStr_5328.threadId, _local_2);
                    };
                };
            };
            _SafeStr_4780 = _arg_1;
        }

        public function getAsDaysHoursMinutes(_arg_1:int):String
        {
            return (FriendlyTime.getFriendlyTime(_SafeStr_4360.localizationManager, _arg_1, ".ago", 1));
        }

        private function onResized(_arg_1:_SafeStr_3116=null):void
        {
            if (_SafeStr_5737 != null)
            {
                _SafeStr_5737.updateItemWidths();
            };
            if (_SafeStr_5735 != null)
            {
                _SafeStr_5735.updateItemWidths();
            };
            if (_SafeStr_5736 != null)
            {
                _SafeStr_5736.updateItemSizes();
            };
        }

        private function onClickButton(_arg_1:WindowMouseEvent):void
        {
            switch (_arg_1.target.name)
            {
                case "back_button":
                    if (_SafeStr_5736 != null)
                    {
                        _SafeStr_4360.requestThreadList(_SafeStr_5321.groupId, _SafeStr_5326.startIndex);
                    }
                    else
                    {
                        if (_SafeStr_5735 != null)
                        {
                            _SafeStr_4360.markForumAsRead(true);
                            if (_SafeStr_5324 != null)
                            {
                                _SafeStr_4360.openForumsList(_SafeStr_5324.listCode, _SafeStr_5324.startIndex);
                            }
                            else
                            {
                                dispose();
                            };
                        }
                        else
                        {
                            if (_SafeStr_5737 != null)
                            {
                                _SafeStr_4360.markForumsAsRead();
                                dispose();
                            };
                        };
                    };
                    return;
                case "show_previous":
                    getPreviousPageData();
                    return;
                case "show_next":
                    getNextPageData();
                    return;
                case "show_last":
                    getLastPageData();
                    return;
                case "show_first":
                    getFirstPageData();
                    return;
                case "header_button_close":
                    _window.visible = false;
                    dispose();
                    return;
                case "post_button":
                    openComposeMessageView(((_SafeStr_5328 != null) ? _SafeStr_5326.threadsById[_SafeStr_5328.threadId] : null));
                    return;
            };
        }

        public function openComposeMessageView(_arg_1:_SafeStr_1633, _arg_2:_SafeStr_1560=null):void
        {
            if (_SafeStr_4360.composeMessageView != null)
            {
                _SafeStr_4360.composeMessageView.focus(_SafeStr_5321, _arg_1, _arg_2);
            }
            else
            {
                _SafeStr_4360.composeMessageView = new ComposeMessageView(this, (_window.x + _window.width), _window.y, _SafeStr_5321, _arg_1, _arg_2);
            };
        }

        public function openForumSettingsView():void
        {
            if (_SafeStr_4360.forumSettingsView != null)
            {
                _SafeStr_4360.forumSettingsView.focus(_SafeStr_5321);
            }
            else
            {
                _SafeStr_4360.forumSettingsView = new ForumSettingsView(this, (_window.x + _window.width), _window.y, _SafeStr_5321);
            };
        }

        public function updateUnreadForumsCount(_arg_1:int):void
        {
            if (_arg_1 > 0)
            {
                _SafeStr_5747.htmlText = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.shortcuts.my.unread", "", "unread_count", _arg_1);
            }
            else
            {
                _SafeStr_5747.htmlText = _SafeStr_4360.localizationManager.getLocalization("groupforum.view.shortcuts.my", "");
            };
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1560 = "_-x4" (String#4460, DoABC#4)
// _SafeStr_1633 = "_-XN" (String#3408, DoABC#4)
// _SafeStr_1644 = "_-mW" (String#4106, DoABC#4)
// _SafeStr_1645 = "_-oc" (String#5516, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4780 = "_-fK" (String#917, DoABC#4)
// _SafeStr_5321 = "_-p1M" (String#856, DoABC#4)
// _SafeStr_5324 = "_-k18" (String#2523, DoABC#4)
// _SafeStr_5326 = "_-E5" (String#2507, DoABC#4)
// _SafeStr_5328 = "_-u4" (String#3671, DoABC#4)
// _SafeStr_5735 = "_-E1R" (String#5347, DoABC#4)
// _SafeStr_5736 = "_-oD" (String#5175, DoABC#4)
// _SafeStr_5737 = "_-sD" (String#5954, DoABC#4)
// _SafeStr_5738 = "_-b1t" (String#5788, DoABC#4)
// _SafeStr_5739 = "_-Qo" (String#15011, DoABC#4)
// _SafeStr_5740 = "_-AI" (String#15543, DoABC#4)
// _SafeStr_5741 = "_-pf" (String#14891, DoABC#4)
// _SafeStr_5742 = "_-pJ" (String#15645, DoABC#4)
// _SafeStr_5743 = "_-BJ" (String#9302, DoABC#4)
// _SafeStr_5744 = "_-21M" (String#20332, DoABC#4)
// _SafeStr_5745 = "_-PS" (String#13322, DoABC#4)
// _SafeStr_5746 = "_-T1m" (String#14655, DoABC#4)
// _SafeStr_5747 = "_-G1H" (String#14264, DoABC#4)
// _SafeStr_8550 = "_-4Q" (String#38465, DoABC#4)


