// by nota

//_-Y12._SafeStr_1606

package _-Y12
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1606 
    {

        private var _SafeStr_7266:int;
        private var _SafeStr_7267:int;
        private var _SafeStr_7787:Vector.<_SafeStr_1673>;

        public function _SafeStr_1606(_arg_1:IMessageDataWrapper)
        {
            var _local_2:int;
            super();
            _SafeStr_7266 = _arg_1.readInteger();
            _SafeStr_7267 = _arg_1.readInteger();
            _SafeStr_7787 = new Vector.<_SafeStr_1673>(0);
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_7787.push(new _SafeStr_1673(_arg_1));
                _local_2++;
            };
        }

        public function get dayIndex():int
        {
            return (_SafeStr_7266);
        }

        public function get stepIndex():int
        {
            return (_SafeStr_7267);
        }

        public function get options():Vector.<_SafeStr_1673>
        {
            return (_SafeStr_7787);
        }


    }
}//package _-Y12

// _SafeStr_1606 = "_-22U" (String#6669, DoABC#3)
// _SafeStr_1673 = "_-j14" (String#9584, DoABC#3)
// _SafeStr_7266 = "_-Dq" (String#7459, DoABC#3)
// _SafeStr_7267 = "_-j1e" (String#9605, DoABC#3)
// _SafeStr_7787 = "_-lI" (String#9771, DoABC#3)


