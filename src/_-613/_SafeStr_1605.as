// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-613._SafeStr_1605

package _-613
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1605 
    {

        private var _SafeStr_7098:int;
        private var _SafeStr_7102:int;
        private var _amount:int;
        private var _SafeStr_4838:String;

        public function _SafeStr_1605(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String)
        {
            _SafeStr_7098 = _arg_1;
            _SafeStr_7102 = _arg_2;
            _amount = _arg_3;
            _SafeStr_4838 = _arg_4;
        }

        public function get rewardCategory():int
        {
            return (_SafeStr_7098);
        }

        public function get rewardType():int
        {
            return (_SafeStr_7102);
        }

        public function get amount():int
        {
            return (_amount);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }


    }
}//package _-613

// _SafeStr_1605 = "_-61K" (String#6945, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_7098 = "_-Z1i" (String#8907, DoABC#3)
// _SafeStr_7102 = "_-uc" (String#10358, DoABC#3)


