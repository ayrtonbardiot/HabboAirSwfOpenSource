// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.tabs.tokens.AchievementToken

package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.habbo.friendbar.data._SafeStr_3377;
    import com.sulake.habbo.friendbar.data.IFriendNotification;
    import com.sulake.habbo.localization._SafeStr_18;

    public class AchievementToken extends Token 
    {

        public function AchievementToken(_arg_1:_SafeStr_3377, _arg_2:IFriendNotification, _arg_3:_SafeStr_18)
        {
            super(_arg_2);
            var _local_4:String = _arg_3.getBadgeName(_arg_2.message);
            prepare("${friendbar.notify.achievement}", _local_4, "message_piece_xml", "friend_bar_event_notification_icon");
        }

    }
}//package com.sulake.habbo.friendbar.view.tabs.tokens

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3377 = "_-1d" (String#2910, DoABC#4)


