// by nota

//_-41O._SafeStr_1572

package _-41O
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1572 implements _SafeStr_13 
    {

        private var _SafeStr_7070:Boolean;
        private var _SafeStr_7071:int;
        private var _SafeStr_7072:int;
        private var _SafeStr_7073:int;
        private var _SafeStr_7074:int;
        private var _SafeStr_7075:int;
        private var _SafeStr_7076:int;
        private var _SafeStr_4259:String;
        private var _SafeStr_7077:int;
        private var _SafeStr_7069:Array = [];

        public function _SafeStr_1572(_arg_1:IMessageDataWrapper):void
        {
            var _local_3:int;
            super();
            _SafeStr_7070 = _arg_1.readBoolean();
            _SafeStr_7071 = _arg_1.readInteger();
            _SafeStr_7072 = _arg_1.readInteger();
            _SafeStr_7073 = _arg_1.readInteger();
            _SafeStr_7074 = _arg_1.readInteger();
            _SafeStr_7075 = _arg_1.readInteger();
            _SafeStr_7076 = _arg_1.readInteger();
            _SafeStr_4259 = _arg_1.readString();
            _SafeStr_7077 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7069.push(_arg_1.readInteger());
                _local_3++;
            };
        }

        public function dispose():void
        {
            _SafeStr_7069 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_7069 == null);
        }

        public function get hasGoalExpired():Boolean
        {
            return (_SafeStr_7070);
        }

        public function get personalContributionScore():int
        {
            return (_SafeStr_7071);
        }

        public function get personalContributionRank():int
        {
            return (_SafeStr_7072);
        }

        public function get communityTotalScore():int
        {
            return (_SafeStr_7073);
        }

        public function get communityHighestAchievedLevel():int
        {
            return (_SafeStr_7074);
        }

        public function get scoreRemainingUntilNextLevel():int
        {
            return (_SafeStr_7075);
        }

        public function get percentCompletionTowardsNextLevel():int
        {
            return (_SafeStr_7076);
        }

        public function get timeRemainingInSeconds():int
        {
            return (_SafeStr_7077);
        }

        public function get rewardUserLimits():Array
        {
            return (_SafeStr_7069);
        }

        public function get goalCode():String
        {
            return (_SafeStr_4259);
        }


    }
}//package _-41O

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1572 = "_-E1A" (String#7465, DoABC#3)
// _SafeStr_4259 = "_-Y1y" (String#8856, DoABC#3)
// _SafeStr_7069 = "_-D1w" (String#7439, DoABC#3)
// _SafeStr_7070 = "_-Y1G" (String#8833, DoABC#3)
// _SafeStr_7071 = "_-T1D" (String#8476, DoABC#3)
// _SafeStr_7072 = "_-Cg" (String#7401, DoABC#3)
// _SafeStr_7073 = "_-41I" (String#6807, DoABC#3)
// _SafeStr_7074 = "_-pL" (String#10008, DoABC#3)
// _SafeStr_7075 = "_-g1v" (String#9409, DoABC#3)
// _SafeStr_7076 = "_-DQ" (String#7450, DoABC#3)
// _SafeStr_7077 = "_-oj" (String#9960, DoABC#3)


