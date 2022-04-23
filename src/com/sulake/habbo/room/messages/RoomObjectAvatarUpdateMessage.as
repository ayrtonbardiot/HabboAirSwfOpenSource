// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectAvatarUpdateMessage extends RoomObjectMoveUpdateMessage 
    {

        private var _SafeStr_5408:int;
        private var _SafeStr_5409:Boolean;
        private var _SafeStr_5334:Number;

        public function RoomObjectAvatarUpdateMessage(_arg_1:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:int, _arg_5:Boolean, _arg_6:Number)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_5408 = _arg_4;
            _SafeStr_5409 = _arg_5;
            _SafeStr_5334 = _arg_6;
        }

        public function get dirHead():int
        {
            return (_SafeStr_5408);
        }

        public function get canStandUp():Boolean
        {
            return (_SafeStr_5409);
        }

        public function get baseY():Number
        {
            return (_SafeStr_5334);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_5334 = "_-N1e" (String#7790, DoABC#4)
// _SafeStr_5408 = "_-c10" (String#17795, DoABC#4)
// _SafeStr_5409 = "_-Ox" (String#18653, DoABC#4)


