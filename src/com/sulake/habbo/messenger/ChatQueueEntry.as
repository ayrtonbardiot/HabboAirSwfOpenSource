// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.messenger.ChatQueueEntry

package com.sulake.habbo.messenger
{
    public class ChatQueueEntry 
    {

        private var _SafeStr_5856:int;
        private var _chatEntry:ChatEntry;
        private var _SafeStr_5857:Boolean;

        public function ChatQueueEntry(_arg_1:int, _arg_2:ChatEntry, _arg_3:Boolean)
        {
            _SafeStr_5856 = _arg_1;
            _chatEntry = _arg_2;
            _SafeStr_5857 = _arg_3;
        }

        public function get conversationId():int
        {
            return (_SafeStr_5856);
        }

        public function get chatEntry():ChatEntry
        {
            return (_chatEntry);
        }

        public function get updateIndicator():Boolean
        {
            return (_SafeStr_5857);
        }


    }
}//package com.sulake.habbo.messenger

// _SafeStr_5856 = "_-l7" (String#18061, DoABC#4)
// _SafeStr_5857 = "_-qY" (String#17869, DoABC#4)


