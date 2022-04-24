// by nota

//com.sulake.habbo.friendlist.RoomInviteView

package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import _-Po._SafeStr_1016;
    import com.sulake.habbo.friendlist.domain.Friend;

    public class RoomInviteView extends AlertView 
    {

        private var _selected:Array;
        private var _inputMessage:ITextFieldWindow;

        public function RoomInviteView(_arg_1:HabboFriendList)
        {
            super(_arg_1, "room_invite_confirm");
            _selected = _arg_1.categories.getSelectedFriends();
        }

        override public function dispose():void
        {
            _selected = null;
            _inputMessage = null;
            super.dispose();
        }

        override internal function setupContent(_arg_1:_SafeStr_3133):void
        {
            friendList.registerParameter("friendlist.invite.summary", "count", ("" + _selected.length));
            _inputMessage = ITextFieldWindow(_arg_1.findChildByName("message_input"));
            _inputMessage.addEventListener("WKE_KEY_DOWN", onMessageInput);
            _arg_1.findChildByName("cancel").procedure = onClose;
            _arg_1.findChildByName("ok").procedure = onInvite;
        }

        private function onInvite(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Invite Ok clicked");
            sendMsg();
            dispose();
        }

        private function onMessageInput(_arg_1:WindowKeyboardEvent):void
        {
            var _local_2:int;
            var _local_3:* = null;
            var _local_4:_SafeStr_3109 = _SafeStr_3109(_arg_1.target);
            _SafeStr_14.log(((((("Test key event " + _arg_1) + ", ") + _arg_1.type) + " ") + _local_4.name));
            if (_arg_1.charCode == 13)
            {
                sendMsg();
            }
            else
            {
                _local_2 = 120;
                _local_3 = _inputMessage.text;
                if (_local_3.length > _local_2)
                {
                    _inputMessage.text = _local_3.substring(0, _local_2);
                };
            };
        }

        private function sendMsg():void
        {
            var _local_3:String = _inputMessage.text;
            _SafeStr_14.log(("Send msg: " + _local_3));
            if (_local_3 == "")
            {
                friendList.simpleAlert("${friendlist.invite.emptyalert.title}", "${friendlist.invite.emptyalert.text}");
                return;
            };
            var _local_1:_SafeStr_1016 = new _SafeStr_1016(_local_3);
            for each (var _local_2:Friend in _selected)
            {
                _local_1.addInvitedFriend(_local_2.id);
            };
            friendList.resetLastRoomInvitationTime();
            friendList.send(_local_1);
            dispose();
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_1016 = "_-w1U" (String#22942, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


