// by nota

//com.sulake.habbo.room.object.visualization.room.RoomPlaneRectangleMask

package com.sulake.habbo.room.object.visualization.room
{
    public class RoomPlaneRectangleMask 
    {

        private var _SafeStr_6795:Number = 0;
        private var _SafeStr_6796:Number = 0;
        private var _leftSideLength:Number = 0;
        private var _rightSideLength:Number = 0;

        public function RoomPlaneRectangleMask(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
        {
            _SafeStr_6795 = _arg_1;
            _SafeStr_6796 = _arg_2;
            _leftSideLength = _arg_3;
            _rightSideLength = _arg_4;
        }

        public function get leftSideLoc():Number
        {
            return (_SafeStr_6795);
        }

        public function get rightSideLoc():Number
        {
            return (_SafeStr_6796);
        }

        public function get leftSideLength():Number
        {
            return (_leftSideLength);
        }

        public function get rightSideLength():Number
        {
            return (_rightSideLength);
        }


    }
}//package com.sulake.habbo.room.object.visualization.room

// _SafeStr_6795 = "_-c1M" (String#9702, DoABC#4)
// _SafeStr_6796 = "_-CM" (String#9270, DoABC#4)


