// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectTileCursorUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.Vector3d;

    public class RoomObjectTileCursorUpdateMessage extends RoomObjectUpdateMessage 
    {

        private var _SafeStr_4234:Number;
        private var _SafeStr_5398:String;
        private var _SafeStr_4426:Boolean;
        private var _SafeStr_5399:Boolean;

        public function RoomObjectTileCursorUpdateMessage(_arg_1:Vector3d, _arg_2:Number, _arg_3:Boolean, _arg_4:String, _arg_5:Boolean=false)
        {
            super(_arg_1, null);
            _SafeStr_4234 = _arg_2;
            _SafeStr_4426 = _arg_3;
            _SafeStr_5398 = _arg_4;
            _SafeStr_5399 = _arg_5;
        }

        public function get height():Number
        {
            return (_SafeStr_4234);
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }

        public function get sourceEventId():String
        {
            return (_SafeStr_5398);
        }

        public function get toggleVisibility():Boolean
        {
            return (_SafeStr_5399);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_4426 = "_-c1l" (String#1501, DoABC#4)
// _SafeStr_5398 = "_-hA" (String#18133, DoABC#4)
// _SafeStr_5399 = "_-X1O" (String#17318, DoABC#4)


