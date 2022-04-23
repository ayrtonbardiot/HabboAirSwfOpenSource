// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.purse.Purse

package com.sulake.habbo.inventory.purse
{
    import flash.utils.getTimer;

    public class Purse 
    {

        private var _isExpiring:Boolean = false;
        private var _isCitizenshipVipExpiring:Boolean = false;
        private var _SafeStr_4137:int = 0;
        private var _SafeStr_4138:int = 0;
        private var _SafeStr_4139:int = 0;
        private var _SafeStr_4140:Boolean = false;
        private var _SafeStr_4141:Boolean = false;
        private var _minutesUntilExpiration:int = 0;
        private var _SafeStr_4143:int = -1;
        private var _SafeStr_4142:int;


        public function get clubDays():int
        {
            return (_SafeStr_4137);
        }

        public function set clubDays(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4137 = Math.max(0, _arg_1);
        }

        public function get clubPeriods():int
        {
            return (_SafeStr_4138);
        }

        public function set clubPeriods(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4138 = Math.max(0, _arg_1);
        }

        public function get clubPastPeriods():int
        {
            return (_SafeStr_4139);
        }

        public function set clubPastPeriods(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4139 = Math.max(0, _arg_1);
        }

        public function get clubHasEverBeenMember():Boolean
        {
            return (_SafeStr_4140);
        }

        public function set clubHasEverBeenMember(_arg_1:Boolean):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4140 = _arg_1;
        }

        public function get isVIP():Boolean
        {
            return (_SafeStr_4141);
        }

        public function set isVIP(_arg_1:Boolean):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4141 = _arg_1;
        }

        public function get minutesUntilExpiration():int
        {
            var _local_1:int = int(((getTimer() - _SafeStr_4142) / 60000));
            var _local_2:int = (_minutesUntilExpiration - _local_1);
            return ((_local_2 > 0) ? _local_2 : 0);
        }

        public function set minutesUntilExpiration(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _minutesUntilExpiration = _arg_1;
        }

        public function get clubIsExpiring():Boolean
        {
            return (_isExpiring);
        }

        public function set clubIsExpiring(_arg_1:Boolean):void
        {
            _isExpiring = _arg_1;
        }

        public function get citizenshipVipIsExpiring():Boolean
        {
            return (_isCitizenshipVipExpiring);
        }

        public function set citizenshipVipIsExpiring(_arg_1:Boolean):void
        {
            _isCitizenshipVipExpiring = _arg_1;
        }

        public function get minutesSinceLastModified():int
        {
            return (_SafeStr_4143);
        }

        public function set minutesSinceLastModified(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4143 = _arg_1;
        }


    }
}//package com.sulake.habbo.inventory.purse

// _SafeStr_4137 = "_-z15" (String#5866, DoABC#4)
// _SafeStr_4138 = "_-31Q" (String#8426, DoABC#4)
// _SafeStr_4139 = "_-RX" (String#18622, DoABC#4)
// _SafeStr_4140 = "_-b1V" (String#16066, DoABC#4)
// _SafeStr_4141 = "_-Jm" (String#9086, DoABC#4)
// _SafeStr_4142 = "_-WL" (String#2459, DoABC#4)
// _SafeStr_4143 = "_-C1l" (String#9923, DoABC#4)


