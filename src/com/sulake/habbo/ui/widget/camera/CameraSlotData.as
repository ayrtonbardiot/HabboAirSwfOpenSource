// by nota

//com.sulake.habbo.ui.widget.camera.CameraSlotData

package com.sulake.habbo.ui.widget.camera
{
    import flash.display.BitmapData;

    public class CameraSlotData 
    {

        public var image:BitmapData;
        private var _SafeStr_4810:Date;
        public var isEmpty:Boolean;


        public function setDate(_arg_1:Date):void
        {
            _SafeStr_4810 = _arg_1;
        }

        public function get dateString():String
        {
            return ((((((((_SafeStr_4810.date + "/") + (_SafeStr_4810.month + 1)) + "/") + _SafeStr_4810.getFullYear()) + " ") + _SafeStr_4810.getHours()) + ":") + addLeadingZero(_SafeStr_4810.getMinutes()));
        }

        private function addLeadingZero(_arg_1:int):String
        {
            var _local_2:String = _arg_1.toString();
            if (_local_2.length == 1)
            {
                _local_2 = ("0" + _local_2);
            };
            return (_local_2);
        }

        public function getDateTimestamp():int
        {
            return (_SafeStr_4810.time);
        }


    }
}//package com.sulake.habbo.ui.widget.camera

// _SafeStr_4810 = "_-zn" (String#3201, DoABC#4)


