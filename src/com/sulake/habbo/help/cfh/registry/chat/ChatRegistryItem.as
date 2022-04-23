// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.help.cfh.registry.chat.ChatRegistryItem

package com.sulake.habbo.help.cfh.registry.chat
{
    public class ChatRegistryItem 
    {

        private var _SafeStr_4128:int;
        private var _userName:String = "";
        private var _text:String = "";
        private var _SafeStr_3693:int;
        private var _roomName:String = "";
        private var _selected:Boolean;
        private var _index:uint;
        private var _chatTime:Date;

        public function ChatRegistryItem(_arg_1:uint, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String, _arg_6:String)
        {
            _index = _arg_1;
            _SafeStr_3693 = _arg_2;
            _roomName = _arg_3;
            _SafeStr_4128 = _arg_4;
            _userName = _arg_5;
            _text = _arg_6;
            _selected = false;
            _chatTime = new Date();
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
        }

        public function get index():int
        {
            return (_index);
        }

        public function get chatTime():Date
        {
            return (_chatTime);
        }


    }
}//package com.sulake.habbo.help.cfh.registry.chat

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)


