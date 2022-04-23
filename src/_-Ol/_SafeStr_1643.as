// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ol._SafeStr_1643

package _-Ol
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1643 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4050:Number = 0;
        private var _SafeStr_4051:Number = 0;
        private var _SafeStr_4052:Number = 0;
        private var _SafeStr_7475:Number = 0;
        private var _SafeStr_6637:Number = 0;
        private var _SafeStr_6638:Number = 0;
        private var _SafeStr_7476:Number = 0;
        private var _SafeStr_4049:int = 0;
        private var _SafeStr_5408:int = 0;
        private var _SafeStr_4249:Array = [];
        private var _SafeStr_6382:Boolean = false;
        private var _SafeStr_5409:Boolean = false;

        public function _SafeStr_1643(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:int, _arg_7:int, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Array)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4050 = _arg_2;
            _SafeStr_4051 = _arg_3;
            _SafeStr_4052 = _arg_4;
            _SafeStr_7475 = _arg_5;
            _SafeStr_4049 = _arg_6;
            _SafeStr_5408 = _arg_7;
            _SafeStr_6637 = _arg_8;
            _SafeStr_6638 = _arg_9;
            _SafeStr_7476 = _arg_10;
            _SafeStr_6382 = _arg_11;
            _SafeStr_5409 = _arg_12;
            _SafeStr_4249 = _arg_13;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get x():Number
        {
            return (_SafeStr_4050);
        }

        public function get y():Number
        {
            return (_SafeStr_4051);
        }

        public function get z():Number
        {
            return (_SafeStr_4052);
        }

        public function get localZ():Number
        {
            return (_SafeStr_7475);
        }

        public function get targetX():Number
        {
            return (_SafeStr_6637);
        }

        public function get targetY():Number
        {
            return (_SafeStr_6638);
        }

        public function get targetZ():Number
        {
            return (_SafeStr_7476);
        }

        public function get dir():int
        {
            return (_SafeStr_4049);
        }

        public function get dirHead():int
        {
            return (_SafeStr_5408);
        }

        public function get isMoving():Boolean
        {
            return (_SafeStr_6382);
        }

        public function get canStandUp():Boolean
        {
            return (_SafeStr_5409);
        }

        public function get actions():Array
        {
            return (_SafeStr_4249.slice());
        }


    }
}//package _-Ol

// _SafeStr_1643 = "_-5D" (String#6907, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4049 = "_-W12" (String#8660, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_4052 = "_-Rt" (String#8388, DoABC#3)
// _SafeStr_4249 = "_-Mb" (String#8030, DoABC#3)
// _SafeStr_5408 = "_-c10" (String#9101, DoABC#3)
// _SafeStr_5409 = "_-Ox" (String#8220, DoABC#3)
// _SafeStr_6382 = "_-81A" (String#7071, DoABC#3)
// _SafeStr_6637 = "_-K11" (String#7861, DoABC#3)
// _SafeStr_6638 = "_-kM" (String#9701, DoABC#3)
// _SafeStr_7475 = "_-Rf" (String#8382, DoABC#3)
// _SafeStr_7476 = "_-XE" (String#8798, DoABC#3)


