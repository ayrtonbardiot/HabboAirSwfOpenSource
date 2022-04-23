// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.groupforums.ForumsListView

package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import _-Wi._SafeStr_1644;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class ForumsListView 
    {

        private var _SafeStr_4360:GroupForumController;
        private var _SafeStr_3761:GroupForumView;
        private var _SafeStr_4162:IScrollableListWindow;
        private var _SafeStr_6579:_SafeStr_3133;
        private var _forums:Array;

        public function ForumsListView(_arg_1:GroupForumView, _arg_2:IScrollableListWindow, _arg_3:Array)
        {
            _SafeStr_3761 = _arg_1;
            _SafeStr_4360 = _SafeStr_3761.controller;
            _SafeStr_4162 = _arg_2;
            _SafeStr_6579 = (_SafeStr_4360.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_forum_list_item_xml())) as _SafeStr_3133);
            _forums = _arg_3;
        }

        public function update():void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_1:* = null;
            _SafeStr_4162.invalidate();
            _local_3 = 0;
            while (_local_3 < _forums.length)
            {
                _local_1 = _forums[_local_3];
                _local_2 = (_SafeStr_6579.clone() as _SafeStr_3133);
                _local_2.name = ("forum_" + _local_1.groupId);
                updateListItem(_local_2, _local_1, _local_3);
                _SafeStr_4162.addListItem(_local_2);
                _local_3++;
            };
            updateItemWidths();
        }

        private function updateListItem(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1644, _arg_3:int):void
        {
            var _local_5:_SafeStr_3133 = (_arg_1 as _SafeStr_3133);
            _local_5.color = (((_arg_3 + 1) % 2) ? 4293852927 : 4289914618);
            var _local_6:int = _arg_2.unreadMessages;
            var _local_9:_SafeStr_3109 = _local_5.findChildByName("texts_container");
            _local_9.id = _arg_2.groupId;
            var _local_8:ITextWindow = (_local_5.findChildByName("header") as ITextWindow);
            _local_8.bold = (_local_6 > 0);
            _local_8.text = _arg_2.name;
            _local_9 = _local_5.findChildByName("header_region");
            _local_9.id = _arg_2.groupId;
            _local_9.removeEventListener("WME_CLICK", onOpenForum);
            _local_9.addEventListener("WME_CLICK", onOpenForum);
            _local_9 = _local_5.findChildByName("details");
            _local_9.caption = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.forum_details", "", "rating", _arg_2.leaderboardScore, "last_author_id", _arg_2.lastMessageAuthorId, "last_author_name", _arg_2.lastMessageAuthorName, "update_time", _SafeStr_3761.getAsDaysHoursMinutes(_arg_2.lastMessageTimeAsSecondsAgo));
            _local_9 = _local_5.findChildByName("unread_texts_container");
            _local_9.id = _arg_2.groupId;
            _local_9 = _local_5.findChildByName("unread_region");
            _local_9.id = _arg_2.groupId;
            _local_9.removeEventListener("WME_CLICK", onOpenForum);
            _local_9.addEventListener("WME_CLICK", onOpenForum);
            _local_8 = (_local_5.findChildByName("messages1") as ITextWindow);
            _local_8.bold = (_local_6 > 0);
            _local_8.text = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.thread_details1", "", "total_messages", _arg_2.totalMessages, "new_messages", _local_6);
            _local_8 = (_local_5.findChildByName("messages2") as ITextWindow);
            _local_8.bold = (_local_6 > 0);
            _local_8.text = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.view.thread_details2", "", "total_messages", _arg_2.totalMessages, "new_messages", _local_6);
            var _local_7:_SafeStr_3199 = _SafeStr_3199(_local_5.findChildByName("group_icon"));
            var _local_4:_SafeStr_3349 = (_local_7.widget as _SafeStr_3349);
            _local_4.badgeId = _arg_2.icon;
            _local_4.groupId = _arg_2.groupId;
            _local_4.type = "group";
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

        private function onOpenForum(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.openGroupForum(_arg_1.target.id);
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1644 = "_-mW" (String#4106, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_6579 = "_-e1j" (String#4516, DoABC#4)


