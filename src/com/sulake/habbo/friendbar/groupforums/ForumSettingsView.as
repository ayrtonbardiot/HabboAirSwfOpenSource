// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.groupforums.ForumSettingsView

package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.ISelectorWindow;
    import _-Wi._SafeStr_1645;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class ForumSettingsView 
    {

        private static const _SafeStr_8548:Number = 0.5;

        private var _SafeStr_4360:GroupForumController;
        private var _SafeStr_3761:GroupForumView;
        private var _window:_SafeStr_3263;
        private var _SafeStr_6014:ISelectorWindow;
        private var _SafeStr_6015:ISelectorWindow;
        private var _SafeStr_6016:ISelectorWindow;
        private var _SafeStr_6017:ISelectorWindow;
        private var _SafeStr_5321:_SafeStr_1645;
        private var _SafeStr_6018:int;
        private var _SafeStr_6019:int;
        private var _SafeStr_6020:int;
        private var _SafeStr_6021:int;

        public function ForumSettingsView(_arg_1:GroupForumView, _arg_2:int, _arg_3:int, _arg_4:_SafeStr_1645)
        {
            _SafeStr_3761 = _arg_1;
            _SafeStr_4360 = _SafeStr_3761.controller;
            _SafeStr_5321 = _arg_4;
            _window = _SafeStr_3263(_SafeStr_4360.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_forum_settings_xml())));
            _window.x = _arg_2;
            var _local_5:int = _SafeStr_4360.windowManager.getDesktop(1).width;
            if ((_window.x + _window.width) > _local_5)
            {
                _window.x = (_local_5 - _window.width);
            };
            _window.y = _arg_3;
            initControls();
        }

        private static function setSelectorState(_arg_1:ISelectorWindow, _arg_2:int, _arg_3:int):int
        {
            var _local_5:int;
            var _local_6:* = null;
            var _local_4:* = null;
            if (_arg_3 < _arg_2)
            {
                _arg_3 = _arg_2;
            };
            _local_5 = 0;
            while (_local_5 < _arg_2)
            {
                _local_6 = _arg_1.getSelectableByName(String(_local_5));
                if (_local_6 != null)
                {
                    _local_6.disable();
                    _local_6.blend = 0.5;
                    _local_4 = _SafeStr_3133(_arg_1.parent).findChildByName(("label" + _local_5));
                    if (_local_4 != null)
                    {
                        _local_4.blend = 0.5;
                    };
                };
                _local_5++;
            };
            _local_5 = _arg_2;
            while (_local_5 < 4)
            {
                _local_6 = _arg_1.getSelectableByName(String(_local_5));
                if (_local_6 != null)
                {
                    _local_6.enable();
                    _local_6.blend = 1;
                    _local_4 = _SafeStr_3133(_arg_1.parent).findChildByName(("label" + _local_5));
                    if (_local_4 != null)
                    {
                        _local_4.blend = 1;
                    };
                    if (_local_5 == _arg_3)
                    {
                        _arg_1.setSelected(_local_6);
                    };
                };
                _local_5++;
            };
            return (_arg_3);
        }

        private static function getSelectorState(_arg_1:ISelectorWindow):int
        {
            var _local_2:ISelectableWindow = _arg_1.getSelected();
            if (_local_2 == null)
            {
                return (0);
            };
            return (_local_2.name);
        }


        public function focus(_arg_1:_SafeStr_1645):void
        {
            if (_SafeStr_5321 != _arg_1)
            {
                _SafeStr_5321 = _arg_1;
                initControls();
            };
            _window.activate();
        }

        private function initControls():void
        {
            var _local_2:IRegionWindow = GroupForumView.initTopAreaForForum(_window, _SafeStr_5321);
            _local_2.removeEventListener("WME_CLICK", onTopAreaClick);
            _local_2.addEventListener("WME_CLICK", onTopAreaClick);
            var _local_1:_SafeStr_3109 = _window.findChildByName("cancel_btn");
            _local_1.removeEventListener("WME_CLICK", onCancelButtonClick);
            _local_1.addEventListener("WME_CLICK", onCancelButtonClick);
            var _local_3:_SafeStr_3109 = _window.findChildByName("header_button_close");
            _local_3.removeEventListener("WME_CLICK", onCancelButtonClick);
            _local_3.addEventListener("WME_CLICK", onCancelButtonClick);
            var _local_4:_SafeStr_3109 = _window.findChildByName("ok_btn");
            _local_4.removeEventListener("WME_CLICK", onPostButtonClick);
            _local_4.addEventListener("WME_CLICK", onPostButtonClick);
            _SafeStr_6014 = ISelectorWindow(_window.findChildByName("read_selector"));
            _SafeStr_6014.addEventListener("WME_OVER", onReadSelectorHover);
            addSelectorListeners(_SafeStr_6014);
            _SafeStr_6015 = ISelectorWindow(_window.findChildByName("post_message_selector"));
            _SafeStr_6015.addEventListener("WME_OVER", onPostMessageSelectorHover);
            addSelectorListeners(_SafeStr_6015);
            _SafeStr_6016 = ISelectorWindow(_window.findChildByName("post_thread_selector"));
            _SafeStr_6016.addEventListener("WME_OVER", onPostThreadSelectorHover);
            addSelectorListeners(_SafeStr_6016);
            _SafeStr_6017 = ISelectorWindow(_window.findChildByName("moderate_selector"));
            _SafeStr_6017.addEventListener("WME_OVER", onModerateSelectorHover);
            addSelectorListeners(_SafeStr_6017);
            _SafeStr_6018 = setSelectorState(_SafeStr_6014, 0, _SafeStr_5321.readPermissions);
            _SafeStr_6019 = setSelectorState(_SafeStr_6015, _SafeStr_6018, _SafeStr_5321.postMessagePermissions);
            _SafeStr_6020 = setSelectorState(_SafeStr_6016, _SafeStr_6019, _SafeStr_5321.postThreadPermissions);
            _SafeStr_6021 = setSelectorState(_SafeStr_6017, 2, _SafeStr_5321.moderatePermissions);
        }

        public function dispose():void
        {
            _SafeStr_4360.forumSettingsView = null;
            _window.dispose();
            _window = null;
        }

        private function onTopAreaClick(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.context.createLinkEvent(("group/" + _SafeStr_5321.groupId));
        }

        private function onPostButtonClick(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.updateForumSettings(_SafeStr_5321.groupId, _SafeStr_6018, _SafeStr_6019, _SafeStr_6020, _SafeStr_6021);
            dispose();
        }

        private function onCancelButtonClick(_arg_1:WindowMouseEvent):void
        {
            dispose();
        }

        private function addSelectorListeners(_arg_1:ISelectorWindow):void
        {
            var _local_2:int;
            var _local_3:* = null;
            _local_2 = 0;
            while (_local_2 < _arg_1.numSelectables)
            {
                _local_3 = _arg_1.getSelectableAt(_local_2);
                _local_3.removeEventListener("WE_SELECTED", onSelectionChanged);
                _local_3.addEventListener("WE_SELECTED", onSelectionChanged);
                _local_2++;
            };
        }

        private function onSelectionChanged(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_6018 = getSelectorState(_SafeStr_6014);
            _SafeStr_6019 = setSelectorState(_SafeStr_6015, _SafeStr_6018, getSelectorState(_SafeStr_6015));
            _SafeStr_6020 = setSelectorState(_SafeStr_6016, _SafeStr_6019, getSelectorState(_SafeStr_6016));
            _SafeStr_6021 = getSelectorState(_SafeStr_6017);
        }

        private function onReadSelectorHover(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "forum.can.read.seen");
        }

        private function onPostMessageSelectorHover(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "forum.can.post.seen");
        }

        private function onPostThreadSelectorHover(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "forum.can.start.thread.seen");
        }

        private function onModerateSelectorHover(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "forum.can.moderate.seen");
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1645 = "_-oc" (String#5516, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5321 = "_-p1M" (String#856, DoABC#4)
// _SafeStr_6014 = "_-l1h" (String#10612, DoABC#4)
// _SafeStr_6015 = "_-HF" (String#9080, DoABC#4)
// _SafeStr_6016 = "_-S1" (String#10203, DoABC#4)
// _SafeStr_6017 = "_-yD" (String#10911, DoABC#4)
// _SafeStr_6018 = "_-mt" (String#9794, DoABC#4)
// _SafeStr_6019 = "_-b1J" (String#9575, DoABC#4)
// _SafeStr_6020 = "_-V1b" (String#13175, DoABC#4)
// _SafeStr_6021 = "_-i11" (String#11702, DoABC#4)
// _SafeStr_8548 = "_-QS" (String#39503, DoABC#4)


