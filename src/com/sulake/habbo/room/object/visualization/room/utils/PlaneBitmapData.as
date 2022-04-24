// by nota

//com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData

package com.sulake.habbo.room.object.visualization.room.utils
{
    import flash.display.BitmapData;

    public class PlaneBitmapData 
    {

        private var _bitmap:BitmapData = null;
        private var _SafeStr_5415:int = 0;

        public function PlaneBitmapData(_arg_1:BitmapData, _arg_2:int)
        {
            _bitmap = _arg_1;
            _SafeStr_5415 = _arg_2;
        }

        public function get bitmap():BitmapData
        {
            return (_bitmap);
        }

        public function get timeStamp():int
        {
            return (_SafeStr_5415);
        }

        public function dispose():void
        {
            _bitmap = null;
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.utils

// _SafeStr_5415 = "_-f15" (String#4009, DoABC#4)


