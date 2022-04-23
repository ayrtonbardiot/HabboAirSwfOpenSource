// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.events.FriendBarUpdateEvent

package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class FriendBarUpdateEvent extends Event 
    {

        public static const FRIEND_LIST_UPDATED:String = "FBE_UPDATED";

        public function FriendBarUpdateEvent()
        {
            super("FBE_UPDATED", false, false);
        }

    }
}//package com.sulake.habbo.friendbar.events

