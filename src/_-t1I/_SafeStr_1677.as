// by nota

//_-t1I._SafeStr_1677

package _-t1I
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.utils._SafeStr_401;

    [SecureSWF(rename="true")]
    public class _SafeStr_1677 
    {

        private var _SafeStr_3623:int;
        private var _SafeStr_3734:int;
        private var _SafeStr_7549:Vector.<_SafeStr_1664> = new Vector.<_SafeStr_1664>();
        private var _SafeStr_7534:Vector.<_SafeStr_1646> = new Vector.<_SafeStr_1646>();
        private var _SafeStr_7535:Vector.<_SafeStr_1591> = new Vector.<_SafeStr_1591>();


        public function parse(_arg_1:IMessageDataWrapper):void
        {
            var _local_2:int;
            var _local_3:int;
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_3734 = _arg_1.readInteger();
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7549.push(new _SafeStr_1664(_arg_1));
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7534.push(new _SafeStr_1646(_arg_1));
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7535.push(new _SafeStr_1591(_arg_1));
                _local_3++;
            };
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function set level(_arg_1:int):void
        {
            _SafeStr_3623 = _arg_1;
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function set state(_arg_1:int):void
        {
            _SafeStr_3734 = _arg_1;
        }

        public function get tasks():Vector.<_SafeStr_1664>
        {
            return (_SafeStr_7549);
        }

        public function get rewardPerks():Vector.<_SafeStr_1646>
        {
            return (_SafeStr_7534);
        }

        public function get rewardProducts():Vector.<_SafeStr_1591>
        {
            return (_SafeStr_7535);
        }

        public function get rewardCount():int
        {
            return (_SafeStr_7534.length + _SafeStr_7535.length);
        }

        public function get levelProgress():Number
        {
            var _local_2:Number = (1 / _SafeStr_7549.length);
            var _local_3:* = 0;
            for each (var _local_1:_SafeStr_1664 in _SafeStr_7549)
            {
                if (_local_1.state == 2)
                {
                    _local_3 = (_local_3 + _local_2);
                };
            };
            return (_SafeStr_401.clamp(_local_3));
        }

        public function findTaskByAchievementId(_arg_1:int):_SafeStr_1664
        {
            for each (var _local_2:_SafeStr_1664 in _SafeStr_7549)
            {
                if (_local_2.achievementId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }


    }
}//package _-t1I

// _SafeStr_1591 = "_-e1N" (String#9272, DoABC#3)
// _SafeStr_1646 = "_-o1n" (String#9936, DoABC#3)
// _SafeStr_1664 = "_-CZ" (String#7397, DoABC#3)
// _SafeStr_1677 = "_-N15" (String#8051, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_401 = "_-e1d" (String#9279, DoABC#3)
// _SafeStr_7534 = "_-4O" (String#6850, DoABC#3)
// _SafeStr_7535 = "_-G1w" (String#7612, DoABC#3)
// _SafeStr_7549 = "_-L1Y" (String#7949, DoABC#3)


