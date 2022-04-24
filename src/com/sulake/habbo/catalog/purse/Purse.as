// by nota

//com.sulake.habbo.catalog.purse.Purse

package com.sulake.habbo.catalog.purse
{
    import flash.utils.Dictionary;
    import flash.utils.getTimer;

    public class Purse implements _SafeStr_3142 
    {

        private var _SafeStr_4264:int = 0;
        private var _SafeStr_4267:Dictionary = new Dictionary();
        private var _SafeStr_4137:int = 0;
        private var _SafeStr_4138:int = 0;
        private var _SafeStr_4141:Boolean = false;
        private var _SafeStr_4265:int = 0;
        private var _SafeStr_4266:int = 0;
        private var _isExpiring:Boolean = false;
        private var _minutesUntilExpiration:int = 0;
        private var _SafeStr_4143:int;
        private var _SafeStr_4142:int;


        public function get credits():int
        {
            return (_SafeStr_4264);
        }

        public function set credits(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4264 = _arg_1;
        }

        public function get clubDays():int
        {
            return (_SafeStr_4137);
        }

        public function set clubDays(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4137 = _arg_1;
        }

        public function get clubPeriods():int
        {
            return (_SafeStr_4138);
        }

        public function set clubPeriods(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4138 = _arg_1;
        }

        public function get hasClubLeft():Boolean
        {
            return ((_SafeStr_4137 > 0) || (_SafeStr_4138 > 0));
        }

        public function get isVIP():Boolean
        {
            return (_SafeStr_4141);
        }

        public function get isExpiring():Boolean
        {
            return (_isExpiring);
        }

        public function set isExpiring(_arg_1:Boolean):void
        {
            _isExpiring = _arg_1;
        }

        public function set isVIP(_arg_1:Boolean):void
        {
            _SafeStr_4141 = _arg_1;
        }

        public function get pastClubDays():int
        {
            return (_SafeStr_4265);
        }

        public function set pastClubDays(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4265 = _arg_1;
        }

        public function get pastVipDays():int
        {
            return (_SafeStr_4266);
        }

        public function set pastVipDays(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4266 = _arg_1;
        }

        public function get activityPoints():Dictionary
        {
            return (_SafeStr_4267);
        }

        public function set activityPoints(_arg_1:Dictionary):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4267 = _arg_1;
        }

        public function getActivityPointsForType(_arg_1:int):int
        {
            return (_SafeStr_4267[_arg_1]);
        }

        public function set minutesUntilExpiration(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _minutesUntilExpiration = _arg_1;
        }

        public function get minutesUntilExpiration():int
        {
            var _local_1:int = int(((getTimer() - _SafeStr_4142) / 60000));
            var _local_2:int = (_minutesUntilExpiration - _local_1);
            return ((_local_2 > 0) ? _local_2 : 0);
        }

        public function set minutesSinceLastModified(_arg_1:int):void
        {
            _SafeStr_4142 = getTimer();
            _SafeStr_4143 = _arg_1;
        }

        public function get minutesSinceLastModified():int
        {
            return (_SafeStr_4143);
        }

        public function get lastUpdated():int
        {
            return (_SafeStr_4142);
        }


    }
}//package com.sulake.habbo.catalog.purse

// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_4137 = "_-z15" (String#5866, DoABC#4)
// _SafeStr_4138 = "_-31Q" (String#8426, DoABC#4)
// _SafeStr_4141 = "_-Jm" (String#9086, DoABC#4)
// _SafeStr_4142 = "_-WL" (String#2459, DoABC#4)
// _SafeStr_4143 = "_-C1l" (String#9923, DoABC#4)
// _SafeStr_4264 = "_-CR" (String#22476, DoABC#4)
// _SafeStr_4265 = "_-8F" (String#22150, DoABC#4)
// _SafeStr_4266 = "_-eQ" (String#19001, DoABC#4)
// _SafeStr_4267 = "_-BP" (String#10591, DoABC#4)


