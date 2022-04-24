// by nota

//_-w1X._SafeStr_1535

package _-w1X
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1535 
    {

        private var _SafeStr_7699:String;
        private var _SafeStr_7700:String;
        private var _SafeStr_5635:int;
        private var _SafeStr_7701:int;
        private var _SafeStr_7702:Vector.<int>;
        private var _SafeStr_7703:Vector.<int>;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int;
            _SafeStr_7699 = _arg_1.readString();
            _SafeStr_7700 = _arg_1.readString();
            _SafeStr_5635 = _arg_1.readInteger();
            _SafeStr_7701 = _arg_1.readInteger();
            _SafeStr_7702 = new Vector.<int>(0);
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7702.push(_arg_1.readInteger());
                _local_3++;
            };
            _SafeStr_7703 = new Vector.<int>(0);
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7703.push(_arg_1.readInteger());
                _local_3++;
            };
            return (true);
        }

        public function clone():_SafeStr_1535
        {
            var _local_1:_SafeStr_1535 = new _SafeStr_1535();
            _local_1.campaignDays = _SafeStr_7701;
            _local_1.campaignImage = _SafeStr_7700;
            _local_1.campaignName = _SafeStr_7699;
            _local_1.currentDay = _SafeStr_5635;
            _local_1.missedDays = _SafeStr_7703;
            _local_1.openedDays = _SafeStr_7702;
            return (_local_1);
        }

        public function get campaignName():String
        {
            return (_SafeStr_7699);
        }

        public function get campaignImage():String
        {
            return (_SafeStr_7700);
        }

        public function get currentDay():int
        {
            return (_SafeStr_5635);
        }

        public function get campaignDays():int
        {
            return (_SafeStr_7701);
        }

        public function get openedDays():Vector.<int>
        {
            return (_SafeStr_7702);
        }

        public function get missedDays():Vector.<int>
        {
            return (_SafeStr_7703);
        }

        public function set campaignName(_arg_1:String):void
        {
            _SafeStr_7699 = _arg_1;
        }

        public function set campaignImage(_arg_1:String):void
        {
            _SafeStr_7700 = _arg_1;
        }

        public function set currentDay(_arg_1:int):void
        {
            _SafeStr_5635 = _arg_1;
        }

        public function set campaignDays(_arg_1:int):void
        {
            _SafeStr_7701 = _arg_1;
        }

        public function set openedDays(_arg_1:Vector.<int>):void
        {
            _SafeStr_7702 = _arg_1;
        }

        public function set missedDays(_arg_1:Vector.<int>):void
        {
            _SafeStr_7703 = _arg_1;
        }


    }
}//package _-w1X

// _SafeStr_1535 = "_-V1E" (String#8606, DoABC#3)
// _SafeStr_5635 = "_-W1W" (String#8714, DoABC#3)
// _SafeStr_7699 = "_-E1Z" (String#7476, DoABC#3)
// _SafeStr_7700 = "_-lH" (String#9770, DoABC#3)
// _SafeStr_7701 = "_-a1x" (String#8992, DoABC#3)
// _SafeStr_7702 = "_-r1s" (String#10142, DoABC#3)
// _SafeStr_7703 = "_-qS" (String#10081, DoABC#3)


