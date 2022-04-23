// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-V1k._SafeStr_1616

package _-V1k
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.getTimer;

    [SecureSWF(rename="true")]
    public class _SafeStr_1616 implements _SafeStr_13 
    {

        public static const STATE_OPEN:int = 1;
        public static const _SafeStr_7599:int = 2;
        public static const _SafeStr_7600:int = 3;

        private var _SafeStr_7593:int;
        private var _SafeStr_3734:int;
        private var _SafeStr_4674:int;
        private var _SafeStr_7601:int;
        private var _SafeStr_6387:Number;
        private var _priority:int;
        private var _SafeStr_6384:int;
        private var _SafeStr_7602:int;
        private var _SafeStr_7603:String;
        private var _SafeStr_5240:int;
        private var _reportedUserName:String;
        private var _SafeStr_6383:int;
        private var _SafeStr_7604:String;
        private var _SafeStr_4132:String;
        private var _SafeStr_7605:int;
        private var _SafeStr_7606:Array;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_7607:Number;

        public function _SafeStr_1616(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Number, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:String, _arg_10:int, _arg_11:String, _arg_12:int, _arg_13:String, _arg_14:String, _arg_15:int, _arg_16:Array)
        {
            _SafeStr_7593 = _arg_1;
            _SafeStr_3734 = _arg_2;
            _SafeStr_4674 = _arg_3;
            _SafeStr_7601 = _arg_4;
            _SafeStr_6387 = _arg_5;
            _priority = _arg_6;
            _SafeStr_6384 = _arg_7;
            _SafeStr_7602 = _arg_8;
            _SafeStr_7603 = _arg_9;
            _SafeStr_5240 = _arg_10;
            _reportedUserName = _arg_11;
            _SafeStr_6383 = _arg_12;
            _SafeStr_7604 = _arg_13;
            _SafeStr_4132 = _arg_14;
            _SafeStr_7605 = _arg_15;
            _SafeStr_7606 = _arg_16;
            _SafeStr_7607 = getTimer();
        }

        public function get issueId():int
        {
            return (_SafeStr_7593);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function get reportedCategoryId():int
        {
            return (_SafeStr_7601);
        }

        public function get issueAgeInMilliseconds():Number
        {
            return (_SafeStr_6387);
        }

        public function get priority():int
        {
            return (_priority);
        }

        public function get groupingId():int
        {
            return (_SafeStr_6384);
        }

        public function get reporterUserId():int
        {
            return (_SafeStr_7602);
        }

        public function get reporterUserName():String
        {
            return (_SafeStr_7603);
        }

        public function get reportedUserId():int
        {
            return (_SafeStr_5240);
        }

        public function get reportedUserName():String
        {
            return (_reportedUserName);
        }

        public function get pickerUserId():int
        {
            return (_SafeStr_6383);
        }

        public function get pickerUserName():String
        {
            return (_SafeStr_7604);
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function get chatRecordId():int
        {
            return (_SafeStr_7605);
        }

        public function get patterns():Array
        {
            return (_SafeStr_7606);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            for each (var _local_1:_SafeStr_1576 in _SafeStr_7606)
            {
                _local_1.dispose();
            };
            _SafeStr_7606 = [];
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function getOpenTime(_arg_1:int):String
        {
            var _local_7:int = int((((_SafeStr_6387 + _arg_1) - _SafeStr_7607) / 1000));
            var _local_5:int = int((_local_7 / 60));
            var _local_6:int = (_local_5 % 60);
            var _local_4:int = int((_local_5 / 60));
            var _local_2:String = (((_local_6 < 10) ? "0" : "") + _local_6);
            var _local_3:String = (((_local_4 < 10) ? "0" : "") + _local_4);
            return ((_local_3 + ":") + _local_2);
        }


    }
}//package _-V1k

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1576 = "_-h15" (String#9456, DoABC#3)
// _SafeStr_1616 = "_-Jg" (String#7849, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_4036 = "_-Mr" (String#8042, DoABC#3)
// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)
// _SafeStr_4674 = "_-k10" (String#9658, DoABC#3)
// _SafeStr_5240 = "_-T19" (String#8474, DoABC#3)
// _SafeStr_6383 = "_-O12" (String#8130, DoABC#3)
// _SafeStr_6384 = "_-ow" (String#9965, DoABC#3)
// _SafeStr_6387 = "_-11r" (String#6557, DoABC#3)
// _SafeStr_7593 = "_-fe" (String#9372, DoABC#3)
// _SafeStr_7599 = "_-E1S" (String#7473, DoABC#3)
// _SafeStr_7600 = "_-21h" (String#6646, DoABC#3)
// _SafeStr_7601 = "_-N16" (String#8052, DoABC#3)
// _SafeStr_7602 = "_-y1I" (String#10583, DoABC#3)
// _SafeStr_7603 = "_-K17" (String#7862, DoABC#3)
// _SafeStr_7604 = "_-WB" (String#8732, DoABC#3)
// _SafeStr_7605 = "_-cQ" (String#9142, DoABC#3)
// _SafeStr_7606 = "_-h1D" (String#9460, DoABC#3)
// _SafeStr_7607 = "_-l1F" (String#9738, DoABC#3)


