// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.tabs.tokens.QuestToken

package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.habbo.friendbar.data._SafeStr_3377;
    import com.sulake.habbo.friendbar.data.IFriendNotification;

    public class QuestToken extends Token 
    {

        public function QuestToken(_arg_1:_SafeStr_3377, _arg_2:IFriendNotification)
        {
            super(_arg_2);
            var _local_3:String = (("${quests." + _arg_2.message) + ".name}");
            prepare("${friendbar.notify.quest}", _local_3, "message_piece_xml", "friend_bar_event_notification_icon");
        }

    }
}//package com.sulake.habbo.friendbar.view.tabs.tokens

// _SafeStr_3377 = "_-1d" (String#2910, DoABC#4)


