// by nota

//com.sulake.habbo.freeflowchat.data.ChatItem

package com.sulake.habbo.freeflowchat.data
{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;

    public class ChatItem 
    {

        private var _SafeStr_4938:int = 0;
        private var _SafeStr_4128:int = 0;
        private var _SafeStr_3693:int = 0;
        private var _text:String = "";
        private var _SafeStr_4129:int = 0;
        private var _SafeStr_4130:Array;
        private var _style:int;
        private var _userLocation:IVector3d;
        private var _forcedColor:*;
        private var _forcedScreenLocation:*;
        private var _SafeStr_4939:String;
        private var _forcedUserName:String;
        private var _SafeStr_4131:int;

        public function ChatItem(_arg_1:RoomSessionChatEvent, _arg_2:int, _arg_3:IVector3d=null, _arg_4:int=0, _arg_5:*=null, _arg_6:*=null, _arg_7:String=null, _arg_8:String=null)
        {
            _SafeStr_4938 = _arg_2;
            _userLocation = _arg_3;
            _SafeStr_4128 = _arg_1.userId;
            if (_arg_1.session)
            {
                _SafeStr_3693 = _arg_1.session.roomId;
            }
            else
            {
                _SafeStr_3693 = 1;
            };
            _text = _arg_1.text;
            _SafeStr_4129 = _arg_1.chatType;
            _style = _arg_1.style;
            _SafeStr_4130 = new Array(_arg_1.links);
            _forcedColor = _arg_6;
            _forcedScreenLocation = _arg_5;
            _SafeStr_4939 = _arg_7;
            _forcedUserName = _arg_8;
            _SafeStr_4131 = _arg_4;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get chatType():int
        {
            return (_SafeStr_4129);
        }

        public function get links():Array
        {
            return (_SafeStr_4130);
        }

        public function get style():int
        {
            return (_style);
        }

        public function get timeStamp():uint
        {
            return (_SafeStr_4938);
        }

        public function get userLocation():IVector3d
        {
            return (_userLocation);
        }

        public function get forcedColor():*
        {
            return (_forcedColor);
        }

        public function get forcedScreenLocation():*
        {
            return (_forcedScreenLocation);
        }

        public function get forcedFigure():String
        {
            return (_SafeStr_4939);
        }

        public function get forcedUserName():String
        {
            return (_forcedUserName);
        }

        public function get extraParam():int
        {
            return (_SafeStr_4131);
        }

        public function set text(_arg_1:String):void
        {
            _text = _arg_1;
        }


    }
}//package com.sulake.habbo.freeflowchat.data

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4129 = "_-c1k" (String#2784, DoABC#4)
// _SafeStr_4130 = "_-q1K" (String#6080, DoABC#4)
// _SafeStr_4131 = "_-p1c" (String#2883, DoABC#4)
// _SafeStr_4938 = "_-wS" (String#18491, DoABC#4)
// _SafeStr_4939 = "_-z13" (String#19516, DoABC#4)


