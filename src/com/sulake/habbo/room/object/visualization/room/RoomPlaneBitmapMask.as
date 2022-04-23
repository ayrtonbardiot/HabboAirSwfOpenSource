// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.RoomPlaneBitmapMask

package com.sulake.habbo.room.object.visualization.room
{
    public class RoomPlaneBitmapMask 
    {

        private var _SafeStr_4028:String = null;
        private var _SafeStr_6795:Number = 0;
        private var _SafeStr_6796:Number = 0;

        public function RoomPlaneBitmapMask(_arg_1:String, _arg_2:Number, _arg_3:Number)
        {
            _SafeStr_4028 = _arg_1;
            _SafeStr_6795 = _arg_2;
            _SafeStr_6796 = _arg_3;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get leftSideLoc():Number
        {
            return (_SafeStr_6795);
        }

        public function get rightSideLoc():Number
        {
            return (_SafeStr_6796);
        }


    }
}//package com.sulake.habbo.room.object.visualization.room

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_6795 = "_-c1M" (String#9702, DoABC#4)
// _SafeStr_6796 = "_-CM" (String#9270, DoABC#4)


