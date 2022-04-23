// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const WIDGET_UPDATE_EVENT_CHAT:String = "RWCUE_EVENT_CHAT";
        public static const CHAT_TYPE_SPEAK:int = 0;
        public static const CHAT_TYPE_WHISPER:int = 1;
        public static const CHAT_TYPE_SHOUT:int = 2;
        public static const CHAT_TYPE_RESPECT:int = 3;
        public static const CHAT_TYPE_PETRESPECT:int = 4;
        public static const CHAT_TYPE_NOTIFY:int = 5;
        public static const CHAT_TYPE_PETTREAT:int = 6;
        public static const CHAT_TYPE_PETREVIVE:int = 7;
        public static const CHAT_TYPE_PET_REBREED_FERTILIZE:int = 8;
        public static const CHAT_TYPE_PET_SPEED_FERTILIZE:int = 9;
        public static const CHAT_TYPE_BOT_SPEAK:int = 10;
        public static const CHAT_TYPE_BOT_SHOUT:int = 11;
        public static const CHAT_TYPE_BOT_WHISPER:int = 12;

        private var _SafeStr_4128:int = 0;
        private var _text:String = "";
        private var _SafeStr_4129:int = 0;
        private var _userName:String;
        private var _SafeStr_4130:Array;
        private var _SafeStr_6318:Number;
        private var _SafeStr_6319:Number;
        private var _SafeStr_6320:BitmapData;
        private var _userColor:uint;
        private var _SafeStr_3693:int;
        private var _SafeStr_6317:int;
        private var _SafeStr_5420:int;
        private var _SafeStr_5421:int;
        private var _SafeStr_5982:int;

        public function RoomWidgetChatUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:Number, _arg_9:Number, _arg_10:BitmapData, _arg_11:uint, _arg_12:int, _arg_13:int=0, _arg_14:int=0, _arg_15:Array=null, _arg_16:Boolean=false, _arg_17:Boolean=false)
        {
            super(_arg_1, _arg_16, _arg_17);
            _SafeStr_4128 = _arg_2;
            _text = _arg_3;
            _SafeStr_4129 = _arg_13;
            _userName = _arg_4;
            _SafeStr_6317 = _arg_5;
            _SafeStr_5420 = _arg_6;
            _SafeStr_5421 = _arg_7;
            _SafeStr_4130 = _arg_15;
            _SafeStr_6318 = _arg_8;
            _SafeStr_6319 = _arg_9;
            _SafeStr_6320 = _arg_10;
            _userColor = _arg_11;
            _SafeStr_3693 = _arg_12;
            _SafeStr_5982 = _arg_14;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get chatType():int
        {
            return (_SafeStr_4129);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get userCategory():int
        {
            return (_SafeStr_6317);
        }

        public function get userType():int
        {
            return (_SafeStr_5420);
        }

        public function get petType():int
        {
            return (_SafeStr_5421);
        }

        public function get links():Array
        {
            return (_SafeStr_4130);
        }

        public function get userX():Number
        {
            return (_SafeStr_6318);
        }

        public function get userY():Number
        {
            return (_SafeStr_6319);
        }

        public function get userImage():BitmapData
        {
            return (_SafeStr_6320);
        }

        public function get userColor():uint
        {
            return (_userColor);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get styleId():int
        {
            return (_SafeStr_5982);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4129 = "_-c1k" (String#2784, DoABC#4)
// _SafeStr_4130 = "_-q1K" (String#6080, DoABC#4)
// _SafeStr_5420 = "_-S13" (String#2704, DoABC#4)
// _SafeStr_5421 = "_-fl" (String#6414, DoABC#4)
// _SafeStr_5982 = "_-AQ" (String#7031, DoABC#4)
// _SafeStr_6317 = "_-Cl" (String#22668, DoABC#4)
// _SafeStr_6318 = "_-cn" (String#19118, DoABC#4)
// _SafeStr_6319 = "_-719" (String#19939, DoABC#4)
// _SafeStr_6320 = "_-22G" (String#20268, DoABC#4)


