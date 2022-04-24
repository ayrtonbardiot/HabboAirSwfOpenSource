// by nota

//com.sulake.habbo.friendbar.groupforums.ComposeMessageView

package com.sulake.habbo.friendbar.groupforums
{
    import flash.utils.Timer;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3109;
    import _-Wi._SafeStr_1644;
    import _-Wi._SafeStr_1633;
    import _-Wi._SafeStr_1560;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.utils.getTimer;
    import com.sulake.habbo.utils.FriendlyTime;

    public class ComposeMessageView 
    {

        public static const SUBJECT_MIN_LENGTH:int = 10;
        public static const SUBJECT_MAX_LENGTH:int = 120;
        public static const MESSAGE_MIN_LENGTH:int = 10;
        public static const MESSAGE_MAX_LENGTH:int = 4000;
        public static const _SafeStr_8547:int = 30000;

        private var _SafeStr_4360:GroupForumController;
        private var _SafeStr_3761:GroupForumView;
        private var _SafeStr_4582:Timer;
        private var _window:_SafeStr_3263;
        private var _SafeStr_5805:ITextFieldWindow;
        private var _SafeStr_5806:ITextFieldWindow;
        private var _postButton:_SafeStr_3109;
        private var _status:_SafeStr_3109;
        private var _SafeStr_5321:_SafeStr_1644;
        private var _SafeStr_5804:_SafeStr_1633;
        private var _hasErrors:Boolean = false;
        private var _SafeStr_5803:Boolean = false;

        public function ComposeMessageView(_arg_1:GroupForumView, _arg_2:int, _arg_3:int, _arg_4:_SafeStr_1644, _arg_5:_SafeStr_1633, _arg_6:_SafeStr_1560)
        {
            _SafeStr_3761 = _arg_1;
            _SafeStr_4360 = _SafeStr_3761.controller;
            _SafeStr_5321 = _arg_4;
            _SafeStr_5804 = _arg_5;
            _window = _SafeStr_3263(_SafeStr_4360.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_compose_message_xml())));
            _window.x = _arg_2;
            var _local_7:int = _SafeStr_4360.windowManager.getDesktop(1).width;
            if ((_window.x + _window.width) > _local_7)
            {
                _window.x = (_local_7 - _window.width);
            };
            _window.y = _arg_3;
            initControls(_arg_6);
            if (_status.caption.length == 0)
            {
                _status.caption = _SafeStr_4360.localizationManager.getLocalization("groupforum.compose.reply_hint");
            };
            _SafeStr_4582 = new Timer(1000, 0);
            _SafeStr_4582.addEventListener("timer", onTimerEvent);
            _SafeStr_4582.start();
        }

        public function focus(_arg_1:_SafeStr_1644, _arg_2:_SafeStr_1633, _arg_3:_SafeStr_1560):void
        {
            if (!_SafeStr_5803)
            {
                _SafeStr_5321 = _arg_1;
                if (((!(_SafeStr_5804 == null)) && (_arg_2 == null)))
                {
                    _SafeStr_5805.text = "";
                };
                _SafeStr_5804 = _arg_2;
                initControls(_arg_3);
            };
            _window.activate();
        }

        private function initControls(_arg_1:_SafeStr_1560):void
        {
            var _local_3:IRegionWindow = GroupForumView.initTopAreaForForum(_window, _SafeStr_5321);
            _local_3.removeEventListener("WME_CLICK", onTopAreaClick);
            _local_3.addEventListener("WME_CLICK", onTopAreaClick);
            var _local_5:_SafeStr_3109 = _window.findChildByName("thread_subject_header");
            _SafeStr_5805 = (_window.findChildByName("thread_subject") as ITextFieldWindow);
            if (_SafeStr_5804)
            {
                _local_5.caption = _SafeStr_4360.localizationManager.getLocalization("groupforum.compose.subject_replying_to");
                _SafeStr_5805.text = _SafeStr_5804.header;
                _SafeStr_5805.disable();
            }
            else
            {
                _local_5.caption = _SafeStr_4360.localizationManager.getLocalization("groupforum.compose.subject");
                _SafeStr_5805.addEventListener("WKE_KEY_UP", onHeaderKeyUpEvent);
                _SafeStr_5805.maxChars = 120;
                _SafeStr_5805.enable();
            };
            _SafeStr_5806 = (_window.findChildByName("message_text") as ITextFieldWindow);
            _SafeStr_5806.removeEventListener("WKE_KEY_UP", onMessageKeyUpEvent);
            _SafeStr_5806.addEventListener("WKE_KEY_UP", onMessageKeyUpEvent);
            _SafeStr_5806.maxChars = 4000;
            if (_arg_1 != null)
            {
                addQuote(_arg_1);
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("cancel_btn");
            _local_2.removeEventListener("WME_CLICK", onCancelButtonClick);
            _local_2.addEventListener("WME_CLICK", onCancelButtonClick);
            var _local_4:_SafeStr_3109 = _window.findChildByName("header_button_close");
            _local_4.removeEventListener("WME_CLICK", onCancelButtonClick);
            _local_4.addEventListener("WME_CLICK", onCancelButtonClick);
            _postButton = _window.findChildByName("post_btn");
            _postButton.removeEventListener("WME_CLICK", onPostButtonClick);
            _postButton.addEventListener("WME_CLICK", onPostButtonClick);
            _status = _window.findChildByName("status_text");
            validateInputs();
        }

        private function addQuote(_arg_1:_SafeStr_1560):void
        {
            var _local_2:*;
            var _local_4:StringBuffer = new StringBuffer();
            _local_4.add(_SafeStr_5806.text);
            if (_local_4.length > 0)
            {
                _local_4.add("\r\r");
            };
            _local_4.add(_SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.compose.reply_template", "", "author_name", _arg_1.authorName, "creation_time", _SafeStr_3761.getAsDaysHoursMinutes(_arg_1.creationTimeAsSecondsAgo)));
            _local_4.add("\r");
            var _local_5:Array = _arg_1.messageText.split("\r");
            var _local_6:Boolean;
            for each (var _local_3:String in _local_5)
            {
                _local_2 = MessageListView._SafeStr_5807.exec(_local_3);
                if (_local_2 != null)
                {
                    if (!_local_6)
                    {
                        _local_6 = true;
                        _local_4.add("> ").add(_SafeStr_4360.localizationManager.getLocalization("groupforum.compose.skipped_quote")).add("\r");
                    };
                }
                else
                {
                    _local_4.add("> ").add(_local_3).add("\r");
                    _local_6 = false;
                };
            };
            _local_4.add("\r");
            _SafeStr_5806.text = _local_4.toString();
        }

        public function dispose():void
        {
            _SafeStr_4582.stop();
            _SafeStr_4582.removeEventListener("timer", onTimerEvent);
            _SafeStr_4582 = null;
            _SafeStr_4360.composeMessageView = null;
            _window.dispose();
            _window = null;
        }

        private function onTimerEvent(_arg_1:TimerEvent):void
        {
            validateInputs();
        }

        private function onHeaderKeyUpEvent(_arg_1:WindowKeyboardEvent):void
        {
            validateInputs();
        }

        private function onMessageKeyUpEvent(_arg_1:WindowKeyboardEvent):void
        {
            validateInputs();
        }

        private function onTopAreaClick(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4360.context.createLinkEvent(("group/" + _SafeStr_5321.groupId));
        }

        private function onPostButtonClick(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_5803)
            {
                return;
            };
            validateInputs();
            if (_hasErrors)
            {
                return;
            };
            _SafeStr_5803 = true;
            _SafeStr_5805.disable();
            _SafeStr_5806.disable();
            _postButton.disable();
            _status.caption = _SafeStr_4360.localizationManager.getLocalization("groupforum.compose.posting");
            if (_SafeStr_5804)
            {
                _SafeStr_4360.postNewMessage(_SafeStr_5321.groupId, _SafeStr_5804.threadId, _SafeStr_5806.text);
            }
            else
            {
                _SafeStr_4360.postNewThread(_SafeStr_5321.groupId, _SafeStr_5805.text, _SafeStr_5806.text);
            };
        }

        private function onCancelButtonClick(_arg_1:WindowMouseEvent):void
        {
            dispose();
        }

        private function validateInputs():void
        {
            var _local_1:int;
            _hasErrors = false;
            if (!_SafeStr_5804)
            {
                if (_SafeStr_5805.text.length <= 10)
                {
                    _hasErrors = true;
                    _status.caption = _SafeStr_4360.localizationManager.getLocalization("groupforum.compose.subject_too_short");
                };
            };
            if (((!(_hasErrors)) && (_SafeStr_5806.text.length <= 10)))
            {
                _hasErrors = true;
                _status.caption = _SafeStr_4360.localizationManager.getLocalization("groupforum.compose.message_too_short");
            };
            if (((!(_hasErrors)) && (!(_SafeStr_5803))))
            {
                _local_1 = (getTimer() - _SafeStr_4360.lastPostTime);
                if (_local_1 < 30000)
                {
                    _hasErrors = true;
                    _status.caption = _SafeStr_4360.localizationManager.getLocalizationWithParams("groupforum.compose.post_cooldown", "", "time_remaining", FriendlyTime.getFriendlyTime(_SafeStr_4360.localizationManager, (((30000 - _local_1) / 1000) + 1), "", 1));
                };
            };
            if (((!(_SafeStr_5803)) && (!(_hasErrors))))
            {
                _postButton.enable();
                _status.caption = "";
            }
            else
            {
                _postButton.disable();
            };
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1560 = "_-x4" (String#4460, DoABC#4)
// _SafeStr_1633 = "_-XN" (String#3408, DoABC#4)
// _SafeStr_1644 = "_-mW" (String#4106, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5321 = "_-p1M" (String#856, DoABC#4)
// _SafeStr_5803 = "_-H1" (String#11187, DoABC#4)
// _SafeStr_5804 = "_-xK" (String#4183, DoABC#4)
// _SafeStr_5805 = "_-41W" (String#6066, DoABC#4)
// _SafeStr_5806 = "_-F1i" (String#6176, DoABC#4)
// _SafeStr_5807 = "_-x1s" (String#14984, DoABC#4)
// _SafeStr_8547 = "_-t1h" (String#39365, DoABC#4)


