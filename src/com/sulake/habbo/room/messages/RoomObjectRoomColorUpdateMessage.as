// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomColorUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const BACKGROUND_COLOR:String = "RORCUM_BACKGROUND_COLOR";

        private var _SafeStr_4028:String = "";
        private var _color:uint = 0;
        private var _SafeStr_5116:int = 0;
        private var _SafeStr_4486:Boolean = true;

        public function RoomObjectRoomColorUpdateMessage(_arg_1:String, _arg_2:uint, _arg_3:int, _arg_4:Boolean)
        {
            super(null, null);
            _SafeStr_4028 = _arg_1;
            _color = _arg_2;
            _SafeStr_5116 = _arg_3;
            _SafeStr_4486 = _arg_4;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get light():uint
        {
            return (_SafeStr_5116);
        }

        public function get bgOnly():Boolean
        {
            return (_SafeStr_4486);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4486 = "_-K1" (String#6454, DoABC#4)
// _SafeStr_5116 = "_-k6" (String#3444, DoABC#4)


