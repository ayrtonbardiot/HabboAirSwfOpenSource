﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.messenger.events.NewMessageEvent

package com.sulake.habbo.messenger.events
{
    import flash.events.Event;

    public class NewMessageEvent extends Event 
    {

        public static const NEW_INSTANT_MESSAGE:String = "FBE_MESSAGE";

        public var notify:Boolean;
        public var senderId:int;

        public function NewMessageEvent(_arg_1:Boolean, _arg_2:int)
        {
            super("FBE_MESSAGE", false, false);
            this.notify = _arg_1;
            this.senderId = _arg_2;
        }

    }
}//package com.sulake.habbo.messenger.events

