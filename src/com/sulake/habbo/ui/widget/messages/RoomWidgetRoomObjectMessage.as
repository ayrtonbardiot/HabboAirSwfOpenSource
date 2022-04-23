// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetRoomObjectMessage extends RoomWidgetMessage 
    {

        public static const GET_OBJECT_INFO:String = "RWROM_GET_OBJECT_INFO";
        public static const GET_OBJECT_NAME:String = "RWROM_GET_OBJECT_NAME";
        public static const _SafeStr_9064:String = "RWROM_SELECT_OBJECT";
        public static const GET_OWN_CHARACTER_INFO:String = "RWROM_GET_OWN_CHARACTER_INFO";
        public static const GET_AVATAR_LIST:String = "RWROM_GET_AVATAR_LIST";

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4158:int = 0;

        public function RoomWidgetRoomObjectMessage(_arg_1:String, _arg_2:int, _arg_3:int)
        {
            super(_arg_1);
            _SafeStr_3820 = _arg_2;
            _SafeStr_4158 = _arg_3;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_9064 = "_-Lj" (String#39316, DoABC#4)


