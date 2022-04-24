// by nota

//com.sulake.habbo.friendbar.view.tabs.tokens.RoomEventToken

package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.habbo.friendbar.data._SafeStr_3377;
    import com.sulake.habbo.friendbar.data.IFriendNotification;

    public class RoomEventToken extends Token 
    {

        public function RoomEventToken(_arg_1:_SafeStr_3377, _arg_2:IFriendNotification)
        {
            super(_arg_2);
            prepare("${friendbar.notify.event}", _arg_2.message, "message_piece_xml", "friend_bar_event_notification_icon");
        }

    }
}//package com.sulake.habbo.friendbar.view.tabs.tokens

// _SafeStr_3377 = "_-1d" (String#2910, DoABC#4)


